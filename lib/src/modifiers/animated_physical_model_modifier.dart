// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.s

import 'package:flutter/material.dart';

import '../modifier.dart';

class _AnimatedPhysicalModelElement<S> extends ModifierElement<S> {
  final Key? key;
  final BoxShape shape;
  final Clip clipBehavior;
  final BorderRadius? borderRadius;
  final double elevation;
  final Color color;
  final bool animateColor;
  final Color shadowColor;
  final bool animateShadowColor;
  final Curve curve;
  final Duration duration;
  final void Function()? onEnd;

  const _AnimatedPhysicalModelElement({
    this.key,
    this.shape = BoxShape.rectangle,
    this.clipBehavior = Clip.none,
    this.borderRadius,
    this.elevation = 0.0,
    required this.color,
    this.animateColor = true,
    required this.shadowColor,
    this.animateShadowColor = true,
    this.curve = Curves.linear,
    required this.duration,
    this.onEnd,
  });

  @override
  Widget build(Widget child) {
    return AnimatedPhysicalModel(
      key: key,
      shape: shape,
      clipBehavior: clipBehavior,
      borderRadius: borderRadius,
      elevation: elevation,
      color: color,
      animateColor: animateColor,
      shadowColor: shadowColor,
      animateShadowColor: animateShadowColor,
      curve: curve,
      duration: duration,
      onEnd: onEnd,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == AnimatedPhysicalModel;

  @override
  ModifierProperties get props => [
    key,
    shape,
    clipBehavior,
    borderRadius,
    elevation,
    color,
    animateColor,
    shadowColor,
    animateShadowColor,
    curve,
    duration,
    onEnd,
  ];
}

extension AnimatedPhysicalModelModifier<S> on Modifier<S> {
  Modifier<S> animatedPhysicalModel({
    Key? key,
    BoxShape shape = BoxShape.rectangle,
    Clip clipBehavior = Clip.none,
    BorderRadius? borderRadius,
    double elevation = 0.0,
    required Color color,
    bool animateColor = true,
    required Color shadowColor,
    bool animateShadowColor = true,
    Curve curve = Curves.linear,
    required Duration duration,
    void Function()? onEnd,
  }) {
    return then(
      _AnimatedPhysicalModelElement<S>(
        key: key,
        shape: shape,
        clipBehavior: clipBehavior,
        borderRadius: borderRadius,
        elevation: elevation,
        color: color,
        animateColor: animateColor,
        shadowColor: shadowColor,
        animateShadowColor: animateShadowColor,
        curve: curve,
        duration: duration,
        onEnd: onEnd,
      ),
    );
  }
}
