// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [SliverOpacity] in a modifier chain.
class _SliverOpacityElement<S extends SliverScope> extends ModifierElement<S> {
  final Key? key;
  final double opacity;
  final bool alwaysIncludeSemantics;

  const _SliverOpacityElement({
    this.key,
    required this.opacity,
    this.alwaysIncludeSemantics = false,
  });

  @override
  Widget build(Widget child) {
    return SliverOpacity(
      key: key,
      opacity: opacity,
      alwaysIncludeSemantics: alwaysIncludeSemantics,
      sliver: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == SliverOpacity;

  @override
  ModifierProperties get props => [key, opacity, alwaysIncludeSemantics];
}

extension SliverOpacityModifier<S extends SliverScope> on Modifier<S> {
  /// Adds a [_SliverOpacityElement] to this [Modifier].
  Modifier<S> sliverOpacity({
    Key? key,
    required double opacity,
    bool alwaysIncludeSemantics = false,
  }) {
    return then(
      _SliverOpacityElement<S>(
        key: key,
        opacity: opacity,
        alwaysIncludeSemantics: alwaysIncludeSemantics,
      ),
    );
  }
}
