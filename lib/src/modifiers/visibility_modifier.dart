// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [Visibility] in a modifier chain.
class _VisibilityElement<S> extends ModifierElement<S> {
  final Key? key;
  final Widget replacement;
  final bool visible;
  final bool maintainState;
  final bool maintainAnimation;
  final bool maintainSize;
  final bool maintainSemantics;
  final bool maintainInteractivity;
  final bool maintainFocusability;

  const _VisibilityElement({
    this.key,
    this.replacement = const SizedBox.shrink(),
    this.visible = true,
    this.maintainState = false,
    this.maintainAnimation = false,
    this.maintainSize = false,
    this.maintainSemantics = false,
    this.maintainInteractivity = false,
    this.maintainFocusability = false,
  });

  @override
  Widget build(Widget child) {
    return Visibility(
      key: key,
      replacement: replacement,
      visible: visible,
      maintainState: maintainState,
      maintainAnimation: maintainAnimation,
      maintainSize: maintainSize,
      maintainSemantics: maintainSemantics,
      maintainInteractivity: maintainInteractivity,
      maintainFocusability: maintainFocusability,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == Visibility;

  @override
  ModifierProperties get props => [
    key,
    replacement,
    visible,
    maintainState,
    maintainAnimation,
    maintainSize,
    maintainSemantics,
    maintainInteractivity,
    maintainFocusability,
  ];
}

extension VisibilityModifier<S> on Modifier<S> {
  /// Adds a [_VisibilityElement] to this [Modifier].
  Modifier<S> visibility({
    Key? key,
    Widget replacement = const SizedBox.shrink(),
    bool visible = true,
    bool maintainState = false,
    bool maintainAnimation = false,
    bool maintainSize = false,
    bool maintainSemantics = false,
    bool maintainInteractivity = false,
    bool maintainFocusability = false,
  }) {
    return then(
      _VisibilityElement<S>(
        key: key,
        replacement: replacement,
        visible: visible,
        maintainState: maintainState,
        maintainAnimation: maintainAnimation,
        maintainSize: maintainSize,
        maintainSemantics: maintainSemantics,
        maintainInteractivity: maintainInteractivity,
        maintainFocusability: maintainFocusability,
      ),
    );
  }
}

/// Represents a [Visibility.maintain] in a modifier chain.
class _VisibilityMaintainElement<S> extends ModifierElement<S> {
  final Key? key;
  final bool visible;

  const _VisibilityMaintainElement({this.key, this.visible = true});

  @override
  Widget build(Widget child) {
    return Visibility.maintain(key: key, visible: visible, child: child);
  }

  @override
  bool byWidgetType(Type type) => type == Visibility;

  @override
  ModifierProperties get props => [key, visible];
}

extension VisibilityMaintainModifier<S> on Modifier<S> {
  /// Adds a [_VisibilityMaintainElement] to this [Modifier].
  Modifier<S> visibilityMaintain({Key? key, bool visible = true}) {
    return then(_VisibilityMaintainElement<S>(key: key, visible: visible));
  }
}
