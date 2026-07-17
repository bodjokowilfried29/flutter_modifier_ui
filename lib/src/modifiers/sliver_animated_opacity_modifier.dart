// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

class _SliverAnimatedOpacityElement<S extends SliverScope>
    extends ModifierElement<S> {
  final Key? key;
  final double opacity;
  final Curve curve;
  final Duration duration;
  final void Function()? onEnd;
  final bool alwaysIncludeSemantics;

  const _SliverAnimatedOpacityElement({
    this.key,
    required this.opacity,
    this.curve = Curves.linear,
    required this.duration,
    this.onEnd,
    this.alwaysIncludeSemantics = false,
  });

  @override
  Widget build(Widget child) {
    return SliverAnimatedOpacity(
      key: key,
      opacity: opacity,
      curve: curve,
      duration: duration,
      onEnd: onEnd,
      alwaysIncludeSemantics: alwaysIncludeSemantics,
      sliver: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == SliverAnimatedOpacity;

  @override
  ModifierProperties get props => [
    key,
    opacity,
    curve,
    duration,
    onEnd,
    alwaysIncludeSemantics,
  ];
}

extension SliverAnimatedOpacityModifier<S extends SliverScope> on Modifier<S> {
  Modifier<S> sliverAnimatedOpacity({
    Key? key,
    required double opacity,
    Curve curve = Curves.linear,
    required Duration duration,
    void Function()? onEnd,
    bool alwaysIncludeSemantics = false,
  }) {
    return then(
      _SliverAnimatedOpacityElement<S>(
        key: key,
        opacity: opacity,
        curve: curve,
        duration: duration,
        onEnd: onEnd,
        alwaysIncludeSemantics: alwaysIncludeSemantics,
      ),
    );
  }
}
