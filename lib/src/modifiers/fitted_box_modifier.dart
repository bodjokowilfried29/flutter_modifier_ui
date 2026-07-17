// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

class _FittedBoxElement<S> extends ModifierElement<S> {
  final Key? key;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final Clip clipBehavior;

  const _FittedBoxElement({
    this.key,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.clipBehavior = Clip.none,
  });

  @override
  Widget build(Widget child) {
    return FittedBox(
      key: key,
      fit: fit,
      alignment: alignment,
      clipBehavior: clipBehavior,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == FittedBox;

  @override
  ModifierProperties get props => [key, fit, alignment, clipBehavior];
}

extension FittedBoxModifier<S> on Modifier<S> {
  Modifier<S> fittedBox({
    Key? key,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    Clip clipBehavior = Clip.none,
  }) {
    return then(
      _FittedBoxElement<S>(
        key: key,
        fit: fit,
        alignment: alignment,
        clipBehavior: clipBehavior,
      ),
    );
  }
}
