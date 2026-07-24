// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [ColorFiltered] in a modifier chain.
class _ColorFilteredElement<S> extends ModifierElement<S> {
  final ColorFilter colorFilter;
  final Key? key;

  const _ColorFilteredElement({required this.colorFilter, this.key});

  @override
  Widget build(Widget child) {
    return ColorFiltered(colorFilter: colorFilter, key: key, child: child);
  }

  @override
  bool byWidgetType(Type type) => type == ColorFiltered;

  @override
  ModifierProperties get props => [colorFilter, key];
}

extension ColorFilteredModifier<S> on Modifier<S> {
  /// Adds a [_ColorFilteredElement] to this [Modifier].
  Modifier<S> colorFiltered({required ColorFilter colorFilter, Key? key}) {
    return then(_ColorFilteredElement<S>(colorFilter: colorFilter, key: key));
  }
}
