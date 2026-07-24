// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents an [AbsorbPointer] in a modifier chain.
class _AbsorbPointerElement<S> extends ModifierElement<S> {
  final Key? key;
  final bool absorbing;
  final bool? ignoringSemantics;

  const _AbsorbPointerElement({
    this.key,
    this.absorbing = true,
    this.ignoringSemantics,
  });

  @override
  Widget build(Widget child) {
    return AbsorbPointer(
      key: key,
      absorbing: absorbing,
      ignoringSemantics: ignoringSemantics,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == AbsorbPointer;

  @override
  ModifierProperties get props => [key, absorbing, ignoringSemantics];
}

extension AbsorbPointerModifier<S> on Modifier<S> {
  /// Adds an [_AbsorbPointerElement] to this [Modifier].
  Modifier<S> absorbPointer({
    Key? key,
    bool absorbing = true,
    bool? ignoringSemantics,
  }) {
    return then(
      _AbsorbPointerElement<S>(
        key: key,
        absorbing: absorbing,
        ignoringSemantics: ignoringSemantics,
      ),
    );
  }
}
