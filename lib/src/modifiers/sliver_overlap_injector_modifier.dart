// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

class _SliverOverlapInjectorElement<S extends SliverScope>
    extends ModifierElement<S> {
  final Key? key;
  final SliverOverlapAbsorberHandle handle;

  const _SliverOverlapInjectorElement({this.key, required this.handle});

  @override
  Widget build(Widget child) {
    return SliverOverlapInjector(key: key, handle: handle, sliver: child);
  }

  @override
  bool byWidgetType(Type type) => type == SliverOverlapInjector;

  @override
  ModifierProperties get props => [key, handle];
}

extension SliverOverlapInjectorModifier<S extends SliverScope> on Modifier<S> {
  Modifier<S> sliverOverlapInjector({
    Key? key,
    required SliverOverlapAbsorberHandle handle,
  }) {
    return then(_SliverOverlapInjectorElement<S>(key: key, handle: handle));
  }
}
