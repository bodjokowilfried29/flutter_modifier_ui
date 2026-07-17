// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../modifier.dart';

class _MouseRegionElement<S> extends ModifierElement<S> {
  final Key? key;
  final void Function(PointerEnterEvent)? onEnter;
  final void Function(PointerExitEvent)? onExit;
  final void Function(PointerHoverEvent)? onHover;
  final MouseCursor cursor;
  final bool opaque;
  final HitTestBehavior? hitTestBehavior;

  const _MouseRegionElement({
    this.key,
    this.onEnter,
    this.onExit,
    this.onHover,
    this.cursor = MouseCursor.defer,
    this.opaque = true,
    this.hitTestBehavior,
  });

  @override
  Widget build(Widget child) {
    return MouseRegion(
      key: key,
      onEnter: onEnter,
      onExit: onExit,
      onHover: onHover,
      cursor: cursor,
      opaque: opaque,
      hitTestBehavior: hitTestBehavior,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == MouseRegion;

  @override
  ModifierProperties get props => [
    key,
    onEnter,
    onExit,
    onHover,
    cursor,
    opaque,
    hitTestBehavior,
  ];
}

extension MouseRegionModifier<S> on Modifier<S> {
  Modifier<S> mouseRegion({
    Key? key,
    void Function(PointerEnterEvent)? onEnter,
    void Function(PointerExitEvent)? onExit,
    void Function(PointerHoverEvent)? onHover,
    MouseCursor cursor = MouseCursor.defer,
    bool opaque = true,
    HitTestBehavior? hitTestBehavior,
  }) {
    return then(
      _MouseRegionElement<S>(
        key: key,
        onEnter: onEnter,
        onExit: onExit,
        onHover: onHover,
        cursor: cursor,
        opaque: opaque,
        hitTestBehavior: hitTestBehavior,
      ),
    );
  }
}
