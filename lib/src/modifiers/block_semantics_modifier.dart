// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [BlockSemantics] in a modifier chain.
class _BlockSemanticsElement<S> extends ModifierElement<S> {
  final Key? key;
  final bool blocking;

  const _BlockSemanticsElement({this.key, this.blocking = true});

  @override
  Widget build(Widget child) {
    return BlockSemantics(key: key, blocking: blocking, child: child);
  }

  @override
  bool byWidgetType(Type type) => type == BlockSemantics;

  @override
  ModifierProperties get props => [key, blocking];
}

extension BlockSemanticsModifier<S> on Modifier<S> {
  /// Adds a [_BlockSemanticsElement] to this [Modifier].
  Modifier<S> blockSemantics({Key? key, bool blocking = true}) {
    return then(_BlockSemanticsElement<S>(key: key, blocking: blocking));
  }
}
