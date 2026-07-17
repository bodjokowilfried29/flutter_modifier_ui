// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

class _AnimatedPositionedDirectionalElement<S extends StackScope>
    extends ModifierElement<S> {
  final Key? key;
  final double? start;
  final double? top;
  final double? end;
  final double? bottom;
  final double? width;
  final double? height;
  final Curve curve;
  final Duration duration;
  final void Function()? onEnd;

  const _AnimatedPositionedDirectionalElement({
    this.key,
    this.start,
    this.top,
    this.end,
    this.bottom,
    this.width,
    this.height,
    this.curve = Curves.linear,
    required this.duration,
    this.onEnd,
  });

  @override
  Widget build(Widget child) {
    return AnimatedPositionedDirectional(
      key: key,
      start: start,
      top: top,
      end: end,
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
  bool byWidgetType(Type type) => type == AnimatedPositionedDirectional;

  @override
  ModifierProperties get props => [
    start,
    top,
    end,
    bottom,
    width,
    height,
    curve,
    duration,
    onEnd,
  ];
}

extension AnimatedPositionedDirectionalModifier<S extends StackScope>
    on Modifier<S> {
  Modifier<S> animatedPositionedDirectional({
    Key? key,
    double? start,
    double? top,
    double? end,
    double? bottom,
    double? width,
    double? height,
    Curve curve = Curves.linear,
    required Duration duration,
    void Function()? onEnd,
  }) {
    return then(
      _AnimatedPositionedDirectionalElement<S>(
        key: key,
        start: start,
        top: top,
        end: end,
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
