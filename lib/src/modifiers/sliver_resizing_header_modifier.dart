// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [SliverResizingHeader] in a modifier chain.
class _SliverResizingHeaderElement<S extends SliverScope>
    extends ModifierElement<S> {
  final Key? key;
  final Widget? minExtentPrototype;
  final Widget? maxExtentPrototype;

  const _SliverResizingHeaderElement({
    this.key,
    this.minExtentPrototype,
    this.maxExtentPrototype,
  });

  @override
  Widget build(Widget child) {
    return SliverResizingHeader(
      key: key,
      minExtentPrototype: minExtentPrototype,
      maxExtentPrototype: maxExtentPrototype,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == SliverResizingHeader;

  @override
  ModifierProperties get props => [key, minExtentPrototype, maxExtentPrototype];
}

extension SliverResizingHeaderModifier<S extends SliverScope> on Modifier<S> {
  /// Adds a [_SliverResizingHeaderElement] to this [Modifier].
  Modifier<S> sliverResizingHeader({
    Key? key,
    Widget? minExtentPrototype,
    Widget? maxExtentPrototype,
  }) {
    return then(
      _SliverResizingHeaderElement<S>(
        key: key,
        minExtentPrototype: minExtentPrototype,
        maxExtentPrototype: maxExtentPrototype,
      ),
    );
  }
}
