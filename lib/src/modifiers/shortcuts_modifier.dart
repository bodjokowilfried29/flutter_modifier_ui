// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [Shortcuts] in a modifier chain.
class _ShortcutsElement<S> extends ModifierElement<S> {
  final Key? key;
  final Map<ShortcutActivator, Intent> shortcuts;
  final String? debugLabel;
  final bool includeSemantics;

  const _ShortcutsElement({
    this.key,
    required this.shortcuts,
    this.debugLabel,
    this.includeSemantics = true,
  });

  @override
  Widget build(Widget child) {
    return Shortcuts(
      key: key,
      shortcuts: shortcuts,
      debugLabel: debugLabel,
      includeSemantics: includeSemantics,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == Shortcuts;

  @override
  ModifierProperties get props => [
    key,
    shortcuts,
    debugLabel,
    includeSemantics,
  ];
}

extension ShortcutsModifier<S> on Modifier<S> {
  /// Adds a [_ShortcutsElement] to this [Modifier].
  Modifier<S> shortcuts({
    Key? key,
    required Map<ShortcutActivator, Intent> shortcuts,
    String? debugLabel,
    bool includeSemantics = true,
  }) {
    return then(
      _ShortcutsElement<S>(
        key: key,
        shortcuts: shortcuts,
        debugLabel: debugLabel,
        includeSemantics: includeSemantics,
      ),
    );
  }
}

/// Represents a [ShortcutManager] in a modifier chain.
class _ShortcutsManagerElement<S> extends ModifierElement<S> {
  final Key? key;
  final ShortcutManager manager;
  final String? debugLabel;
  final bool includeSemantics;

  _ShortcutsManagerElement({
    this.key,
    required this.manager,
    this.debugLabel,
    this.includeSemantics = true,
  });

  @override
  Widget build(Widget child) {
    return Shortcuts.manager(
      key: key,
      manager: manager,
      debugLabel: debugLabel,
      includeSemantics: includeSemantics,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == Shortcuts;

  @override
  ModifierProperties get props => [key, manager, debugLabel, includeSemantics];
}

extension ShortcutsManagerModifier<S> on Modifier<S> {
  /// Adds a [_ShortcutsManagerElement] to this [Modifier].
  Modifier<S> shortcutsManager({
    Key? key,
    required ShortcutManager manager,
    String? debugLabel,
    bool includeSemantics = true,
  }) {
    return then(
      _ShortcutsManagerElement<S>(
        key: key,
        manager: manager,
        debugLabel: debugLabel,
        includeSemantics: includeSemantics,
      ),
    );
  }
}
