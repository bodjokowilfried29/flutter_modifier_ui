// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

class _IntrinsicWidthElement<S> extends ModifierElement<S> {
  final Key? key;
  final double? stepWidth;
  final double? stepHeight;

  const _IntrinsicWidthElement({this.key, this.stepWidth, this.stepHeight});

  @override
  Widget build(Widget child) {
    return IntrinsicWidth(
      key: key,
      stepWidth: stepWidth,
      stepHeight: stepHeight,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == IntrinsicWidth;

  @override
  ModifierProperties get props => [key, stepWidth, stepHeight];
}

extension IntrinsicWidthModifier<S> on Modifier<S> {
  Modifier<S> intrinsicWidth({
    Key? key,
    double? stepWidth,
    double? stepHeight,
  }) {
    return then(
      _IntrinsicWidthElement<S>(
        key: key,
        stepWidth: stepWidth,
        stepHeight: stepHeight,
      ),
    );
  }
}
