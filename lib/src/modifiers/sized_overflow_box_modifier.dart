// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

class _SizedOverflowBoxElement<S> extends ModifierElement<S> {
  final Key? key;
  final Size size;
  final AlignmentGeometry alignment;

  const _SizedOverflowBoxElement({
    this.key,
    required this.size,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(Widget child) {
    return SizedOverflowBox(
      key: key,
      size: size,
      alignment: alignment,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == SizedOverflowBox;

  @override
  ModifierProperties get props => [key, size, alignment];
}

extension SizedOverflowBoxModifier<S> on Modifier<S> {
  Modifier<S> sizedOverflowBox({
    Key? key,
    required Size size,
    AlignmentGeometry alignment = Alignment.center,
  }) {
    return then(
      _SizedOverflowBoxElement<S>(key: key, size: size, alignment: alignment),
    );
  }
}
