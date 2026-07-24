// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [ClipRSuperellipse] in a modifier chain.
class _ClipRSuperellipseElement<S> extends ModifierElement<S> {
  final Key? key;
  final BorderRadiusGeometry borderRadius;
  final CustomClipper<RSuperellipse>? clipper;
  final Clip clipBehavior;

  const _ClipRSuperellipseElement({
    this.key,
    this.borderRadius = BorderRadius.zero,
    this.clipper,
    this.clipBehavior = Clip.antiAlias,
  });

  @override
  Widget build(Widget child) {
    return ClipRSuperellipse(
      key: key,
      borderRadius: borderRadius,
      clipper: clipper,
      clipBehavior: clipBehavior,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == ClipRSuperellipse;

  @override
  ModifierProperties get props => [key, borderRadius, clipper, clipBehavior];
}

extension ClipRSuperellipseModifier<S> on Modifier<S> {
  /// Adds a [_ClipRSuperellipseElement] to this [Modifier].
  Modifier<S> clipRSuperellipse({
    Key? key,
    BorderRadiusGeometry borderRadius = BorderRadius.zero,
    CustomClipper<RSuperellipse>? clipper,
    Clip clipBehavior = Clip.antiAlias,
  }) {
    return then(
      _ClipRSuperellipseElement<S>(
        key: key,
        borderRadius: borderRadius,
        clipper: clipper,
        clipBehavior: clipBehavior,
      ),
    );
  }
}
