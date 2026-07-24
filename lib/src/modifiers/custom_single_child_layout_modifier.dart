// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [CustomSingleChildLayout] in a modifier chain.
class _CustomSingleChildLayoutElement<S> extends ModifierElement<S> {
  final Key? key;
  final SingleChildLayoutDelegate delegate;

  const _CustomSingleChildLayoutElement({this.key, required this.delegate});

  @override
  Widget build(Widget child) {
    return CustomSingleChildLayout(key: key, delegate: delegate, child: child);
  }

  @override
  bool byWidgetType(Type type) => type == CustomSingleChildLayout;

  @override
  ModifierProperties get props => [key, delegate];
}

extension CustomSingleChildLayoutModifier<S> on Modifier<S> {
  /// Adds a [_CustomSingleChildLayoutElement] to this [Modifier].
  Modifier<S> customSingleChildLayout({
    Key? key,
    required SingleChildLayoutDelegate delegate,
  }) {
    return then(
      _CustomSingleChildLayoutElement<S>(key: key, delegate: delegate),
    );
  }
}
