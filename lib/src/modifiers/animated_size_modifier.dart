// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

class _AnimatedSizeElement<S> extends ModifierElement<S> {
  final Key? key;
  final AlignmentGeometry alignment;
  final Curve curve;
  final Duration duration;
  final Duration? reverseDuration;
  final Clip clipBehavior;
  final void Function()? onEnd;

  const _AnimatedSizeElement({
    this.key,
    this.alignment = Alignment.center,
    this.curve = Curves.linear,
    required this.duration,
    this.reverseDuration,
    this.clipBehavior = Clip.hardEdge,
    this.onEnd,
  });

  @override
  Widget build(Widget child) {
    return AnimatedSize(
      key: key,
      alignment: alignment,
      curve: curve,
      duration: duration,
      reverseDuration: reverseDuration,
      clipBehavior: clipBehavior,
      onEnd: onEnd,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == AnimatedSize;

  @override
  ModifierProperties get props => [
    key,
    alignment,
    curve,
    duration,
    reverseDuration,
    clipBehavior,
    onEnd,
  ];
}

extension AnimatedSizeModifier<S> on Modifier<S> {
  Modifier<S> animatedSize({
    Key? key,
    AlignmentGeometry alignment = Alignment.center,
    Curve curve = Curves.linear,
    required Duration duration,
    Duration? reverseDuration,
    Clip clipBehavior = Clip.hardEdge,
    void Function()? onEnd,
  }) {
    return then(
      _AnimatedSizeElement<S>(
        key: key,
        alignment: alignment,
        curve: curve,
        duration: duration,
        reverseDuration: reverseDuration,
        clipBehavior: clipBehavior,
        onEnd: onEnd,
      ),
    );
  }
}
