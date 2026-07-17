// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'dart:ui';

import 'package:flutter/material.dart';

import '../modifier.dart';

class _BackdropFilterElement<S> extends ModifierElement<S> {
  final Key? key;
  final ImageFilter? filter;
  final ImageFilterConfig? filterConfig;
  final BlendMode blendMode;
  final bool enabled;
  final BackdropKey? backdropGroupKey;

  const _BackdropFilterElement({
    this.key,
    this.filter,
    this.filterConfig,
    this.blendMode = BlendMode.srcOver,
    this.enabled = true,
    this.backdropGroupKey,
  });

  @override
  Widget build(Widget child) {
    return BackdropFilter(
      key: key,
      filter: filter,
      filterConfig: filterConfig,
      blendMode: blendMode,
      enabled: enabled,
      backdropGroupKey: backdropGroupKey,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == BackdropFilter;

  @override
  ModifierProperties get props => [
    key,
    filter,
    filterConfig,
    blendMode,
    enabled,
    backdropGroupKey,
  ];
}

extension BackdropFilterModifier<S> on Modifier<S> {
  Modifier<S> backdropFilter({
    Key? key,
    ImageFilter? filter,
    ImageFilterConfig? filterConfig,
    BlendMode blendMode = BlendMode.srcOver,
    bool enabled = true,
    BackdropKey? backdropGroupKey,
  }) {
    return then(
      _BackdropFilterElement<S>(
        key: key,
        filter: filter,
        filterConfig: filterConfig,
        blendMode: blendMode,
        enabled: enabled,
        backdropGroupKey: backdropGroupKey,
      ),
    );
  }
}

class _BackdropFilterGroupedElement<S> extends ModifierElement<S> {
  final Key? key;
  final ImageFilter? filter;
  final ImageFilterConfig? filterConfig;
  final BlendMode blendMode;
  final bool enabled;

  const _BackdropFilterGroupedElement({
    this.key,
    this.filter,
    this.filterConfig,
    this.blendMode = BlendMode.srcOver,
    this.enabled = true,
  });

  @override
  Widget build(Widget child) {
    return BackdropFilter.grouped(
      key: key,
      filter: filter,
      filterConfig: filterConfig,
      blendMode: blendMode,
      enabled: enabled,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == BackdropFilter;

  @override
  ModifierProperties get props => [
    key,
    filter,
    filterConfig,
    blendMode,
    enabled,
  ];
}

extension BackdropFilterGroupedModifier<S> on Modifier<S> {
  Modifier<S> backdropFilterGrouped({
    Key? key,
    ImageFilter? filter,
    ImageFilterConfig? filterConfig,
    BlendMode blendMode = BlendMode.srcOver,
    bool enabled = true,
  }) {
    return then(
      _BackdropFilterGroupedElement<S>(
        key: key,
        filter: filter,
        filterConfig: filterConfig,
        blendMode: blendMode,
        enabled: enabled,
      ),
    );
  }
}
