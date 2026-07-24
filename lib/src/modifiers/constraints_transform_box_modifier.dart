// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [ConstraintsTransformBox] in a modifier chain.
class _ConstraintsTransformBoxElement<S> extends ModifierElement<S> {
  final Key? key;
  final TextDirection? textDirection;
  final AlignmentGeometry alignment;
  final BoxConstraints Function(BoxConstraints) constraintsTransform;
  final Clip clipBehavior;
  final String debugTransformType;

  const _ConstraintsTransformBoxElement({
    this.key,
    this.textDirection,
    this.alignment = Alignment.center,
    required this.constraintsTransform,
    this.clipBehavior = Clip.none,
    this.debugTransformType = '',
  });

  @override
  Widget build(Widget child) {
    return ConstraintsTransformBox(
      key: key,
      textDirection: textDirection,
      alignment: alignment,
      constraintsTransform: constraintsTransform,
      clipBehavior: clipBehavior,
      debugTransformType: debugTransformType,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == ConstraintsTransformBox;

  @override
  ModifierProperties get props => [
    key,
    textDirection,
    alignment,
    constraintsTransform,
    clipBehavior,
    debugTransformType,
  ];
}

extension ConstraintsTransformBoxModifier<S> on Modifier<S> {
  /// Adds a [_ConstraintsTransformBoxElement] to this [Modifier].
  Modifier<S> constraintsTransformBox({
    Key? key,
    TextDirection? textDirection,
    AlignmentGeometry alignment = Alignment.center,
    required BoxConstraints Function(BoxConstraints) constraintsTransform,
    Clip clipBehavior = Clip.none,
    String debugTransformType = '',
  }) {
    return then(
      _ConstraintsTransformBoxElement<S>(
        key: key,
        textDirection: textDirection,
        alignment: alignment,
        constraintsTransform: constraintsTransform,
        clipBehavior: clipBehavior,
        debugTransformType: debugTransformType,
      ),
    );
  }
}
