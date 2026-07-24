// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [TableCell] in a modifier chain.
class _TableCellElement<S extends TableRowScope> extends ModifierElement<S> {
  final Key? key;
  final TableCellVerticalAlignment? verticalAlignment;

  const _TableCellElement({this.key, this.verticalAlignment});

  @override
  Widget build(Widget child) {
    return TableCell(
      key: key,
      verticalAlignment: verticalAlignment,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == TableCell;

  @override
  ModifierProperties get props => [key, verticalAlignment];
}

extension TableCellModifier<S extends TableRowScope> on Modifier<S> {
  /// Adds a [_TableCellElement] to this [Modifier].
  Modifier<S> tableCell({
    Key? key,
    TableCellVerticalAlignment? verticalAlignment,
  }) {
    return then(
      _TableCellElement<S>(key: key, verticalAlignment: verticalAlignment),
    );
  }
}
