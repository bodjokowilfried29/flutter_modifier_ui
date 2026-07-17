// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

class _TapRegionElement<S> extends ModifierElement<S> {
  final Key? key;
  final bool enabled;
  final HitTestBehavior behavior;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function(PointerDownEvent)? onTapInside;
  final void Function(PointerUpEvent)? onTapUpOutside;
  final void Function(PointerUpEvent)? onTapUpInside;
  final Object? groupId;
  final bool consumeOutsideTaps;
  final String? debugLabel;

  const _TapRegionElement({
    this.key,
    this.enabled = true,
    this.behavior = HitTestBehavior.deferToChild,
    this.onTapOutside,
    this.onTapInside,
    this.onTapUpOutside,
    this.onTapUpInside,
    this.groupId,
    this.consumeOutsideTaps = false,
    this.debugLabel,
  });

  @override
  Widget build(Widget child) {
    return TapRegion(
      key: key,
      enabled: enabled,
      behavior: behavior,
      onTapOutside: onTapOutside,
      onTapInside: onTapInside,
      onTapUpOutside: onTapUpOutside,
      onTapUpInside: onTapUpInside,
      groupId: groupId,
      consumeOutsideTaps: consumeOutsideTaps,
      debugLabel: debugLabel,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == TapRegion;

  @override
  ModifierProperties get props => [
    key,
    enabled,
    behavior,
    onTapOutside,
    onTapInside,
    onTapUpOutside,
    onTapUpInside,
    groupId,
    consumeOutsideTaps,
    debugLabel,
  ];
}

extension TapRegionModifier<S> on Modifier<S> {
  Modifier<S> tapRegion({
    Key? key,
    bool enabled = true,
    HitTestBehavior behavior = HitTestBehavior.deferToChild,
    void Function(PointerDownEvent)? onTapOutside,
    void Function(PointerDownEvent)? onTapInside,
    void Function(PointerUpEvent)? onTapUpOutside,
    void Function(PointerUpEvent)? onTapUpInside,
    Object? groupId,
    bool consumeOutsideTaps = false,
    String? debugLabel,
  }) {
    return then(
      _TapRegionElement<S>(
        key: key,
        enabled: enabled,
        behavior: behavior,
        onTapOutside: onTapOutside,
        onTapInside: onTapInside,
        onTapUpOutside: onTapUpOutside,
        onTapUpInside: onTapUpInside,
        groupId: groupId,
        consumeOutsideTaps: consumeOutsideTaps,
        debugLabel: debugLabel,
      ),
    );
  }
}
