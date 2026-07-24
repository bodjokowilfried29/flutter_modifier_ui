// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [SliverToBoxAdapter] in a modifier chain.
class _SliverToBoxAdapterElement<S extends SliverScope>
    extends ModifierElement<S> {
  final Key? key;

  const _SliverToBoxAdapterElement({this.key});

  @override
  Widget build(Widget child) {
    return SliverToBoxAdapter(key: key, child: child);
  }

  @override
  bool byWidgetType(Type type) => type == SliverToBoxAdapter;

  @override
  ModifierProperties get props => [key];
}

extension SliverToBoxAdapterModifier<S extends SliverScope> on Modifier<S> {
  /// Adds a [_SliverToBoxAdapterElement] to this [Modifier].
  Modifier<S> sliverToBoxAdapter({Key? key}) {
    return then(_SliverToBoxAdapterElement<S>(key: key));
  }
}
