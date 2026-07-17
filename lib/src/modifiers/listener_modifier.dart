// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../modifier.dart';

class _ListenerElement<S> extends ModifierElement<S> {
  final Key? key;
  final void Function(PointerDownEvent)? onPointerDown;
  final void Function(PointerMoveEvent)? onPointerMove;
  final void Function(PointerUpEvent)? onPointerUp;
  final void Function(PointerHoverEvent)? onPointerHover;
  final void Function(PointerCancelEvent)? onPointerCancel;
  final void Function(PointerPanZoomStartEvent)? onPointerPanZoomStart;
  final void Function(PointerPanZoomUpdateEvent)? onPointerPanZoomUpdate;
  final void Function(PointerPanZoomEndEvent)? onPointerPanZoomEnd;
  final void Function(PointerSignalEvent)? onPointerSignal;
  final HitTestBehavior behavior;

  const _ListenerElement({
    this.key,
    this.onPointerDown,
    this.onPointerMove,
    this.onPointerUp,
    this.onPointerHover,
    this.onPointerCancel,
    this.onPointerPanZoomStart,
    this.onPointerPanZoomUpdate,
    this.onPointerPanZoomEnd,
    this.onPointerSignal,
    this.behavior = HitTestBehavior.deferToChild,
  });

  @override
  Widget build(Widget child) {
    return Listener(
      key: key,
      onPointerDown: onPointerDown,
      onPointerMove: onPointerMove,
      onPointerUp: onPointerUp,
      onPointerHover: onPointerHover,
      onPointerCancel: onPointerCancel,
      onPointerPanZoomStart: onPointerPanZoomStart,
      onPointerPanZoomUpdate: onPointerPanZoomUpdate,
      onPointerPanZoomEnd: onPointerPanZoomEnd,
      onPointerSignal: onPointerSignal,
      behavior: behavior,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == Listener;

  @override
  ModifierProperties get props => [
    key,
    onPointerDown,
    onPointerMove,
    onPointerUp,
    onPointerHover,
    onPointerCancel,
    onPointerPanZoomStart,
    onPointerPanZoomUpdate,
    onPointerPanZoomEnd,
    onPointerSignal,
    behavior,
  ];
}

extension ListenerModifier<S> on Modifier<S> {
  Modifier<S> listener({
    Key? key,
    void Function(PointerDownEvent)? onPointerDown,
    void Function(PointerMoveEvent)? onPointerMove,
    void Function(PointerUpEvent)? onPointerUp,
    void Function(PointerHoverEvent)? onPointerHover,
    void Function(PointerCancelEvent)? onPointerCancel,
    void Function(PointerPanZoomStartEvent)? onPointerPanZoomStart,
    void Function(PointerPanZoomUpdateEvent)? onPointerPanZoomUpdate,
    void Function(PointerPanZoomEndEvent)? onPointerPanZoomEnd,
    void Function(PointerSignalEvent)? onPointerSignal,
    HitTestBehavior behavior = HitTestBehavior.deferToChild,
  }) {
    return then(
      _ListenerElement<S>(
        key: key,
        onPointerDown: onPointerDown,
        onPointerMove: onPointerMove,
        onPointerUp: onPointerUp,
        onPointerHover: onPointerHover,
        onPointerCancel: onPointerCancel,
        onPointerPanZoomStart: onPointerPanZoomStart,
        onPointerPanZoomUpdate: onPointerPanZoomUpdate,
        onPointerPanZoomEnd: onPointerPanZoomEnd,
        onPointerSignal: onPointerSignal,
        behavior: behavior,
      ),
    );
  }
}
