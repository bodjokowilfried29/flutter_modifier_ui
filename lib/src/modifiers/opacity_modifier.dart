// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [Opacity] in a modifier chain.
class _OpacityElement<S> extends ModifierElement<S> {
  final Key? key;
  final double opacity;
  final bool alwaysIncludeSemantics;

  const _OpacityElement({
    this.key,
    required this.opacity,
    this.alwaysIncludeSemantics = false,
  });

  @override
  Widget build(Widget child) {
    return Opacity(
      key: key,
      opacity: opacity,
      alwaysIncludeSemantics: alwaysIncludeSemantics,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == Opacity;

  @override
  ModifierProperties get props => [key, opacity, alwaysIncludeSemantics];
}

extension OpacityModifier<S> on Modifier<S> {
  /// Adds a [_OpacityElement] to this [Modifier].
  Modifier<S> opacity({
    Key? key,
    required double opacity,
    bool alwaysIncludeSemantics = false,
  }) {
    return then(
      _OpacityElement<S>(
        key: key,
        opacity: opacity,
        alwaysIncludeSemantics: alwaysIncludeSemantics,
      ),
    );
  }
}
