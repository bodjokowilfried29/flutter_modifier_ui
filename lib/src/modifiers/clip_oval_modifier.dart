// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [ClipOval] in a modifier chain.
class _ClipOvalElement<S> extends ModifierElement<S> {
  final Key? key;
  final CustomClipper<Rect>? clipper;
  final Clip clipBehavior;

  const _ClipOvalElement({
    this.key,
    this.clipper,
    this.clipBehavior = Clip.antiAlias,
  });

  @override
  Widget build(Widget child) {
    return ClipOval(
      key: key,
      clipper: clipper,
      clipBehavior: clipBehavior,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == ClipOval;

  @override
  ModifierProperties get props => [key, clipper, clipBehavior];
}

extension ClipOvalModifier<S> on Modifier<S> {
  /// Adds a [_ClipOvalElement] to this [Modifier].
  Modifier<S> clipOval({
    Key? key,
    CustomClipper<Rect>? clipper,
    Clip clipBehavior = Clip.antiAlias,
  }) {
    return then(
      _ClipOvalElement<S>(
        key: key,
        clipper: clipper,
        clipBehavior: clipBehavior,
      ),
    );
  }
}
