// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

class _AlignElement<S> extends ModifierElement<S> {
  final Key? key;
  final AlignmentGeometry alignment;
  final double? widthFactor;
  final double? heightFactor;

  const _AlignElement({
    this.key,
    this.alignment = Alignment.center,
    this.widthFactor,
    this.heightFactor,
  });

  @override
  Widget build(Widget child) {
    return Align(
      key: key,
      alignment: alignment,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == Align;

  @override
  ModifierProperties get props => [key, alignment, widthFactor, heightFactor];
}

extension AlignModifier<S> on Modifier<S> {
  Modifier<S> align({
    Key? key,
    AlignmentGeometry alignment = Alignment.center,
    double? widthFactor,
    double? heightFactor,
  }) {
    return then(
      _AlignElement<S>(
        key: key,
        alignment: alignment,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
      ),
    );
  }
}
