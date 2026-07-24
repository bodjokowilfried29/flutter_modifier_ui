// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [ColoredBox] in a modifier chain.
class _ColoredBoxElement<S> extends ModifierElement<S> {
  final Color color;
  final bool isAntiAlias;
  final Key? key;

  const _ColoredBoxElement({
    required this.color,
    this.isAntiAlias = true,
    this.key,
  });

  @override
  Widget build(Widget child) {
    return ColoredBox(
      color: color,
      isAntiAlias: isAntiAlias,
      key: key,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == ColoredBox;

  @override
  ModifierProperties get props => [color, isAntiAlias, key];
}

extension ColoredBoxModifier<S> on Modifier<S> {
  /// Adds a [_ColoredBoxElement] to this [Modifier].
  Modifier<S> coloredBox({
    required Color color,
    bool isAntiAlias = true,
    Key? key,
  }) {
    return then(
      _ColoredBoxElement<S>(color: color, isAntiAlias: isAntiAlias, key: key),
    );
  }
}
