// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

class _CustomPaintElement<S> extends ModifierElement<S> {
  final Key? key;
  final CustomPainter? painter;
  final CustomPainter? foregroundPainter;
  final Size size;
  final bool isComplex;
  final bool willChange;

  const _CustomPaintElement({
    this.key,
    this.painter,
    this.foregroundPainter,
    this.size = Size.zero,
    this.isComplex = false,
    this.willChange = false,
  });

  @override
  Widget build(Widget child) {
    return CustomPaint(
      key: key,
      painter: painter,
      foregroundPainter: foregroundPainter,
      size: size,
      isComplex: isComplex,
      willChange: willChange,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == CustomPaint;

  @override
  ModifierProperties get props => [
    key,
    painter,
    foregroundPainter,
    size,
    isComplex,
    willChange,
  ];
}

extension CustomPaintModifier<S> on Modifier<S> {
  Modifier<S> customPaint({
    Key? key,
    CustomPainter? painter,
    CustomPainter? foregroundPainter,
    Size size = Size.zero,
    bool isComplex = false,
    bool willChange = false,
  }) {
    return then(
      _CustomPaintElement<S>(
        key: key,
        painter: painter,
        foregroundPainter: foregroundPainter,
        size: size,
        isComplex: isComplex,
        willChange: willChange,
      ),
    );
  }
}
