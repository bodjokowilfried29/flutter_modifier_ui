// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [SingleChildScrollView] in a modifier chain.
class _SingleChildScrollViewElement<S> extends ModifierElement<S> {
  final Key? key;
  final Axis scrollDirection;
  final bool reverse;
  final EdgeInsetsGeometry? padding;
  final bool? primary;
  final ScrollPhysics? physics;
  final ScrollController? controller;
  final DragStartBehavior dragStartBehavior;
  final Clip clipBehavior;
  final HitTestBehavior hitTestBehavior;
  final String? restorationId;
  final ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior;

  const _SingleChildScrollViewElement({
    this.key,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.padding,
    this.primary,
    this.physics,
    this.controller,
    this.dragStartBehavior = DragStartBehavior.start,
    this.clipBehavior = Clip.hardEdge,
    this.hitTestBehavior = HitTestBehavior.opaque,
    this.restorationId,
    this.keyboardDismissBehavior,
  });

  @override
  Widget build(Widget child) {
    return SingleChildScrollView(
      key: key,
      scrollDirection: scrollDirection,
      reverse: reverse,
      padding: padding,
      primary: primary,
      physics: physics,
      controller: controller,
      dragStartBehavior: dragStartBehavior,
      clipBehavior: clipBehavior,
      hitTestBehavior: hitTestBehavior,
      restorationId: restorationId,
      keyboardDismissBehavior: keyboardDismissBehavior,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == SingleChildScrollView;

  @override
  ModifierProperties get props => [
    key,
    scrollDirection,
    reverse,
    padding,
    primary,
    physics,
    controller,
    dragStartBehavior,
    clipBehavior,
    hitTestBehavior,
    restorationId,
    keyboardDismissBehavior,
  ];
}

extension SingleChildScrollViewModifier<S> on Modifier<S> {
  /// Adds a [_SingleChildScrollViewElement] to this [Modifier].
  Modifier<S> singleChildScrollView({
    Key? key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    EdgeInsetsGeometry? padding,
    bool? primary,
    ScrollPhysics? physics,
    ScrollController? controller,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    Clip clipBehavior = Clip.hardEdge,
    HitTestBehavior hitTestBehavior = HitTestBehavior.opaque,
    String? restorationId,
    ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior,
  }) {
    return then(
      _SingleChildScrollViewElement<S>(
        key: key,
        scrollDirection: scrollDirection,
        reverse: reverse,
        padding: padding,
        primary: primary,
        physics: physics,
        controller: controller,
        dragStartBehavior: dragStartBehavior,
        clipBehavior: clipBehavior,
        hitTestBehavior: hitTestBehavior,
        restorationId: restorationId,
        keyboardDismissBehavior: keyboardDismissBehavior,
      ),
    );
  }
}
