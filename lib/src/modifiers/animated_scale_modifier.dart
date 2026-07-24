// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents an [AnimatedScale] in a modifier chain.
class _AnimatedScaleElement<S> extends ModifierElement<S> {
  final Key? key;
  final double scale;
  final Alignment alignment;
  final FilterQuality? filterQuality;
  final Curve curve;
  final Duration duration;
  final void Function()? onEnd;

  const _AnimatedScaleElement({
    this.key,
    required this.scale,
    this.alignment = Alignment.center,
    this.filterQuality,
    this.curve = Curves.linear,
    required this.duration,
    this.onEnd,
  });

  @override
  Widget build(Widget child) {
    return AnimatedScale(
      key: key,
      scale: scale,
      alignment: alignment,
      filterQuality: filterQuality,
      curve: curve,
      duration: duration,
      onEnd: onEnd,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == AnimatedScale;

  @override
  ModifierProperties get props => [
    key,
    scale,
    alignment,
    filterQuality,
    curve,
    duration,
    onEnd,
  ];
}

extension AnimatedScaleModifier<S> on Modifier<S> {
  /// Adds an [_AnimatedScaleElement] to this [Modifier].
  Modifier<S> animatedScale({
    Key? key,
    required double scale,
    Alignment alignment = Alignment.center,
    FilterQuality? filterQuality,
    Curve curve = Curves.linear,
    required Duration duration,
    void Function()? onEnd,
  }) {
    return then(
      _AnimatedScaleElement<S>(
        key: key,
        scale: scale,
        alignment: alignment,
        filterQuality: filterQuality,
        curve: curve,
        duration: duration,
        onEnd: onEnd,
      ),
    );
  }
}
