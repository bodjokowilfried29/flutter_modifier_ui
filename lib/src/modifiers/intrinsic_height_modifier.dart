// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

class _IntrinsicHeightElement<S> extends ModifierElement<S> {
  final Key? key;

  const _IntrinsicHeightElement({this.key});

  @override
  Widget build(Widget child) {
    return IntrinsicHeight(key: key, child: child);
  }

  @override
  bool byWidgetType(Type type) => type == IntrinsicHeight;

  @override
  ModifierProperties get props => [key];
}

extension IntrinsicHeightModifier<S> on Modifier<S> {
  Modifier<S> intrinsicHeight({Key? key}) {
    return then(_IntrinsicHeightElement<S>(key: key));
  }
}
