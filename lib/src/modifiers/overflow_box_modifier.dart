// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../modifier.dart';

/// Represents a [OverflowBox] in a modifier chain.
class _OverflowBoxElement<S> extends ModifierElement<S> {
  final Key? key;
  final AlignmentGeometry alignment;
  final double? minWidth;
  final double? maxWidth;
  final double? minHeight;
  final double? maxHeight;
  final OverflowBoxFit fit;

  const _OverflowBoxElement({
    this.key,
    this.alignment = Alignment.center,
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
    this.fit = OverflowBoxFit.max,
  });

  @override
  Widget build(Widget child) {
    return OverflowBox(
      key: key,
      alignment: alignment,
      minWidth: minWidth,
      maxWidth: maxWidth,
      minHeight: minHeight,
      maxHeight: maxHeight,
      fit: fit,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == OverflowBox;

  @override
  ModifierProperties get props => [
    key,
    alignment,
    minWidth,
    maxWidth,
    minHeight,
    maxHeight,
    fit,
  ];
}

extension OverflowBoxModifier<S> on Modifier<S> {
  /// Adds a [_OverflowBoxElement] to this [Modifier].
  Modifier<S> overflowBox({
    Key? key,
    AlignmentGeometry alignment = Alignment.center,
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
    OverflowBoxFit fit = OverflowBoxFit.max,
  }) {
    return then(
      _OverflowBoxElement<S>(
        key: key,
        alignment: alignment,
        minWidth: minWidth,
        maxWidth: maxWidth,
        minHeight: minHeight,
        maxHeight: maxHeight,
        fit: fit,
      ),
    );
  }
}
