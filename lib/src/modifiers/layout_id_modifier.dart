// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

class _LayoutIdElement<S extends MultiChildLayoutScope>
    extends ModifierElement<S> {
  final Key? key;
  final Object id;

  const _LayoutIdElement({this.key, required this.id});

  @override
  Widget build(Widget child) {
    return LayoutId(key: key, id: id, child: child);
  }

  @override
  bool byWidgetType(Type type) => type == LayoutId;

  @override
  ModifierProperties get props => [key, id];
}

extension LayoutIdModifier<S extends MultiChildLayoutScope> on Modifier<S> {
  Modifier<S> layoutId({Key? key, required Object id}) {
    return then(_LayoutIdElement<S>(key: key, id: id));
  }
}
