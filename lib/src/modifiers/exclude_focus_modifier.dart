// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [ExcludeFocus] in a modifier chain.
class _ExcludeFocusElement<S> extends ModifierElement<S> {
  final Key? key;
  final bool excluding;

  const _ExcludeFocusElement({this.key, this.excluding = true});

  @override
  Widget build(Widget child) {
    return ExcludeFocus(key: key, excluding: excluding, child: child);
  }

  @override
  bool byWidgetType(Type type) => type == ExcludeFocus;

  @override
  ModifierProperties get props => [key, excluding];
}

extension ExcludeFocusModifier<S> on Modifier<S> {
  /// Adds a [_ExcludeFocusElement] to this [Modifier].
  Modifier<S> excludeFocus({Key? key, bool excluding = true}) {
    return then(_ExcludeFocusElement<S>(key: key, excluding: excluding));
  }
}
