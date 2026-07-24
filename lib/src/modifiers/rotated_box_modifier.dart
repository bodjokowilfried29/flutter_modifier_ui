// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [RotatedBox] in a modifier chain.
class _RotatedBoxElement<S> extends ModifierElement<S> {
  final Key? key;
  final int quarterTurns;

  const _RotatedBoxElement({this.key, required this.quarterTurns});

  @override
  Widget build(Widget child) {
    return RotatedBox(key: key, quarterTurns: quarterTurns, child: child);
  }

  @override
  bool byWidgetType(Type type) => type == RotatedBox;

  @override
  ModifierProperties get props => [key, quarterTurns];
}

extension RotatedBoxModifier<S> on Modifier<S> {
  /// Adds a [_RotatedBoxElement] to this [Modifier].
  Modifier<S> rotatedBox({Key? key, required int quarterTurns}) {
    return then(_RotatedBoxElement<S>(key: key, quarterTurns: quarterTurns));
  }
}
