// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

class _SizedBoxElement<S> extends ModifierElement<S> {
  final Key? key;
  final double? width;
  final double? height;

  const _SizedBoxElement({this.key, this.width, this.height});

  @override
  Widget build(Widget child) {
    return SizedBox(key: key, width: width, height: height, child: child);
  }

  @override
  bool byWidgetType(Type type) => type == SizedBox;

  @override
  ModifierProperties get props => [key, width, height];
}

extension SizedBoxModifier<S> on Modifier<S> {
  Modifier<S> sizedBox({Key? key, double? width, double? height}) {
    return then(_SizedBoxElement<S>(key: key, width: width, height: height));
  }
}

class _SizedBoxExpandElement<S> extends ModifierElement<S> {
  final Key? key;

  const _SizedBoxExpandElement({this.key});

  @override
  Widget build(Widget child) {
    return SizedBox.expand(key: key, child: child);
  }

  @override
  bool byWidgetType(Type type) => type == SizedBox;

  @override
  ModifierProperties get props => [key];
}

extension SizedBoxExpandModifier<S> on Modifier<S> {
  Modifier<S> sizedBoxExpand({Key? key}) {
    return then(_SizedBoxExpandElement<S>(key: key));
  }
}

class _SizedBoxShrinkElement<S> extends ModifierElement<S> {
  final Key? key;

  const _SizedBoxShrinkElement({this.key});

  @override
  Widget build(Widget child) {
    return SizedBox.shrink(key: key, child: child);
  }

  @override
  bool byWidgetType(Type type) => type == SizedBox;

  @override
  ModifierProperties get props => [key];
}

extension SizedBoxShrinkModifier<S> on Modifier<S> {
  Modifier<S> sizedBoxShrink({Key? key}) {
    return then(_SizedBoxShrinkElement<S>(key: key));
  }
}

class _SizedBoxFromSizeElement<S> extends ModifierElement<S> {
  final Key? key;
  final Size? size;

  const _SizedBoxFromSizeElement({this.key, this.size});

  @override
  Widget build(Widget child) {
    return SizedBox.fromSize(key: key, size: size, child: child);
  }

  @override
  bool byWidgetType(Type type) => type == SizedBox;

  @override
  ModifierProperties get props => [key, size];
}

extension SizedBoxFromSizeModifier<S> on Modifier<S> {
  Modifier<S> sizedBoxFromSize({Key? key, Size? size}) {
    return then(_SizedBoxFromSizeElement<S>(key: key, size: size));
  }
}

class _SizedBoxSquareElement<S> extends ModifierElement<S> {
  final Key? key;
  final double? dimension;

  const _SizedBoxSquareElement({this.key, this.dimension});

  @override
  Widget build(Widget child) {
    return SizedBox.square(key: key, dimension: dimension, child: child);
  }

  @override
  bool byWidgetType(Type type) => type == SizedBox;

  @override
  ModifierProperties get props => [key, dimension];
}

extension SizedBoxSquareModifier<S> on Modifier<S> {
  Modifier<S> sizedBoxSquare({Key? key, double? dimension}) {
    return then(_SizedBoxSquareElement<S>(key: key, dimension: dimension));
  }
}
