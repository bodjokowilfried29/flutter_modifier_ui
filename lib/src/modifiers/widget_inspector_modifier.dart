// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [WidgetInspector] in a modifier chain.
class _WidgetInspectorElement<S> extends ModifierElement<S> {
  final Key? key;
  final Widget Function(
    BuildContext, {
    required void Function() onPressed,
    required bool selectionOnTapEnabled,
    required String semanticsLabel,
  })?
  tapBehaviorButtonBuilder;
  final Widget Function(
    BuildContext, {
    required GlobalKey<State<StatefulWidget>> key,
    required void Function() onPressed,
    required String semanticsLabel,
  })?
  exitWidgetSelectionButtonBuilder;
  final Widget Function(
    BuildContext, {
    required void Function() onPressed,
    required String semanticsLabel,
    bool usesDefaultAlignment,
  })?
  moveExitWidgetSelectionButtonBuilder;

  const _WidgetInspectorElement({
    this.key,
    required this.tapBehaviorButtonBuilder,
    required this.exitWidgetSelectionButtonBuilder,
    required this.moveExitWidgetSelectionButtonBuilder,
  });

  @override
  Widget build(Widget child) {
    return WidgetInspector(
      key: key,
      tapBehaviorButtonBuilder: tapBehaviorButtonBuilder,
      exitWidgetSelectionButtonBuilder: exitWidgetSelectionButtonBuilder,
      moveExitWidgetSelectionButtonBuilder:
          moveExitWidgetSelectionButtonBuilder,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == WidgetInspector;

  @override
  ModifierProperties get props => [
    key,
    tapBehaviorButtonBuilder,
    exitWidgetSelectionButtonBuilder,
    moveExitWidgetSelectionButtonBuilder,
  ];
}

extension WidgetInspectorModifier<S> on Modifier<S> {
  /// Adds a [_WidgetInspectorElement] to this [Modifier].
  Modifier<S> widgetInspector({
    Key? key,
    required Widget Function(
      BuildContext, {
      required void Function() onPressed,
      required bool selectionOnTapEnabled,
      required String semanticsLabel,
    })?
    tapBehaviorButtonBuilder,
    required Widget Function(
      BuildContext, {
      required GlobalKey<State<StatefulWidget>> key,
      required void Function() onPressed,
      required String semanticsLabel,
    })?
    exitWidgetSelectionButtonBuilder,
    required Widget Function(
      BuildContext, {
      required void Function() onPressed,
      required String semanticsLabel,
      bool usesDefaultAlignment,
    })?
    moveExitWidgetSelectionButtonBuilder,
  }) {
    return then(
      _WidgetInspectorElement<S>(
        key: key,
        tapBehaviorButtonBuilder: tapBehaviorButtonBuilder,
        exitWidgetSelectionButtonBuilder: exitWidgetSelectionButtonBuilder,
        moveExitWidgetSelectionButtonBuilder:
            moveExitWidgetSelectionButtonBuilder,
      ),
    );
  }
}
