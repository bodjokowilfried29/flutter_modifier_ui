// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

class _LimitedBoxElement<S> extends ModifierElement<S> {
  final Key? key;
  final double maxWidth;
  final double maxHeight;

  const _LimitedBoxElement({
    this.key,
    this.maxWidth = double.infinity,
    this.maxHeight = double.infinity,
  });

  @override
  Widget build(Widget child) {
    return LimitedBox(
      key: key,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == LimitedBox;

  @override
  ModifierProperties get props => [key, maxWidth, maxHeight];
}

extension LimitedBoxModifier<S> on Modifier<S> {
  Modifier<S> limitedBox({
    Key? key,
    double maxWidth = double.infinity,
    double maxHeight = double.infinity,
  }) {
    return then(
      _LimitedBoxElement<S>(key: key, maxWidth: maxWidth, maxHeight: maxHeight),
    );
  }
}
