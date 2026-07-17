# Flutter Modifier UI

<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

Create Flutter user interfaces using linear modifier chains and avoid recalculating layout
hierarchies that haven't changed.

## Why Flutter Modifier UI?

Flutter widgets are beautifully composable, but deeply nested structures quickly become difficult to
read, hard to navigate, and costly to maintain.

### The Standard Flutter Way

```dart
Align(
  alignment: Alignment.center,
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: ColoredBox(
      color: Colors.purple,
      child: const Text("Hello Flutter"),
    ),
  ),
)
```

### The Flutter UI Modifier Way

```dart
const Text("Hello Flutter")(
  modifier: const Modifier()
      .coloredBox(color: Colors.purple)
      .padding(padding: EdgeInsets.all(16.0))
      .align(alignment: Alignment.center),
)
```

The widget hierarchy becomes a clean linear chain, making it significantly easier to read, scan, and
refactor.

## Installation

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  flutter_modifier_ui: ^latest_version
```

In your library add the following import:

```dart
import 'package:flutter_modifier_ui/flutter_modifier_ui.dart';
```

## Layout Scopes

In Flutter, placing certain widgets in the wrong place (like an `Expanded` outside a `Flex` layout)
causes runtime layout exceptions.

**Flutter Modifier UI** enforces these rules at **compile time** using generic Scopes (
`Modifier<Scope>`). Specifying a scope unlocks only the exact modifiers authorized within that
specific layout context.

### 1. FlexScope

Scope that enables extensions for `Flex`.

**Use** `const Modifier<FlexScope>()` **ONLY** inside a parent: `Flex`, `Column`, `Row`

```dart
Row(
  children: [
    Text("Hello Flutter")(
      modifier: const Modifier<FlexScope>()
          .padding(padding: EdgeInsets.all(8.0))
          .coloredBox(color: Colors.blue)
          .expanded(flex: 2),
    ),
  ],
)
```

### 2. StackScope

Scope that enables extensions for `Stack`.

**Use** `const Modifier<StackScope>()` **ONLY** inside a parent: `Stack`

```dart
Stack(
  children: [
    Text("Hello Flutter")(
      modifier: const Modifier<StackScope>()
          .padding(padding: EdgeInsets.all(8.0))
          .coloredBox(color: Colors.blue)
          .positioned(top: 8.0, left: 8.0),
    ),
  ],
)
```

### 3. SliverScope

Scope that enables extensions for scrollable slivers.

**Use** `const Modifier<SliverScope>()` **ONLY** inside a parent: `CustomScrollView`,
`NestedScrollView`, `ShrinkWrappingViewport`, `Viewport`

```dart
CustomScrollView(
  slivers: [
    Text("Hello Flutter")(
      modifier: const Modifier<SliverScope>()
          .padding(padding: EdgeInsets.all(8.0))
          .coloredBox(color: Colors.blue)
          .sliverToBoxAdapter()
          .sliverPadding(padding: EdgeInsets.all(8.0)),
    ),
  ],
)
```

### 4. TableRowScope

Scope that enables extensions for `TableRow`.

**Use** `const Modifier<TableRowScope>()` **ONLY** inside a parent: `TableRow`

```dart
Table(
  children: [
    TableRow(
      children: [
        Text("Hello Flutter")(
          modifier: const Modifier<TableRowScope>()
              .padding(padding: EdgeInsets.all(8.0))
              .coloredBox(color: Colors.blue)
              .tableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
              ),
        ),
      ],
    ),
  ],
)
```

### 5. MultiChildLayoutScope

Scope that enables extensions for `CustomMultiChildLayout`.

**Use** `const Modifier<MultiChildLayoutScope>()` **ONLY** inside a parent: `CustomMultiChildLayout`

```dart
CustomMultiChildLayout(
  delegate: MyLayoutDelegate(),
  children: [
    Text("Hello Flutter")(
      modifier: const Modifier<MultiChildLayoutScope>()
          .padding(padding: EdgeInsets.all(8.0))
          .coloredBox(color: Colors.blue)
          .layoutId(id: 'id'),
    ),
  ],
)
```

## How It Works: The Performance Engine

When a parent widget updates state in Flutter, the framework travels down the Element tree,
re-allocating configuration objects.

**Flutter Modifier UI** optimizes this process by separating your structural layout from your
dynamic
data flow using a dual-layer pipeline:

<div style="text-align: center;">
<img src="https://raw.githubusercontent.com/bodjokowilfried29/flutter_modifier_ui/refs/heads/main/assets/flutter_modier_ui_diagram.jpg" width="50%" alt="flutter_modifier_node_architecture" />
</div>

### 1. The Frozen Skeleton (Structural Caching)

The first time your modifier chain is built, the engine compiles and flattens your modifier chain
into a structural widget tree. On subsequent frames, an identity check (
`oldWidget.modifier != widget.modifier`) evaluates if your layout properties changed. If they
haven't, **recompilation is aborted entirely**, freezing the layout skeleton in memory.

### 2. Widget Teleportation

Widget Teleportation is the name given to Flutter Modifier UI's mechanism for delivering updated
child
widgets through an already cached layout structure.

Fresh dynamic data (like an updating counter text) is wrapped inside a dedicated `ModifierProvider`
pipeline. This child completely bypasses the intermediate layout elements, opening a direct lookup
shortcut straight down to the terminal `ModifierConsumer`, keeping all intermediate layout elements
completely asleep.

## Complete Example: Isolated Rebuilds

The example below demonstrates how `Modifier` chains isolate layout composition from dynamic data
mutations. when `_incrementCounter()` triggers a `setState`, **only the terminal `Text` widget is
rebuilt**.

The layout background (`align`, `sizedBoxSquare`, `coloredBox`, `clipOval`) stays static and is
completely skipped by Flutter's element rebuild pass.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_modifier_ui/flutter_modifier_ui.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  void _incrementCounter() => setState(() => _counter++);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Modifier UI Counter')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$_counter",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          )(
            modifier: const Modifier()
                .align(alignment: Alignment.center)
                .sizedBoxSquare(dimension: 150.0)
                .coloredBox(color: Colors.purple)
                .clipOval()
                .align(alignment: Alignment.center),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

## Performance Best Practices

To ensure your application's rendering pipeline remains lightning-fast, follow these performance
guidelines.

### 1. Use Tear-offs for Callbacks

Avoid passing anonymous closures (like `onTap: () => ...`) directly inside interactive modifier
chains. Each parent widget rebuild allocates a new function instance in memory, causing the `==`
comparison to fail and forcing an expensive rebuild of the modifier tree.

❌ **Avoid (Bypasses Structural Caching)**

```dart
Text("Hello Flutter")(
  modifier: const Modifier()
      .center()
      .inkWell(onTap: () => _handleTap()), // ❌ Re-allocated on every build
)
```

✅ **Recommended (100% Cached)**

Passa **Tear-off** (a direct reference to the method) instead. Dart preserves the function identity
across rebuilds, allowing **Flutter Modifier UI** to instantly short-circuit rendering evaluations
in
*O(1)* and reuse the cached tree.

```dart
// In your widget state or class
void _handleTap() {
  // Your logic here
}

@override
Widget build(BuildContext context) {
  return Text("Hello Flutter")(
    modifier: const Modifier()
        .center()
        .inkWell(onTap: _handleTap), // ✅ Stable reference, fully cached!
  );
}
```

### 2. Extract and Reuse Modifier Instances (Reusable Modifiers)

When a parent widget rebuilds, declaring a chain of modifiers inline inside the `build` method
forces Dart to re-allocate all the modifier elements and reconstruct the binary composition tree on
every frame.

If your modifier chain is static and does not depend on local state or `BuildContext`, **extract it
as a `static final` or top-level variable**. This allows **Flutter Modifier UI** to instantly skip
the
entire composition phase with a single *O(1)* pointer-equality check.

❌ **Avoid (Re-allocated and Re-composed on every rebuild)**

```dart
@override
Widget build(BuildContext context) {
  return Text("Hello Flutter")(
    modifier: const Modifier()
        .padding(padding: EdgeInsets.all(16.0))
        .coloredBox(color: Colors.blue)
        .clipOval(), // ❌ Allocated & Structured on every frame
  );
}
```

✅ **Recommended (Allocated once, 100% Cached)**

```dart
// Define the modifier chain once as a static final variable outside the build lifecycle
static final _bubbleStyle = const Modifier()
    .padding(padding: EdgeInsets.all(16.0))
    .coloredBox(color: Colors.blue)
    .clipOval();

@override
Widget build(BuildContext context) {
  return Text("Hello Flutter")(modifier: _bubbleStyle); // ✅ Identical reference, zero composition cost!
}

```

## FAQ

**Does Flutter Modifier UI replace standard Flutter widgets?** No. It acts as an architectural layer
that composes native Flutter widgets under the hood using a cleaner, high performance API.

**Can I create my own custom modifiers?** Yes, absolutely! **Flutter Modifier UI** is designed to be
fully extensible. You can easily create custom modifiers by following these steps:

1. **Create a custom element class** that inherits froom `ModifierElement<S>` and implements its
   required structure:
    - `buid(Widget child)` : Define the widget layout composition.

    - `props` (getter returning `ModifierProperties`) : Declare the list of properties to expose
      them to the equality check engine.

2. **Expose your modifier as an extension** on `Modifier<S>` by chaining your custom element using
   the `then()` operator.

```dart
class MyCustomElement<S> extends ModifierElement<S> {
  final Key? key;
  final double scale;

  const MyCustomElement({this.key, required this.scale});

  @override
  Widget build(Widget child) {
    return Transform.scale(scale: scale, child: child);
  }

  @override
  ModifierProperties get props => [scale];

}

extension MyCustomModifier<S> on Modifier<S> {
  Modifier<S> scale({required double scale}) {
    return then(MyCustomElement(scale: scale));
  }
}


// Usage
final modifier = const Modifier().scale(scale: 1.0);
```

**Does it work with state management solutions like Bloc or Riverpod?** Yes, it is entirely
independent of your state management layer. It optimizes at the Flutter rendering/element level

**Does it support Hot Reload?** Yes, fully supported.
