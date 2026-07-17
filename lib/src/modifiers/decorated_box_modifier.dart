// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

class _DecoratedBoxElement<S> extends ModifierElement<S> {
  final Key? key;
  final Decoration decoration;
  final DecorationPosition position;

  const _DecoratedBoxElement({
    this.key,
    required this.decoration,
    this.position = DecorationPosition.background,
  });

  @override
  Widget build(Widget child) {
    return DecoratedBox(
      key: key,
      decoration: decoration,
      position: position,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == DecoratedBox;

  @override
  ModifierProperties get props => [key, decoration, position];
}

extension DecoratedBoxModifier<S> on Modifier<S> {
  Modifier<S> decoratedBox({
    Key? key,
    required Decoration decoration,
    DecorationPosition position = DecorationPosition.background,
  }) {
    return then(
      _DecoratedBoxElement<S>(
        key: key,
        decoration: decoration,
        position: position,
      ),
    );
  }
}
