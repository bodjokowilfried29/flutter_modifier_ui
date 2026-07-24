// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [Center] in a modifier chain.
class _CenterElement<S> extends ModifierElement<S> {
  final Key? key;
  final double? widthFactor;
  final double? heightFactor;

  const _CenterElement({this.key, this.widthFactor, this.heightFactor});

  @override
  Widget build(Widget child) {
    return Center(
      key: key,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == Center;

  @override
  ModifierProperties get props => [key, widthFactor, heightFactor];
}

extension CenterModifier<S> on Modifier<S> {
  /// Adds a [_CenterElement] to this [Modifier].
  Modifier<S> center({Key? key, double? widthFactor, double? heightFactor}) {
    return then(
      _CenterElement<S>(
        key: key,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
      ),
    );
  }
}
