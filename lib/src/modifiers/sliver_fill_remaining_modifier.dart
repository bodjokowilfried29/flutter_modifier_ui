// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

class _SliverFillRemainingElement<S extends SliverScope>
    extends ModifierElement<S> {
  final Key? key;
  final bool hasScrollBody;
  final bool fillOverscroll;

  const _SliverFillRemainingElement({
    this.key,
    this.hasScrollBody = true,
    this.fillOverscroll = false,
  });

  @override
  Widget build(Widget child) {
    return SliverFillRemaining(
      key: key,
      hasScrollBody: hasScrollBody,
      fillOverscroll: fillOverscroll,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == SliverFillRemaining;

  @override
  ModifierProperties get props => [key, hasScrollBody, fillOverscroll];
}

extension SliverFillRemainingModifier<S extends SliverScope> on Modifier<S> {
  Modifier<S> sliverFillRemaining({
    Key? key,
    bool hasScrollBody = true,
    bool fillOverscroll = false,
  }) {
    return then(
      _SliverFillRemainingElement<S>(
        key: key,
        hasScrollBody: hasScrollBody,
        fillOverscroll: fillOverscroll,
      ),
    );
  }
}
