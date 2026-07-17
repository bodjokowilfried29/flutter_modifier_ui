// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

class _PaddingElement<S> extends ModifierElement<S> {
  final Key? key;
  final EdgeInsetsGeometry padding;

  const _PaddingElement({this.key, required this.padding});

  @override
  Widget build(Widget child) {
    return Padding(key: key, padding: padding, child: child);
  }

  @override
  bool byWidgetType(Type type) => type == Padding;

  @override
  ModifierProperties get props => [key, padding];
}

extension PaddingModifier<S> on Modifier<S> {
  Modifier<S> padding({Key? key, required EdgeInsetsGeometry padding}) {
    return then(_PaddingElement<S>(key: key, padding: padding));
  }
}
