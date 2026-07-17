// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'modifier.dart';
import 'modifier_consumer.dart';
import 'modifier_provider.dart';

/// An orchestrator node that intercepts structural changes and manages
/// layout pipeline performance caching.
///
/// The [ModifierNode] acts as a bridge between the functional algebraic world
/// of [Modifier] chains and Flutter's dynamic [StatefulWidget] lifecycle.
///
/// It isolates layout configuration from runtime data updates using a dual-layer
/// mechanism:
/// 1. **The Toll-Gate (Structural Cache):** The computationally expensive `O(N)`
///    [Modifier.foldIn] catamorphism is strictly cached. It only re-evaluates
///    if the layout structure or properties actually change.
/// 2. **The Tunnel (Data Injection):** Runtime content updates (like [child] changes)
///    bypass the frozen layout structure completely, updating instantly via an underlying
///    [ModifierProvider] pipeline.
///
/// The phantom type parameter [S] preserve the compile-time structural scope checks
/// propagated from the parent [Modifier].
class ModifierNode<S> extends StatefulWidget {
  /// Creates an orchestrator node bound to a specify layout configuration.
  const ModifierNode({super.key, required this.modifier, required this.child});

  /// The algebraic layout configuration tree containing layout and decorative definitions.
  final Modifier<S> modifier;

  /// The reactive, dynamic child content wrapped inside this modifier sequence.
  final Widget child;

  @override
  State<ModifierNode<S>> createState() => _ModifierNodeState<S>();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Modifier<S>>('modifier', modifier));
    properties.add(DiagnosticsProperty<Widget>('child', child));
  }
}

/// The concrete state lifecycle manager for [ModifierNode].
///
/// This state captures and locks the flattened [Widget] hierarchy in memory,
/// performing reference-stabilization to trick Flutter's element tree into skipping
/// redundant layout rebuild passes.
class _ModifierNodeState<S> extends State<ModifierNode<S>> {
  /// Cached reference to the flattened, deeply nested widget tree output.
  late Widget _tree;

  @override
  void initState() {
    super.initState();
    // Compiles and flattens the algebraic layout tree for the first time.
    _buildTree();
  }

  @override
  void didUpdateWidget(ModifierNode<S> oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If the modifier is identical, this block is completely skipped.
    if (oldWidget.modifier != widget.modifier) {
      _buildTree();
    }
  }

  void _buildTree() {
    _tree = widget.modifier.foldIn<Widget>(
      const ModifierConsumer(),
      (Widget acc, ModifierElement<S> element) => element.build(acc),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<Modifier<S>>('modifier', widget.modifier),
    );
    properties.add(DiagnosticsProperty<Widget>('tree', _tree));
  }

  @override
  Widget build(BuildContext context) {
    // Injects the fresh dynamic content via the provider.
    return ModifierProvider(injectedChild: widget.child, child: _tree);
  }
}
