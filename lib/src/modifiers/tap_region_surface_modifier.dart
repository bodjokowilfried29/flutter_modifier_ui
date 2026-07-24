// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [TapRegionSurface] in a modifier chain.
class _TapRegionSurfaceElement<S> extends ModifierElement<S> {
  final Key? key;

  const _TapRegionSurfaceElement({this.key});

  @override
  Widget build(Widget child) {
    return TapRegionSurface(key: key, child: child);
  }

  @override
  bool byWidgetType(Type type) => type == TapRegionSurface;

  @override
  ModifierProperties get props => [key];
}

extension TapRegionSurfaceModifier<S> on Modifier<S> {
  /// Adds a [_TapRegionSurfaceElement] to this [Modifier].
  Modifier<S> tapRegionSurface({Key? key}) {
    return then(_TapRegionSurfaceElement<S>(key: key));
  }
}
