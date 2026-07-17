// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

class _AnimatedRotationElement<S> extends ModifierElement<S> {
  final Key? key;
  final double turns;
  final Alignment alignment;
  final FilterQuality? filterQuality;
  final Curve curve;
  final Duration duration;
  final void Function()? onEnd;

  const _AnimatedRotationElement({
    this.key,
    required this.turns,
    this.alignment = Alignment.center,
    this.filterQuality,
    this.curve = Curves.linear,
    required this.duration,
    this.onEnd,
  });

  @override
  Widget build(Widget child) {
    return AnimatedRotation(
      key: key,
      turns: turns,
      alignment: alignment,
      filterQuality: filterQuality,
      curve: curve,
      duration: duration,
      onEnd: onEnd,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == AnimatedRotation;

  @override
  ModifierProperties get props => [
    key,
    turns,
    alignment,
    filterQuality,
    curve,
    duration,
    onEnd,
  ];
}

extension AnimatedRotationModifier<S> on Modifier<S> {
  Modifier<S> animatedRotation({
    Key? key,
    required double turns,
    Alignment alignment = Alignment.center,
    FilterQuality? filterQuality,
    Curve curve = Curves.linear,
    required Duration duration,
    void Function()? onEnd,
  }) {
    return then(
      _AnimatedRotationElement<S>(
        key: key,
        turns: turns,
        alignment: alignment,
        filterQuality: filterQuality,
        curve: curve,
        duration: duration,
        onEnd: onEnd,
      ),
    );
  }
}
