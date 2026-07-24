// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [ExcludeSemantics] in a modifier chain.
class _ExcludeSemanticsElement<S> extends ModifierElement<S> {
  final Key? key;
  final bool excluding;

  const _ExcludeSemanticsElement({this.key, this.excluding = true});

  @override
  Widget build(Widget child) {
    return ExcludeSemantics(key: key, excluding: excluding, child: child);
  }

  @override
  bool byWidgetType(Type type) => type == ExcludeSemantics;

  @override
  ModifierProperties get props => [key, excluding];
}

extension ExcludeSemanticsModifier<S> on Modifier<S> {
  /// Adds a [_ExcludeSemanticsElement] to this [Modifier].
  Modifier<S> excludeSemantics({Key? key, bool excluding = true}) {
    return then(_ExcludeSemanticsElement<S>(key: key, excluding: excluding));
  }
}
