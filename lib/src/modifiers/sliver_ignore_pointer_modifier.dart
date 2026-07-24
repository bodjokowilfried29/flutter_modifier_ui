// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [SliverIgnorePointer] in a modifier chain.
class _SliverIgnorePointerElement<S extends SliverScope>
    extends ModifierElement<S> {
  final Key? key;
  final bool ignoring;
  final bool? ignoringSemantics;

  const _SliverIgnorePointerElement({
    this.key,
    this.ignoring = true,
    this.ignoringSemantics,
  });

  @override
  Widget build(Widget child) {
    return SliverIgnorePointer(
      key: key,
      ignoring: ignoring,
      ignoringSemantics: ignoringSemantics,
      sliver: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == SliverIgnorePointer;

  @override
  ModifierProperties get props => [key, ignoring, ignoringSemantics];
}

extension SliverIgnorePointerModifier<S extends SliverScope> on Modifier<S> {
  /// Adds a [_SliverIgnorePointerElement] to this [Modifier].
  Modifier<S> sliverIgnorePointer({
    Key? key,
    bool ignoring = true,
    bool? ignoringSemantics,
  }) {
    return then(
      _SliverIgnorePointerElement<S>(
        key: key,
        ignoring: ignoring,
        ignoringSemantics: ignoringSemantics,
      ),
    );
  }
}
