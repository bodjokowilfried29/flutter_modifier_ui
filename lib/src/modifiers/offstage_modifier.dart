// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [Offstage] in a modifier chain.
class _OffstageElement<S> extends ModifierElement<S> {
  final Key? key;
  final bool offstage;

  const _OffstageElement({this.key, this.offstage = true});

  @override
  Widget build(Widget child) {
    return Offstage(key: key, offstage: offstage, child: child);
  }

  @override
  bool byWidgetType(Type type) => type == Offstage;

  @override
  ModifierProperties get props => [key, offstage];
}

extension OffstageModifier<S> on Modifier<S> {
  /// Adds a [_OffstageElement] to this [Modifier].
  Modifier<S> offstage({Key? key, bool offstage = true}) {
    return then(_OffstageElement<S>(key: key, offstage: offstage));
  }
}
