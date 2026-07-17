// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

class _ViewAnchorElement<S> extends ModifierElement<S> {
  final Key? key;
  final Widget? view;

  const _ViewAnchorElement({this.key, this.view});

  @override
  Widget build(Widget child) {
    return ViewAnchor(key: key, view: view, child: child);
  }

  @override
  bool byWidgetType(Type type) => type == ViewAnchor;

  @override
  ModifierProperties get props => [key, view];
}

extension ViewAnchorModifier<S> on Modifier<S> {
  Modifier<S> viewAnchor({Key? key, Widget? view}) {
    return then(_ViewAnchorElement<S>(key: key, view: view));
  }
}
