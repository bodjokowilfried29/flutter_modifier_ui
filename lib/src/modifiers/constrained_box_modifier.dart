// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [ConstrainedBox] in a modifier chain.
class _ConstrainedBoxElement<S> extends ModifierElement<S> {
  final Key? key;
  final BoxConstraints constraints;

  const _ConstrainedBoxElement({this.key, required this.constraints});

  @override
  Widget build(Widget child) {
    return ConstrainedBox(key: key, constraints: constraints, child: child);
  }

  @override
  bool byWidgetType(Type type) => type == ConstrainedBox;

  @override
  ModifierProperties get props => [key, constraints];
}

extension ConstrainedBoxModifier<S> on Modifier<S> {
  /// Adds a [_ConstrainedBoxElement] to this [Modifier].
  Modifier<S> constrainedBox({Key? key, required BoxConstraints constraints}) {
    return then(_ConstrainedBoxElement<S>(key: key, constraints: constraints));
  }
}
