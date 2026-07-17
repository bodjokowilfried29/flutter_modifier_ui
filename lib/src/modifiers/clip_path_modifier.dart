// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

class _ClipPathElement<S> extends ModifierElement<S> {
  final Key? key;
  final CustomClipper<Path>? clipper;
  final Clip clipBehavior;

  const _ClipPathElement({
    this.key,
    this.clipper,
    this.clipBehavior = Clip.antiAlias,
  });

  @override
  Widget build(Widget child) {
    return ClipPath(
      key: key,
      clipper: clipper,
      clipBehavior: clipBehavior,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == ClipPath;

  @override
  ModifierProperties get props => [key, clipper, clipBehavior];
}

extension ClipPathModifier<S> on Modifier<S> {
  Modifier<S> clipPath({
    Key? key,
    CustomClipper<Path>? clipper,
    Clip clipBehavior = Clip.antiAlias,
  }) {
    return then(
      _ClipPathElement<S>(
        key: key,
        clipper: clipper,
        clipBehavior: clipBehavior,
      ),
    );
  }
}
