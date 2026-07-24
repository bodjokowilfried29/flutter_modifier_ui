// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [ShortcutRegistrar] in a modifier chain.
class _ShortcutRegistrarElement<S> extends ModifierElement<S> {
  final Key? key;

  const _ShortcutRegistrarElement({this.key});

  @override
  Widget build(Widget child) {
    return ShortcutRegistrar(key: key, child: child);
  }

  @override
  bool byWidgetType(Type type) => type == ShortcutRegistrar;

  @override
  ModifierProperties get props => [key];
}

extension ShortcutRegistrarModifier<S> on Modifier<S> {
  /// Adds a [_ShortcutRegistrarElement] to this [Modifier].
  Modifier<S> shortcutRegistrar({Key? key}) {
    return then(_ShortcutRegistrarElement<S>(key: key));
  }
}
