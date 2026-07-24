// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [Focus] in a modifier chain.
class _FocusElement<S> extends ModifierElement<S> {
  final Key? key;
  final FocusNode? focusNode;
  final FocusNode? parentNode;
  final bool autofocus;
  final void Function(bool)? onFocusChange;
  final KeyEventResult Function(FocusNode, KeyEvent)? onKeyEvent;
  final KeyEventResult Function(FocusNode, RawKeyEvent)? onKey;
  final bool? canRequestFocus;
  final bool? skipTraversal;
  final bool? descendantsAreFocusable;
  final bool? descendantsAreTraversable;
  final bool includeSemantics;
  final String? debugLabel;

  const _FocusElement({
    this.key,
    this.focusNode,
    this.parentNode,
    this.autofocus = false,
    this.onFocusChange,
    this.onKeyEvent,
    this.onKey,
    this.canRequestFocus,
    this.skipTraversal,
    this.descendantsAreFocusable,
    this.descendantsAreTraversable,
    this.includeSemantics = true,
    this.debugLabel,
  });

  @override
  Widget build(Widget child) {
    return Focus(
      key: key,
      focusNode: focusNode,
      parentNode: parentNode,
      autofocus: autofocus,
      onFocusChange: onFocusChange,
      onKeyEvent: onKeyEvent,
      onKey: onKey,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      descendantsAreFocusable: descendantsAreFocusable,
      descendantsAreTraversable: descendantsAreTraversable,
      includeSemantics: includeSemantics,
      debugLabel: debugLabel,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == Focus;

  @override
  ModifierProperties get props => [
    key,
    focusNode,
    parentNode,
    autofocus,
    onFocusChange,
    onKeyEvent,
    onKey,
    canRequestFocus,
    skipTraversal,
    descendantsAreFocusable,
    descendantsAreTraversable,
    includeSemantics,
    debugLabel,
  ];
}

extension FocusModifier<S> on Modifier<S> {
  /// Adds a [_FocusElement] to this [Modifier].
  Modifier<S> focus({
    Key? key,
    FocusNode? focusNode,
    FocusNode? parentNode,
    bool autofocus = false,
    void Function(bool)? onFocusChange,
    KeyEventResult Function(FocusNode, KeyEvent)? onKeyEvent,
    KeyEventResult Function(FocusNode, RawKeyEvent)? onKey,
    bool? canRequestFocus,
    bool? skipTraversal,
    bool? descendantsAreFocusable,
    bool? descendantsAreTraversable,
    bool includeSemantics = true,
    String? debugLabel,
  }) {
    return then(
      _FocusElement<S>(
        key: key,
        focusNode: focusNode,
        parentNode: parentNode,
        autofocus: autofocus,
        onFocusChange: onFocusChange,
        onKeyEvent: onKeyEvent,
        onKey: onKey,
        canRequestFocus: canRequestFocus,
        skipTraversal: skipTraversal,
        descendantsAreFocusable: descendantsAreFocusable,
        descendantsAreTraversable: descendantsAreTraversable,
        includeSemantics: includeSemantics,
        debugLabel: debugLabel,
      ),
    );
  }
}

/// Represents a [Focus.withExternalFocusNode] in a modifier chain.
class _FocusWithExternalFocusNodeElement<S> extends ModifierElement<S> {
  final Key? key;
  final FocusNode focusNode;
  final FocusNode? parentNode;
  final bool autofocus;
  final void Function(bool)? onFocusChange;
  final bool includeSemantics;

  const _FocusWithExternalFocusNodeElement({
    this.key,
    required this.focusNode,
    this.parentNode,
    this.autofocus = true,
    this.onFocusChange,
    this.includeSemantics = true,
  });

  @override
  Widget build(Widget child) {
    return Focus.withExternalFocusNode(
      key: key,
      focusNode: focusNode,
      parentNode: parentNode,
      autofocus: autofocus,
      onFocusChange: onFocusChange,
      includeSemantics: includeSemantics,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == Focus;

  @override
  ModifierProperties get props => [
    key,
    focusNode,
    parentNode,
    autofocus,
    onFocusChange,
    includeSemantics,
  ];
}

extension FocusWithExternalFocusNodeModifier<S> on Modifier<S> {
  /// Adds a [_FocusWithExternalFocusNodeElement] to this [Modifier].
  Modifier<S> focusWithExternalFocusNode({
    Key? key,
    required FocusNode focusNode,
    FocusNode? parentNode,
    bool autofocus = true,
    void Function(bool)? onFocusChange,
    bool includeSemantics = true,
  }) {
    return then(
      _FocusWithExternalFocusNodeElement<S>(
        key: key,
        focusNode: focusNode,
        parentNode: parentNode,
        autofocus: autofocus,
        onFocusChange: onFocusChange,
        includeSemantics: includeSemantics,
      ),
    );
  }
}
