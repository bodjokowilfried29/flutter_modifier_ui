// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [MergeSemantics] in a modifier chain.
class _MergeSemanticsElement<S> extends ModifierElement<S> {
  final Key? key;

  const _MergeSemanticsElement({this.key});

  @override
  Widget build(Widget child) {
    return MergeSemantics(key: key, child: child);
  }

  @override
  bool byWidgetType(Type type) => type == MergeSemantics;

  @override
  ModifierProperties get props => [key];
}

extension MergeSemanticsModifier<S> on Modifier<S> {
  /// Adds a [_MergeSemanticsElement] to this [Modifier].
  Modifier<S> mergeSemantics({Key? key}) {
    return then(_MergeSemanticsElement<S>(key: key));
  }
}
