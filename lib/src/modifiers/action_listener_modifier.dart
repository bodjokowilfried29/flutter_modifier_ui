// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents an [ActionListener] in a modifier chain.
class _ActionListenerElement<S> extends ModifierElement<S> {
  final Key? key;
  final void Function(Action<Intent>) listener;
  final Action<Intent> action;

  const _ActionListenerElement({
    this.key,
    required this.listener,
    required this.action,
  });

  @override
  Widget build(Widget child) {
    return ActionListener(
      key: key,
      listener: listener,
      action: action,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == ActionListener;

  @override
  ModifierProperties get props => [key, listener, action];
}

extension ActionListenerModifier<S> on Modifier<S> {
  /// Adds an [_ActionListenerElement] to this [Modifier].
  Modifier<S> actionListener({
    Key? key,
    required void Function(Action<Intent>) listener,
    required Action<Intent> action,
  }) {
    return then(
      _ActionListenerElement<S>(key: key, listener: listener, action: action),
    );
  }
}
