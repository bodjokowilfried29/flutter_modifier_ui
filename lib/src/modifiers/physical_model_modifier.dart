// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

class _PhysicalModelElement<S> extends ModifierElement<S> {
  final Key? key;
  final BoxShape shape;
  final Clip clipBehavior;
  final BorderRadius? borderRadius;
  final double elevation;
  final Color color;
  final Color shadowColor;

  const _PhysicalModelElement({
    this.key,
    this.shape = BoxShape.rectangle,
    this.clipBehavior = Clip.none,
    this.borderRadius,
    this.elevation = 0.0,
    required this.color,
    this.shadowColor = const Color(0xFF000000),
  });

  @override
  Widget build(Widget child) {
    return PhysicalModel(
      key: key,
      shape: shape,
      clipBehavior: clipBehavior,
      borderRadius: borderRadius,
      elevation: elevation,
      color: color,
      shadowColor: shadowColor,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == PhysicalModel;

  @override
  ModifierProperties get props => [
    key,
    shape,
    clipBehavior,
    borderRadius,
    elevation,
    color,
    shadowColor,
  ];
}

extension PhysicalModelModifier<S> on Modifier<S> {
  Modifier<S> physicalModel({
    Key? key,
    BoxShape shape = BoxShape.rectangle,
    Clip clipBehavior = Clip.none,
    BorderRadius? borderRadius,
    double elevation = 0.0,
    required Color color,
    Color shadowColor = const Color(0xFF000000),
  }) {
    return then(
      _PhysicalModelElement<S>(
        key: key,
        shape: shape,
        clipBehavior: clipBehavior,
        borderRadius: borderRadius,
        elevation: elevation,
        color: color,
        shadowColor: shadowColor,
      ),
    );
  }
}
