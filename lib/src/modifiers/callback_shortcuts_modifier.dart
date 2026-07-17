// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

class _CallbackShortcutsElement<S> extends ModifierElement<S> {
  final Key? key;
  final Map<ShortcutActivator, void Function()> bindings;

  const _CallbackShortcutsElement({this.key, required this.bindings});

  @override
  Widget build(Widget child) {
    return CallbackShortcuts(key: key, bindings: bindings, child: child);
  }

  @override
  bool byWidgetType(Type type) => type == CallbackShortcuts;

  @override
  ModifierProperties get props => [key, bindings];
}

extension CallbackShortcutsModifier<S> on Modifier<S> {
  Modifier<S> callbackShortcuts({
    Key? key,
    required Map<ShortcutActivator, void Function()> bindings,
  }) {
    return then(_CallbackShortcutsElement<S>(key: key, bindings: bindings));
  }
}
