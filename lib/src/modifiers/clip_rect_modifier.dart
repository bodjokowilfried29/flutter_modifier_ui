// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [ClipRect] in a modifier chain.
class _ClipRectElement<S> extends ModifierElement<S> {
  final Key? key;
  final CustomClipper<Rect>? clipper;
  final Clip clipBehavior;

  const _ClipRectElement({
    this.key,
    this.clipper,
    this.clipBehavior = Clip.hardEdge,
  });

  @override
  Widget build(Widget child) {
    return ClipRect(
      key: key,
      clipper: clipper,
      clipBehavior: clipBehavior,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == ClipRect;

  @override
  ModifierProperties get props => [key, clipper, clipBehavior];
}

extension ClipRectModifier<S> on Modifier<S> {
  /// Adds a [_ClipRectElement] to this [Modifier].
  Modifier<S> clipRect({
    Key? key,
    CustomClipper<Rect>? clipper,
    Clip clipBehavior = Clip.hardEdge,
  }) {
    return then(
      _ClipRectElement<S>(
        key: key,
        clipper: clipper,
        clipBehavior: clipBehavior,
      ),
    );
  }
}
