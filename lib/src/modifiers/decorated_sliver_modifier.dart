// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

class _DecoratedSliverElement<S extends SliverScope>
    extends ModifierElement<S> {
  final Key? key;
  final Decoration decoration;
  final DecorationPosition position;

  const _DecoratedSliverElement({
    this.key,
    required this.decoration,
    this.position = DecorationPosition.background,
  });

  @override
  Widget build(Widget child) {
    return DecoratedSliver(
      key: key,
      decoration: decoration,
      position: position,
      sliver: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == DecoratedSliver;

  @override
  ModifierProperties get props => [key, decoration, position];
}

extension DecoratedSliverModifier<S extends SliverScope> on Modifier<S> {
  Modifier<S> decoratedSliver({
    Key? key,
    required Decoration decoration,
    DecorationPosition position = DecorationPosition.background,
  }) {
    return then(
      _DecoratedSliverElement<S>(
        key: key,
        decoration: decoration,
        position: position,
      ),
    );
  }
}
