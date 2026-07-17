// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../modifier.dart';

class _SnapshotWidgetElement<S> extends ModifierElement<S> {
  final Key? key;
  final SnapshotMode mode;
  final SnapshotPainter painter;
  final bool autoresize;
  final SnapshotController controller;

  const _SnapshotWidgetElement({
    this.key,
    this.mode = SnapshotMode.normal,
    this.painter = const _DefaultSnapshotPainter(),
    this.autoresize = false,
    required this.controller,
  });

  @override
  Widget build(Widget child) {
    return SnapshotWidget(
      key: key,
      mode: mode,
      painter: painter,
      autoresize: autoresize,
      controller: controller,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == SnapshotWidget;

  @override
  ModifierProperties get props => [key, mode, painter, autoresize, controller];
}

extension SnapshotWidgetModifier<S> on Modifier<S> {
  Modifier<S> snapshotWidget({
    Key? key,
    SnapshotMode mode = SnapshotMode.normal,
    SnapshotPainter painter = const _DefaultSnapshotPainter(),
    bool autoresize = false,
    required SnapshotController controller,
  }) {
    return then(
      _SnapshotWidgetElement<S>(
        key: key,
        mode: mode,
        painter: painter,
        autoresize: autoresize,
        controller: controller,
      ),
    );
  }
}

class _DefaultSnapshotPainter implements SnapshotPainter {
  const _DefaultSnapshotPainter();

  @override
  void addListener(ui.VoidCallback listener) {}

  @override
  void dispose() {}

  @override
  bool get hasListeners => false;

  @override
  void notifyListeners() {}

  @override
  void paint(
    PaintingContext context,
    ui.Offset offset,
    ui.Size size,
    PaintingContextCallback painter,
  ) {
    painter(context, offset);
  }

  @override
  void paintSnapshot(
    PaintingContext context,
    ui.Offset offset,
    ui.Size size,
    ui.Image image,
    Size sourceSize,
    double pixelRatio,
  ) {
    final src = Rect.fromLTWH(0, 0, sourceSize.width, sourceSize.height);
    final dst = Rect.fromLTWH(offset.dx, offset.dy, size.width, size.height);
    final paint = Paint()..filterQuality = FilterQuality.medium;
    context.canvas.drawImageRect(image, src, dst, paint);
  }

  @override
  void removeListener(ui.VoidCallback listener) {}

  @override
  bool shouldRepaint(covariant _DefaultSnapshotPainter oldPainter) => false;
}
