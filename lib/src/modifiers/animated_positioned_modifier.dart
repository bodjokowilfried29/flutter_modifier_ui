// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents an [AnimatedPositioned] in a modifier chain.
class _AnimatedPositionedElement<S extends StackScope>
    extends ModifierElement<S> {
  final Key? key;
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;
  final double? width;
  final double? height;
  final Curve curve;
  final Duration duration;
  final void Function()? onEnd;

  const _AnimatedPositionedElement({
    this.key,
    this.left,
    this.top,
    this.right,
    this.bottom,
    this.width,
    this.height,
    this.curve = Curves.linear,
    required this.duration,
    this.onEnd,
  });

  @override
  Widget build(Widget child) {
    return AnimatedPositioned(
      key: key,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      width: width,
      height: height,
      curve: curve,
      duration: duration,
      onEnd: onEnd,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == AnimatedPositioned;

  @override
  ModifierProperties get props => [
    key,
    left,
    top,
    right,
    bottom,
    width,
    height,
    curve,
    duration,
    onEnd,
  ];
}

extension AnimatedPositionedModifier<S extends StackScope> on Modifier<S> {
  /// Adds an [_AnimatedPositionedElement] to this [Modifier].
  Modifier<S> animatedPositioned({
    Key? key,
    double? left,
    double? top,
    double? right,
    double? bottom,
    double? width,
    double? height,
    Curve curve = Curves.linear,
    required Duration duration,
    void Function()? onEnd,
  }) {
    return then(
      _AnimatedPositionedElement<S>(
        key: key,
        left: left,
        top: top,
        right: right,
        bottom: bottom,
        width: width,
        height: height,
        curve: curve,
        duration: duration,
        onEnd: onEnd,
      ),
    );
  }
}

/// Represents an [AnimatedPositioned.fromRect] in a modifier chain.
class _AnimatedPositionedFromRectElement<S extends StackScope>
    extends ModifierElement<S> {
  final Key? key;
  final Rect rect;
  final Curve curve;
  final Duration duration;
  final void Function()? onEnd;

  const _AnimatedPositionedFromRectElement({
    this.key,
    required this.rect,
    this.curve = Curves.linear,
    required this.duration,
    this.onEnd,
  });

  @override
  Widget build(Widget child) {
    return AnimatedPositioned.fromRect(
      key: key,
      rect: rect,
      curve: curve,
      duration: duration,
      onEnd: onEnd,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == AnimatedPositioned;

  @override
  ModifierProperties get props => [key, rect, curve, duration, onEnd];
}

extension AnimatedPositionedFromRectModifier<S extends StackScope>
    on Modifier<S> {
  /// Adds an [_AnimatedPositionedFromRectElement] to this [Modifier].
  Modifier<S> animatedPositionedFromRect({
    Key? key,
    required Rect rect,
    Curve curve = Curves.linear,
    required Duration duration,
    void Function()? onEnd,
  }) {
    return then(
      _AnimatedPositionedFromRectElement<S>(
        key: key,
        rect: rect,
        curve: curve,
        duration: duration,
        onEnd: onEnd,
      ),
    );
  }
}
