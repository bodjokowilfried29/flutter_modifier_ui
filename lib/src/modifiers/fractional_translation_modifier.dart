// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

class _FractionalTranslationElement<S> extends ModifierElement<S> {
  final Key? key;
  final Offset translation;
  final bool transformHitTests;

  const _FractionalTranslationElement({
    this.key,
    required this.translation,
    this.transformHitTests = true,
  });

  @override
  Widget build(Widget child) {
    return FractionalTranslation(
      key: key,
      translation: translation,
      transformHitTests: transformHitTests,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == FractionalTranslation;

  @override
  ModifierProperties get props => [key, translation, transformHitTests];
}

extension FractionalTranslationModifier<S> on Modifier<S> {
  Modifier<S> fractionalTranslation({
    Key? key,
    required Offset translation,
    bool transformHitTests = true,
  }) {
    return then(
      _FractionalTranslationElement<S>(
        key: key,
        translation: translation,
        transformHitTests: transformHitTests,
      ),
    );
  }
}
