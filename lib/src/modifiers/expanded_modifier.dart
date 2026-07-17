// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

class _ExpandedElement<S extends FlexScope> extends ModifierElement<S> {
  final Key? key;
  final int flex;

  const _ExpandedElement({this.key, this.flex = 1});

  @override
  Widget build(Widget child) {
    return Expanded(key: key, flex: flex, child: child);
  }

  @override
  bool byWidgetType(Type type) => type == Expanded;

  @override
  ModifierProperties get props => [key, flex];
}

extension ExpandedModifier<S extends FlexScope> on Modifier<S> {
  Modifier<S> expanded({Key? key, int flex = 1}) {
    return then(_ExpandedElement<S>(key: key, flex: flex));
  }
}
