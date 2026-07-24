// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [Flexible] in a modifier chain.
class _FlexibleElement<S extends FlexScope> extends ModifierElement<S> {
  final Key? key;
  final int flex;
  final FlexFit fit;

  const _FlexibleElement({this.key, this.flex = 1, this.fit = FlexFit.loose});

  @override
  Widget build(Widget child) {
    return Flexible(key: key, flex: flex, fit: fit, child: child);
  }

  @override
  bool byWidgetType(Type type) => type == Flexible;

  @override
  ModifierProperties get props => [key, flex, fit];
}

extension FlexibleModifier<S extends FlexScope> on Modifier<S> {
  /// Adds a [_FlexibleElement] to this [Modifier].
  Modifier<S> flexible({Key? key, int flex = 1, FlexFit fit = FlexFit.loose}) {
    return then(_FlexibleElement<S>(key: key, flex: flex, fit: fit));
  }
}
