// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [KeyboardListener] in a modifier chain.
class _KeyboardListenerElement<S> extends ModifierElement<S> {
  final Key? key;
  final FocusNode focusNode;
  final bool autofocus;
  final bool includeSemantics;
  final void Function(KeyEvent)? onKeyEvent;

  const _KeyboardListenerElement({
    this.key,
    required this.focusNode,
    this.autofocus = false,
    this.includeSemantics = true,
    this.onKeyEvent,
  });

  @override
  Widget build(Widget child) {
    return KeyboardListener(
      key: key,
      focusNode: focusNode,
      autofocus: autofocus,
      includeSemantics: includeSemantics,
      onKeyEvent: onKeyEvent,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == KeyboardListener;

  @override
  ModifierProperties get props => [
    key,
    focusNode,
    autofocus,
    includeSemantics,
    onKeyEvent,
  ];
}

extension KeyboardListenerModifier<S> on Modifier<S> {
  /// Adds a [_KeyboardListenerElement] to this [Modifier].
  Modifier<S> keyboardListener({
    Key? key,
    required FocusNode focusNode,
    bool autofocus = false,
    bool includeSemantics = true,
    void Function(KeyEvent)? onKeyEvent,
  }) {
    return then(
      _KeyboardListenerElement<S>(
        key: key,
        focusNode: focusNode,
        autofocus: autofocus,
        includeSemantics: includeSemantics,
        onKeyEvent: onKeyEvent,
      ),
    );
  }
}
