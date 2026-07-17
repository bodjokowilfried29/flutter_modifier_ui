// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// An [InheritedWidget] that acts as the data-injection tunnel for the layout pipeline.
///
/// The [ModifierProvider] is responsible for carrying the reactive, dynamic content
/// ([injectedChild]) from the top-level [ModifierNode] directly down to the core
/// [ModifierConsumer] at the bottom of the compiled layout tree.
///
/// this provider allows content updates to completely bypass the intermediate cached layout nodes,
/// achieving highly efficient, direct component updates.
class ModifierProvider extends InheritedWidget {
  /// Injects the dynamic child content into the layout tunnel.
  const ModifierProvider({
    super.key,
    required this.injectedChild,
    required super.child,
  });

  /// The live, reactive child content that changes independently of the layout style configuration.
  final Widget injectedChild;

  /// Retrieves the nearest [ModifierProvider] ancestor up the widget tree.
  ///
  /// ```dart
  /// @override
  /// Widget build(BuildContext context) {
  ///   return ModifierProvider.of(context).injectedChild;
  /// }
  /// ```
  static ModifierProvider of(BuildContext context) {
    final ModifierProvider? modifierProvider = context
        .dependOnInheritedWidgetOfExactType<ModifierProvider>();
    assert(
      modifierProvider != null,
      'ModifierProvider.of(context) called with a context that does not contain a ModifierProvider.\n'
      'No ModifierProvider ancestor was found in the widget tree. Ensure that your '
      'ModifierConsumer is placed properly inside a ModifierNode',
    );
    return modifierProvider!;
  }

  /// Notifies dependent widgets if the [injectedChild] instance reference changes.
  ///
  /// When a new [ModifierProvider] replaces an old one during a rebuild pass,
  /// this method evaluates whether the underlying content has updated. If `true`,
  /// it strictly invalidates and triggers a rebuild *only* for the sub-components
  /// that explicitly depend on this provider (specifically the consumer).
  @override
  bool updateShouldNotify(ModifierProvider oldWidget) {
    return oldWidget.injectedChild != injectedChild;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Widget>('injectedChild', injectedChild));
  }
}
