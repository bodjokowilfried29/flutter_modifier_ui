// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

class _AspectRatioElement<S> extends ModifierElement<S> {
  final Key? key;
  final double aspectRatio;

  const _AspectRatioElement({this.key, required this.aspectRatio});

  @override
  Widget build(Widget child) {
    return AspectRatio(key: key, aspectRatio: aspectRatio, child: child);
  }

  @override
  bool byWidgetType(Type type) => type == AspectRatio;

  @override
  ModifierProperties get props => [key, aspectRatio];
}

extension AspectRatioModifier<S> on Modifier<S> {
  Modifier<S> aspectRatio({Key? key, required double aspectRatio}) {
    return then(_AspectRatioElement<S>(key: key, aspectRatio: aspectRatio));
  }
}
