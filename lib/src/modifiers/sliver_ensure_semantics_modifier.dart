// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [SliverEnsureSemantics] in a modifier chain.
class _SliverEnsureSemanticsElement<S extends SliverScope>
    extends ModifierElement<S> {
  final Key? key;

  const _SliverEnsureSemanticsElement({this.key});

  @override
  Widget build(Widget child) {
    return SliverEnsureSemantics(key: key, sliver: child);
  }

  @override
  bool byWidgetType(Type type) => type == SliverEnsureSemantics;

  @override
  ModifierProperties get props => [key];
}

extension SliverEnsureSemanticsModifier<S extends SliverScope> on Modifier<S> {
  /// Adds a [_SliverEnsureSemanticsElement] to this [Modifier].
  Modifier<S> sliverEnsureSemantics({Key? key}) {
    return then(_SliverEnsureSemanticsElement<S>(key: key));
  }
}
