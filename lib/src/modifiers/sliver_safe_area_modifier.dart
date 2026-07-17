// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

class _SliverSafeAreaElement<S extends SliverScope> extends ModifierElement<S> {
  final Key? key;
  final bool left;
  final bool top;
  final bool right;
  final bool bottom;
  final EdgeInsets minimum;

  const _SliverSafeAreaElement({
    this.key,
    this.left = true,
    this.top = true,
    this.right = true,
    this.bottom = true,
    this.minimum = EdgeInsets.zero,
  });

  @override
  Widget build(Widget child) {
    return SliverSafeArea(
      key: key,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      minimum: minimum,
      sliver: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == SliverSafeArea;

  @override
  ModifierProperties get props => [key, left, top, right, bottom, minimum];
}

extension SliverSafeAreaModifier<S extends SliverScope> on Modifier<S> {
  Modifier<S> sliverSafeArea({
    Key? key,
    bool left = true,
    bool top = true,
    bool right = true,
    bool bottom = true,
    EdgeInsets minimum = EdgeInsets.zero,
  }) {
    return then(
      _SliverSafeAreaElement<S>(
        key: key,
        left: left,
        top: top,
        right: right,
        bottom: bottom,
        minimum: minimum,
      ),
    );
  }
}
