// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents an [AnimatedPadding] in a modifier chain.
class _AnimatedPaddingElement<S> extends ModifierElement<S> {
  final Key? key;
  final EdgeInsetsGeometry padding;
  final Curve curve;
  final Duration duration;
  final void Function()? onEnd;

  const _AnimatedPaddingElement({
    this.key,
    required this.padding,
    this.curve = Curves.linear,
    required this.duration,
    this.onEnd,
  });

  @override
  Widget build(Widget child) {
    return AnimatedPadding(
      key: key,
      padding: padding,
      curve: curve,
      duration: duration,
      onEnd: onEnd,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == AnimatedPadding;

  @override
  ModifierProperties get props => [key, padding, curve, duration, onEnd];
}

extension AnimatedPaddingModifier<S> on Modifier<S> {
  /// Adds an [_AnimatedPaddingElement] to this [Modifier].
  Modifier<S> animatedPadding({
    Key? key,
    required EdgeInsetsGeometry padding,
    Curve curve = Curves.linear,
    required Duration duration,
    void Function()? onEnd,
  }) {
    return then(
      _AnimatedPaddingElement<S>(
        key: key,
        padding: padding,
        curve: curve,
        duration: duration,
        onEnd: onEnd,
      ),
    );
  }
}
