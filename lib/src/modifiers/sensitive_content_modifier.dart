// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../modifier.dart';

class _SensitiveContentElement<S> extends ModifierElement<S> {
  final Key? key;
  final ContentSensitivity sensitivity;

  const _SensitiveContentElement({this.key, required this.sensitivity});

  @override
  Widget build(Widget child) {
    return SensitiveContent(key: key, sensitivity: sensitivity, child: child);
  }

  @override
  bool byWidgetType(Type type) => type == SensitiveContent;

  @override
  ModifierProperties get props => [key, sensitivity];
}

extension SensitiveContentModifier<S> on Modifier<S> {
  Modifier<S> sensitiveContent({
    Key? key,
    required ContentSensitivity sensitivity,
  }) {
    return then(
      _SensitiveContentElement<S>(key: key, sensitivity: sensitivity),
    );
  }
}
