// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

class _AnimatedAlignElement<S> extends ModifierElement<S> {
  final Key? key;
  final AlignmentGeometry alignment;
  final double? heightFactor;
  final double? widthFactor;
  final Curve curve;
  final Duration duration;
  final void Function()? onEnd;

  const _AnimatedAlignElement({
    this.key,
    required this.alignment,
    this.heightFactor,
    this.widthFactor,
    this.curve = Curves.linear,
    required this.duration,
    this.onEnd,
  });

  @override
  Widget build(Widget child) {
    return AnimatedAlign(
      key: key,
      alignment: alignment,
      heightFactor: heightFactor,
      widthFactor: widthFactor,
      curve: curve,
      duration: duration,
      onEnd: onEnd,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == AnimatedAlign;

  @override
  ModifierProperties get props => [
    key,
    alignment,
    heightFactor,
    widthFactor,
    curve,
    duration,
    onEnd,
  ];
}

extension AnimatedAlignModifier<S> on Modifier<S> {
  Modifier<S> animatedAlign({
    Key? key,
    required AlignmentGeometry alignment,
    double? heightFactor,
    double? widthFactor,
    Curve curve = Curves.linear,
    required Duration duration,
    void Function()? onEnd,
  }) {
    return then(
      _AnimatedAlignElement<S>(
        key: key,
        alignment: alignment,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        curve: curve,
        duration: duration,
        onEnd: onEnd,
      ),
    );
  }
}
