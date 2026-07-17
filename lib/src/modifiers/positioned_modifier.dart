// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

class _PositionedElement<S extends StackScope> extends ModifierElement<S> {
  final Key? key;
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;
  final double? width;
  final double? height;

  const _PositionedElement({
    this.key,
    this.left,
    this.top,
    this.right,
    this.bottom,
    this.width,
    this.height,
  });

  @override
  Widget build(Widget child) {
    return Positioned(
      key: key,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      width: width,
      height: height,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == Positioned;

  @override
  ModifierProperties get props => [
    key,
    left,
    top,
    right,
    bottom,
    width,
    height,
  ];
}

extension PositionedModifier<S extends StackScope> on Modifier<S> {
  Modifier<S> positioned({
    Key? key,
    double? left,
    double? top,
    double? right,
    double? bottom,
    double? width,
    double? height,
  }) {
    return then(
      _PositionedElement<S>(
        key: key,
        left: left,
        top: top,
        right: right,
        bottom: bottom,
        width: width,
        height: height,
      ),
    );
  }
}

class _PositionedFromRectElement<S extends StackScope>
    extends ModifierElement<S> {
  final Key? key;
  final Rect rect;

  const _PositionedFromRectElement({this.key, required this.rect});

  @override
  Widget build(Widget child) {
    return Positioned.fromRect(key: key, rect: rect, child: child);
  }

  @override
  bool byWidgetType(Type type) => type == Positioned;

  @override
  ModifierProperties get props => [key, rect];
}

extension PositionedFromRectModifier<S extends StackScope> on Modifier<S> {
  Modifier<S> positionedFromRect({Key? key, required Rect rect}) {
    return then(_PositionedFromRectElement<S>(key: key, rect: rect));
  }
}

class _PositionedFromRelativeRectElement<S extends StackScope>
    extends ModifierElement<S> {
  final Key? key;
  final RelativeRect rect;

  const _PositionedFromRelativeRectElement({this.key, required this.rect});

  @override
  Widget build(Widget child) {
    return Positioned.fromRelativeRect(key: key, rect: rect, child: child);
  }

  @override
  bool byWidgetType(Type type) => type == Positioned;

  @override
  ModifierProperties get props => [key, rect];
}

extension PositionedFromRelativeRectModifier<S extends StackScope>
    on Modifier<S> {
  Modifier<S> positionedFromRelativeRect({
    Key? key,
    required RelativeRect rect,
  }) {
    return then(_PositionedFromRelativeRectElement<S>(key: key, rect: rect));
  }
}

class _PositionedFillElement<S extends StackScope> extends ModifierElement<S> {
  final Key? key;
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;

  const _PositionedFillElement({
    this.key,
    this.left = 0.0,
    this.top = 0.0,
    this.right = 0.0,
    this.bottom = 0.0,
  });

  @override
  Widget build(Widget child) {
    return Positioned.fill(
      key: key,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == Positioned;

  @override
  ModifierProperties get props => [key, left, top, right, bottom];
}

extension PositionedFillModifier<S extends StackScope> on Modifier<S> {
  Modifier<S> positionedFill({
    Key? key,
    double? left = 0.0,
    double? top = 0.0,
    double? right = 0.0,
    double? bottom = 0.0,
  }) {
    return then(
      _PositionedFillElement<S>(
        key: key,
        left: left,
        top: top,
        right: right,
        bottom: bottom,
      ),
    );
  }
}

class _PositionedDirectionalElement<S extends StackScope>
    extends ModifierElement<S> {
  final Key? key;
  final TextDirection textDirection;
  final double? start;
  final double? top;
  final double? end;
  final double? bottom;
  final double? width;
  final double? height;

  const _PositionedDirectionalElement({
    this.key,
    required this.textDirection,
    this.start,
    this.top,
    this.end,
    this.bottom,
    this.width,
    this.height,
  });

  @override
  Widget build(Widget child) {
    return Positioned.directional(
      key: key,
      textDirection: textDirection,
      start: start,
      top: top,
      end: end,
      bottom: bottom,
      width: width,
      height: height,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == Positioned;

  @override
  ModifierProperties get props => [
    key,
    textDirection,
    start,
    top,
    end,
    bottom,
    width,
    height,
  ];
}

extension PositionedDirectionalModifier<S extends StackScope> on Modifier<S> {
  Modifier<S> positionedDirectional({
    Key? key,
    required TextDirection textDirection,
    double? start,
    double? top,
    double? end,
    double? bottom,
    double? width,
    double? height,
  }) {
    return then(
      _PositionedDirectionalElement<S>(
        key: key,
        textDirection: textDirection,
        start: start,
        top: top,
        end: end,
        bottom: bottom,
        width: width,
        height: height,
      ),
    );
  }
}
