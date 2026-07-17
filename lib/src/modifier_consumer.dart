// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import 'modifier_provider.dart';

/// A [StatelessWidget] acting as the terminal station of the layout pipeline.
///
/// Positioned at the absolute bottom of the compiled [Widget] structure compiled by
/// the catamorphism pass, the [ModifierConsumer] establishes a dependency link with
/// the parent [ModifierProvider].
///
/// Whenever the runtime layout content updates, this component intercepts the signal
/// and surgically reconstructs itself to render the freshly injected child. This allows
/// layout updates to happen with an $0(1)$ algorithmic complexity, avoiding any redraw
/// passes on the surrounding, cached style nodes.
class ModifierConsumer extends StatelessWidget {
  /// Creates a reactive consumer endpoint for the layout tree.
  const ModifierConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    // Returns the injected dynamic content.
    return ModifierProvider.of(context).injectedChild;
  }
}
