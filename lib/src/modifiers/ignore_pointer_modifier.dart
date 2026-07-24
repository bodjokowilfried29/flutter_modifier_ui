// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [IgnorePointer] in a modifier chain.
class _IgnorePointerElement<S> extends ModifierElement<S> {
  final Key? key;
  final bool ignoring;
  final bool? ignoringSemantics;

  const _IgnorePointerElement({
    this.key,
    this.ignoring = true,
    this.ignoringSemantics,
  });

  @override
  Widget build(Widget child) {
    return IgnorePointer(
      key: key,
      ignoring: ignoring,
      ignoringSemantics: ignoringSemantics,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == IgnorePointer;

  @override
  ModifierProperties get props => [key, ignoring, ignoringSemantics];
}

extension IgnorePointerModifier<S> on Modifier<S> {
  /// Adds a [_IgnorePointerElement] to this [Modifier].
  Modifier<S> ignorePointer({
    Key? key,
    bool ignoring = true,
    bool? ignoringSemantics,
  }) {
    return then(
      _IgnorePointerElement<S>(
        key: key,
        ignoring: ignoring,
        ignoringSemantics: ignoringSemantics,
      ),
    );
  }
}
