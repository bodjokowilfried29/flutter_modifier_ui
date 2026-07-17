// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

class _SliverVisibilityElement<S extends SliverScope>
    extends ModifierElement<S> {
  final Key? key;
  final Widget replacementSliver;
  final bool visible;
  final bool maintainState;
  final bool maintainAnimation;
  final bool maintainSize;
  final bool maintainSemantics;
  final bool maintainInteractivity;

  const _SliverVisibilityElement({
    this.key,
    this.replacementSliver = const SliverToBoxAdapter(),
    this.visible = true,
    this.maintainState = false,
    this.maintainAnimation = false,
    this.maintainSize = false,
    this.maintainSemantics = false,
    this.maintainInteractivity = false,
  });

  @override
  Widget build(Widget child) {
    return SliverVisibility(
      key: key,
      replacementSliver: replacementSliver,
      visible: visible,
      maintainState: maintainState,
      maintainAnimation: maintainAnimation,
      maintainSize: maintainSize,
      maintainSemantics: maintainSemantics,
      maintainInteractivity: maintainInteractivity,
      sliver: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == SliverVisibility;

  @override
  ModifierProperties get props => [
    key,
    replacementSliver,
    visible,
    maintainState,
    maintainAnimation,
    maintainSize,
    maintainSemantics,
    maintainInteractivity,
  ];
}

extension SliverVisibilityModifier<S extends SliverScope> on Modifier<S> {
  Modifier<S> sliverVisibility({
    Key? key,
    Widget replacementSliver = const SliverToBoxAdapter(),
    bool visible = true,
    bool maintainState = false,
    bool maintainAnimation = false,
    bool maintainSize = false,
    bool maintainSemantics = false,
    bool maintainInteractivity = false,
  }) {
    return then(
      _SliverVisibilityElement<S>(
        key: key,
        replacementSliver: replacementSliver,
        visible: visible,
        maintainState: maintainState,
        maintainAnimation: maintainAnimation,
        maintainSize: maintainSize,
        maintainSemantics: maintainSemantics,
        maintainInteractivity: maintainInteractivity,
      ),
    );
  }
}

class _SliverVisibilityMaintainElement<S extends SliverScope>
    extends ModifierElement<S> {
  final Key? key;
  final Widget replacementSliver;
  final bool visible;

  const _SliverVisibilityMaintainElement({
    this.key,
    this.replacementSliver = const SliverToBoxAdapter(),
    this.visible = true,
  });

  @override
  Widget build(Widget child) {
    return SliverVisibility.maintain(
      key: key,
      replacementSliver: replacementSliver,
      visible: visible,
      sliver: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == SliverVisibility;

  @override
  ModifierProperties get props => [key, replacementSliver, visible];
}

extension SliverVisibilityMaintainModifier<S extends SliverScope>
    on Modifier<S> {
  Modifier<S> sliverVisibilityMaintain({
    Key? key,
    Widget replacementSliver = const SliverToBoxAdapter(),
    bool visible = true,
  }) {
    return then(
      _SliverVisibilityMaintainElement<S>(
        key: key,
        replacementSliver: replacementSliver,
        visible: visible,
      ),
    );
  }
}
