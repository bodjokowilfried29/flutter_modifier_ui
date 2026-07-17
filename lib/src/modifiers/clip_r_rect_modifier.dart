// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

class _ClipRRectElement<S> extends ModifierElement<S> {
  final Key? key;
  final BorderRadiusGeometry borderRadius;
  final CustomClipper<RRect>? clipper;
  final Clip clipBehavior;

  const _ClipRRectElement({
    this.key,
    this.borderRadius = BorderRadius.zero,
    this.clipper,
    this.clipBehavior = Clip.antiAlias,
  });

  @override
  Widget build(Widget child) {
    return ClipRRect(
      key: key,
      borderRadius: borderRadius,
      clipper: clipper,
      clipBehavior: clipBehavior,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == ClipRRect;

  @override
  ModifierProperties get props => [key, borderRadius, clipper, clipBehavior];
}

extension ClipRRectModifier<S> on Modifier<S> {
  Modifier<S> clipRRect({
    Key? key,
    BorderRadiusGeometry borderRadius = BorderRadius.zero,
    CustomClipper<RRect>? clipper,
    Clip clipBehavior = Clip.antiAlias,
  }) {
    return then(
      _ClipRRectElement<S>(
        key: key,
        borderRadius: borderRadius,
        clipper: clipper,
        clipBehavior: clipBehavior,
      ),
    );
  }
}
