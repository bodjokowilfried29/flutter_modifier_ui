// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [SliverOffstage] in a modifier chain.
class _SliverOffstageElement<S extends SliverScope> extends ModifierElement<S> {
  final Key? key;
  final bool offstage;

  const _SliverOffstageElement({this.key, this.offstage = true});

  @override
  Widget build(Widget child) {
    return SliverOffstage(key: key, offstage: offstage, sliver: child);
  }

  @override
  bool byWidgetType(Type type) => type == SliverOffstage;

  @override
  ModifierProperties get props => [key, offstage];
}

extension SliverOffstageModifier<S extends SliverScope> on Modifier<S> {
  /// Adds a [_SliverOffstageElement] to this [Modifier].
  Modifier<S> sliverOffstage({Key? key, bool offstage = true}) {
    return then(_SliverOffstageElement<S>(key: key, offstage: offstage));
  }
}
