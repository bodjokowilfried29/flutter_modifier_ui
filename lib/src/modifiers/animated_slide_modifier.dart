// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents an [AnimatedSlide] in a modifier chain.
class _AnimatedSlideElement<S> extends ModifierElement<S> {
  final Key? key;
  final Offset offset;
  final Curve curve;
  final Duration duration;
  final void Function()? onEnd;

  const _AnimatedSlideElement({
    this.key,
    required this.offset,
    this.curve = Curves.linear,
    required this.duration,
    this.onEnd,
  });

  @override
  Widget build(Widget child) {
    return AnimatedSlide(
      key: key,
      offset: offset,
      curve: curve,
      duration: duration,
      onEnd: onEnd,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == AnimatedSlide;

  @override
  ModifierProperties get props => [key, offset, curve, duration, onEnd];
}

extension AnimatedSlideModifier<S> on Modifier<S> {
  /// Adds an [_AnimatedSlideElement] to this [Modifier].
  Modifier<S> animatedSlide({
    Key? key,
    required Offset offset,
    Curve curve = Curves.linear,
    required Duration duration,
    void Function()? onEnd,
  }) {
    return then(
      _AnimatedSlideElement<S>(
        key: key,
        offset: offset,
        curve: curve,
        duration: duration,
        onEnd: onEnd,
      ),
    );
  }
}
