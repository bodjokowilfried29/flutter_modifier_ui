// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

class _UnconstrainedBoxElement<S> extends ModifierElement<S> {
  final Key? key;
  final TextDirection? textDirection;
  final AlignmentGeometry alignment;
  final Axis? constrainedAxis;
  final Clip clipBehavior;

  const _UnconstrainedBoxElement({
    this.key,
    this.textDirection,
    this.alignment = Alignment.center,
    this.constrainedAxis,
    this.clipBehavior = Clip.none,
  });

  @override
  Widget build(Widget child) {
    return UnconstrainedBox(
      key: key,
      textDirection: textDirection,
      alignment: alignment,
      constrainedAxis: constrainedAxis,
      clipBehavior: clipBehavior,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == UnconstrainedBox;

  @override
  ModifierProperties get props => [
    key,
    textDirection,
    alignment,
    constrainedAxis,
    clipBehavior,
  ];
}

extension UnconstrainedBoxModifier<S> on Modifier<S> {
  Modifier<S> unconstrainedBox({
    Key? key,
    TextDirection? textDirection,
    AlignmentGeometry alignment = Alignment.center,
    Axis? constrainedAxis,
    Clip clipBehavior = Clip.none,
  }) {
    return then(
      _UnconstrainedBoxElement<S>(
        key: key,
        textDirection: textDirection,
        alignment: alignment,
        constrainedAxis: constrainedAxis,
        clipBehavior: clipBehavior,
      ),
    );
  }
}
