// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [SliverPadding] in a modifier chain.
class _SliverPaddingElement<S extends SliverScope> extends ModifierElement<S> {
  final Key? key;
  final EdgeInsetsGeometry padding;

  const _SliverPaddingElement({this.key, required this.padding});

  @override
  Widget build(Widget child) {
    return SliverPadding(key: key, padding: padding, sliver: child);
  }

  @override
  bool byWidgetType(Type type) => type == SliverPadding;

  @override
  ModifierProperties get props => [key, padding];
}

extension SliverPaddingModifier<S extends SliverScope> on Modifier<S> {
  /// Adds a [_SliverPaddingElement] to this [Modifier].
  Modifier<S> sliverPadding({Key? key, required EdgeInsetsGeometry padding}) {
    return then(_SliverPaddingElement<S>(key: key, padding: padding));
  }
}
