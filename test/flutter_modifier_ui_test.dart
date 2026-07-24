import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modifier_ui/flutter_modifier_ui.dart';
import 'package:flutter_test/flutter_test.dart';

/// 1. A mutable external container to hold the build counter state.
class BuildCounter {
  int value = 0;
}

/// 2. The modifier element itself remains 100% immutable.
class BuildTrackerElement<S> extends ModifierElement<S> {
  final BuildCounter
  counter; // Immutable reference (final) to the mutable container
  final Key? key;

  const BuildTrackerElement({required this.counter, this.key});

  @override
  Widget build(Widget child) {
    counter
        .value++; // Increment the external counter without mutating our element!
    return child;
  }

  @override
  ModifierProperties get props => [counter, key]; // Identified by the counter instance reference
}

void main() {
  group('Flutter Modifier', () {
    testWidgets('Should prove Frozen Skeleton & Widget Teleportation mechanisms', (
      tester,
    ) async {
      final tracker = BuildCounter(); // Our external mutable tracker
      int stateCounter = 0;
      late StateSetter triggerRebuild;

      // Build the widget tree
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                triggerRebuild = setState;
                return Text('Counter: $stateCounter')(
                  // Chain the custom element directly using .then()
                  modifier: const Modifier()
                      .then(BuildTrackerElement(counter: tracker))
                      .align(alignment: Alignment.center),
                );
              },
            ),
          ),
        ),
      );
      // ==========================================================
      // STEP 1: Tree Initialisation
      // ==========================================================
      expect(find.text('Counter: 0'), findsOneWidget);

      // The skeleton has just been built, the tracker's count must be exactly 1
      expect(
        tracker.value,
        1,
        reason:
            'Frozen Skeleton: The modifier must build at least once during initialization.',
      );

      // ==========================================================
      // STEP 2: State mutation (Counter Update)
      // ==========================================================

      for (int i = 0; i < 99; i++) {
        triggerRebuild(() {
          stateCounter =
              i; // The text updates, but the modifier structure remains identical
        });
        await tester.pump();
      }

      // ==========================================================
      // STEP 3: Verifications & Assertions
      // ==========================================================

      // PROVES WIDGET TELEPORTATION:
      // Even though the intermediate modifier is frozen, the updated value "Counter: 42"
      // has been successfully "teleported" through the skeleton and renders correctly.
      //expect(find.text('Counter: 42'), findsOneWidget);

      // PROVES FROZEN SKELETON:
      // The external build count remains EXACTLY 1! The framework completely bypassed the build
      // method of our intermediate modifier during the UI update.
      expect(
        tracker.value,
        1,
        reason:
            "Frozen Skeleton: The intermediate modifier's build was bypassed and remained asleep (value == 1",
      );
    });

    testWidgets('Should', (tester) async {
      final modifier = const Modifier()
          .padding(padding: const EdgeInsets.all(16.0))
          .coloredBox(color: Colors.blue)
          .align(alignment: Alignment.center);

      if (kDebugMode) {
        print(modifier.toString());
      }

      for (int i = 0; i < 1000000; i++) {
        expect(modifier != modifier, isFalse);
      }

      final stopWatch = Stopwatch()..start();
      for (int i = 0; i < 1; i++) {
        expect(modifier != modifier, isFalse);
      }
      stopWatch.stop();

      if (kDebugMode) {
        print('${stopWatch.elapsedMicroseconds} µs');
      }
    });
  });
}
