// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

class _ShaderMaskElement<S> extends ModifierElement<S> {
  final Key? key;
  final Shader Function(Rect) shaderCallback;
  final BlendMode blendMode;

  const _ShaderMaskElement({
    this.key,
    required this.shaderCallback,
    this.blendMode = BlendMode.modulate,
  });

  @override
  Widget build(Widget child) {
    return ShaderMask(
      key: key,
      shaderCallback: shaderCallback,
      blendMode: blendMode,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == ShaderMask;

  @override
  ModifierProperties get props => [key, shaderCallback, blendMode];
}

extension ShaderMaskModifier<S> on Modifier<S> {
  Modifier<S> shaderMask({
    Key? key,
    required Shader Function(Rect) shaderCallback,
    BlendMode blendMode = BlendMode.modulate,
  }) {
    return then(
      _ShaderMaskElement<S>(
        key: key,
        shaderCallback: shaderCallback,
        blendMode: blendMode,
      ),
    );
  }
}
