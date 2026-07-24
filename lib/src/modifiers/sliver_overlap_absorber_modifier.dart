// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [SliverOverlapAbsorber] in a modifier chain.
class _SliverOverlapAbsorberElement<S extends SliverScope>
    extends ModifierElement<S> {
  final Key? key;
  final SliverOverlapAbsorberHandle handle;

  const _SliverOverlapAbsorberElement({this.key, required this.handle});

  @override
  Widget build(Widget child) {
    return SliverOverlapAbsorber(key: key, handle: handle, sliver: child);
  }

  @override
  bool byWidgetType(Type type) => type == SliverOverlapAbsorber;

  @override
  ModifierProperties get props => [key, handle];
}

extension SliverOverlapAbsorberModifier<S extends SliverScope> on Modifier<S> {
  /// Adds a [_SliverOverlapAbsorberElement] to this [Modifier].
  Modifier<S> sliverOverlapAbsorber({
    Key? key,
    required SliverOverlapAbsorberHandle handle,
  }) {
    return then(_SliverOverlapAbsorberElement<S>(key: key, handle: handle));
  }
}
