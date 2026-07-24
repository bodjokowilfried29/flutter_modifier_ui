// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [SizeChangedLayoutNotifier] in a modifier chain.
class _SizeChangedLayoutNotifierElement<S> extends ModifierElement<S> {
  final Key? key;

  const _SizeChangedLayoutNotifierElement({this.key});

  @override
  Widget build(Widget child) {
    return SizeChangedLayoutNotifier(key: key, child: child);
  }

  @override
  bool byWidgetType(Type type) => type == SizeChangedLayoutNotifier;

  @override
  ModifierProperties get props => [key];
}

extension SizeChangedLayoutNotifierModifier<S> on Modifier<S> {
  /// Adds a [_SizeChangedLayoutNotifierElement] to this [Modifier].
  Modifier<S> sizeChangedLayoutNotifier({Key? key}) {
    return then(_SizeChangedLayoutNotifierElement<S>(key: key));
  }
}
