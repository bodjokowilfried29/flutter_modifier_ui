// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

class _StretchEffectElement<S> extends ModifierElement<S> {
  final Key? key;
  final double stretchStrength;
  final Axis axis;

  const _StretchEffectElement({
    this.key,
    this.stretchStrength = 0.0,
    required this.axis,
  });

  @override
  Widget build(Widget child) {
    return StretchEffect(
      key: key,
      stretchStrength: stretchStrength,
      axis: axis,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == StretchEffect;

  @override
  ModifierProperties get props => [key, stretchStrength, axis];
}

extension StretchEffectModifier<S> on Modifier<S> {
  Modifier<S> stretchEffect({
    Key? key,
    double stretchStrength = 0.0,
    required Axis axis,
  }) {
    return then(
      _StretchEffectElement<S>(
        key: key,
        stretchStrength: stretchStrength,
        axis: axis,
      ),
    );
  }
}
