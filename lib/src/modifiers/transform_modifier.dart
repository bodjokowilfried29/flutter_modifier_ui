// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [Transform] in a modifier chain.
class _TransformElement<S> extends ModifierElement<S> {
  final Key? key;
  final Matrix4 transform;
  final Offset? origin;
  final AlignmentGeometry? alignment;
  final bool transformHitTests;
  final FilterQuality? filterQuality;

  const _TransformElement({
    this.key,
    required this.transform,
    this.origin,
    this.alignment,
    this.transformHitTests = true,
    this.filterQuality,
  });

  @override
  Widget build(Widget child) {
    return Transform(
      key: key,
      transform: transform,
      origin: origin,
      alignment: alignment,
      transformHitTests: transformHitTests,
      filterQuality: filterQuality,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == Transform;

  @override
  ModifierProperties get props => [
    key,
    transform,
    origin,
    alignment,
    transformHitTests,
    filterQuality,
  ];
}

extension TransformModifier<S> on Modifier<S> {
  /// Adds a [_TransformElement] to this [Modifier].
  Modifier<S> transform({
    Key? key,
    required Matrix4 transform,
    Offset? origin,
    AlignmentGeometry? alignment,
    bool transformHitTests = true,
    FilterQuality? filterQuality,
  }) {
    return then(
      _TransformElement<S>(
        key: key,
        transform: transform,
        origin: origin,
        alignment: alignment,
        transformHitTests: transformHitTests,
        filterQuality: filterQuality,
      ),
    );
  }
}

/// Represents a [Transform.rotate] in a modifier chain.
class _TransformRotateElement<S> extends ModifierElement<S> {
  final Key? key;
  final double angle;
  final Offset? origin;
  final AlignmentGeometry? alignment;
  final bool transformHitTests;
  final FilterQuality? filterQuality;

  const _TransformRotateElement({
    this.key,
    required this.angle,
    this.origin,
    this.alignment = Alignment.center,
    this.transformHitTests = true,
    this.filterQuality,
  });

  @override
  Widget build(Widget child) {
    return Transform.rotate(
      key: key,
      angle: angle,
      origin: origin,
      alignment: alignment,
      transformHitTests: transformHitTests,
      filterQuality: filterQuality,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == Transform;

  @override
  ModifierProperties get props => [
    key,
    angle,
    origin,
    alignment,
    transformHitTests,
    filterQuality,
  ];
}

extension TransformRotateModifier<S> on Modifier<S> {
  /// Adds a [_TransformRotateElement] to this [Modifier].
  Modifier<S> transformRotate({
    Key? key,
    required double angle,
    Offset? origin,
    AlignmentGeometry? alignment = Alignment.center,
    bool transformHitTests = true,
    FilterQuality? filterQuality,
  }) {
    return then(
      _TransformRotateElement<S>(
        key: key,
        angle: angle,
        origin: origin,
        alignment: alignment,
        transformHitTests: transformHitTests,
        filterQuality: filterQuality,
      ),
    );
  }
}

/// Represents a [Transform.translate] in a modifier chain.
class _TransformTranslateElement<S> extends ModifierElement<S> {
  final Key? key;
  final Offset offset;
  final bool transformHitTests;
  final FilterQuality? filterQuality;

  const _TransformTranslateElement({
    this.key,
    required this.offset,
    this.transformHitTests = true,
    this.filterQuality,
  });

  @override
  Widget build(Widget child) {
    return Transform.translate(
      key: key,
      offset: offset,
      transformHitTests: transformHitTests,
      filterQuality: filterQuality,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == Transform;

  @override
  ModifierProperties get props => [
    key,
    offset,
    transformHitTests,
    filterQuality,
  ];
}

extension TransformTranslateModifier<S> on Modifier<S> {
  /// Adds a [_TransformTranslateElement] to this [Modifier].
  Modifier<S> transformTranslate({
    Key? key,
    required Offset offset,
    bool transformHitTests = true,
    FilterQuality? filterQuality,
  }) {
    return then(
      _TransformTranslateElement<S>(
        key: key,
        offset: offset,
        transformHitTests: transformHitTests,
        filterQuality: filterQuality,
      ),
    );
  }
}

/// Represents a [Transform.scale] in a modifier chain.
class _TransformScaleElement<S> extends ModifierElement<S> {
  final Key? key;
  final double? scale;
  final double? scaleX;
  final double? scaleY;
  final Offset? origin;
  final AlignmentGeometry? alignment;
  final bool transformHitTests;
  final FilterQuality? filterQuality;

  const _TransformScaleElement({
    this.key,
    this.scale,
    this.scaleX,
    this.scaleY,
    this.origin,
    this.alignment = Alignment.center,
    this.transformHitTests = true,
    this.filterQuality,
  });

  @override
  Widget build(Widget child) {
    return Transform.scale(
      key: key,
      scale: scale,
      scaleX: scaleX,
      scaleY: scaleY,
      origin: origin,
      alignment: alignment,
      transformHitTests: transformHitTests,
      filterQuality: filterQuality,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == Transform;

  @override
  ModifierProperties get props => [
    key,
    scale,
    scaleX,
    scaleY,
    origin,
    alignment,
    transformHitTests,
    filterQuality,
  ];
}

extension TransformScaleModifier<S> on Modifier<S> {
  /// Adds a [_TransformScaleElement] to this [Modifier].
  Modifier<S> transformScale({
    Key? key,
    double? scale,
    double? scaleX,
    double? scaleY,
    Offset? origin,
    AlignmentGeometry? alignment = Alignment.center,
    bool transformHitTests = true,
    FilterQuality? filterQuality,
  }) {
    return then(
      _TransformScaleElement<S>(
        key: key,
        scale: scale,
        scaleX: scaleX,
        scaleY: scaleY,
        origin: origin,
        alignment: alignment,
        transformHitTests: transformHitTests,
        filterQuality: filterQuality,
      ),
    );
  }
}

/// Represents a [Transform.flip] in a modifier chain.
class _TransformFlipElement<S> extends ModifierElement<S> {
  final Key? key;
  final bool flipX;
  final bool flipY;
  final Offset? origin;
  final bool transformHitTests;
  final FilterQuality? filterQuality;

  const _TransformFlipElement({
    this.key,
    this.flipX = false,
    this.flipY = false,
    this.origin,
    this.transformHitTests = true,
    this.filterQuality,
  });

  @override
  Widget build(Widget child) {
    return Transform.flip(
      key: key,
      flipX: flipX,
      flipY: flipY,
      origin: origin,
      transformHitTests: transformHitTests,
      filterQuality: filterQuality,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == Transform;

  @override
  ModifierProperties get props => [
    key,
    flipX,
    flipY,
    origin,
    transformHitTests,
    filterQuality,
  ];
}

extension TransformFlipModifier<S> on Modifier<S> {
  /// Adds a [_TransformFlipElement] to this [Modifier].
  Modifier<S> transformFlip({
    Key? key,
    bool flipX = false,
    bool flipY = false,
    Offset? origin,
    bool transformHitTests = true,
    FilterQuality? filterQuality,
  }) {
    return then(
      _TransformFlipElement<S>(
        key: key,
        flipX: flipX,
        flipY: flipY,
        origin: origin,
        transformHitTests: transformHitTests,
        filterQuality: filterQuality,
      ),
    );
  }
}
