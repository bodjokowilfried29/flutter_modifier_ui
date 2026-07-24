// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [SafeArea] in a modifier chain.
class _SafeAreaElement<S> extends ModifierElement<S> {
  final Key? key;
  final bool left;
  final bool top;
  final bool right;
  final bool bottom;
  final EdgeInsets minimum;
  final bool maintainBottomViewPadding;

  const _SafeAreaElement({
    this.key,
    this.left = true,
    this.top = true,
    this.right = true,
    this.bottom = true,
    this.minimum = EdgeInsets.zero,
    this.maintainBottomViewPadding = false,
  });

  @override
  Widget build(Widget child) {
    return SafeArea(
      key: key,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      minimum: minimum,
      maintainBottomViewPadding: maintainBottomViewPadding,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == SafeArea;

  @override
  ModifierProperties get props => [
    key,
    left,
    top,
    right,
    bottom,
    minimum,
    maintainBottomViewPadding,
  ];
}

extension SafeAreaModifier<S> on Modifier<S> {
  /// Adds a [_SafeAreaElement] to this [Modifier].
  Modifier<S> safeArea({
    Key? key,
    bool left = true,
    bool top = true,
    bool right = true,
    bool bottom = true,
    EdgeInsets minimum = EdgeInsets.zero,
    bool maintainBottomViewPadding = false,
  }) {
    return then(
      _SafeAreaElement<S>(
        key: key,
        left: left,
        top: top,
        right: right,
        bottom: bottom,
        minimum: minimum,
        maintainBottomViewPadding: maintainBottomViewPadding,
      ),
    );
  }
}
