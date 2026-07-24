// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../modifier.dart';

/// Represents a [GestureDetector] in a modifier chain.
class _GestureDetectorElement<S> extends ModifierElement<S> {
  final Key? key;
  final void Function(TapDownDetails)? onTapDown;
  final void Function(TapUpDetails)? onTapUp;
  final void Function()? onTap;
  final void Function(TapMoveDetails)? onTapMove;
  final void Function()? onTapCancel;
  final void Function()? onSecondaryTap;
  final void Function(TapDownDetails)? onSecondaryTapDown;
  final void Function(TapUpDetails)? onSecondaryTapUp;
  final void Function()? onSecondaryTapCancel;
  final void Function(TapDownDetails)? onTertiaryTapDown;
  final void Function(TapUpDetails)? onTertiaryTapUp;
  final void Function()? onTertiaryTapCancel;
  final void Function(TapDownDetails)? onDoubleTapDown;
  final void Function()? onDoubleTap;
  final void Function()? onDoubleTapCancel;
  final void Function(LongPressDownDetails)? onLongPressDown;
  final void Function()? onLongPressCancel;
  final void Function()? onLongPress;
  final void Function(LongPressStartDetails)? onLongPressStart;
  final void Function(LongPressMoveUpdateDetails)? onLongPressMoveUpdate;
  final void Function()? onLongPressUp;
  final void Function(LongPressEndDetails)? onLongPressEnd;
  final void Function(LongPressDownDetails)? onSecondaryLongPressDown;
  final void Function()? onSecondaryLongPressCancel;
  final void Function()? onSecondaryLongPress;
  final void Function(LongPressStartDetails)? onSecondaryLongPressStart;
  final void Function(LongPressMoveUpdateDetails)?
  onSecondaryLongPressMoveUpdate;
  final void Function()? onSecondaryLongPressUp;
  final void Function(LongPressEndDetails)? onSecondaryLongPressEnd;
  final void Function(LongPressDownDetails)? onTertiaryLongPressDown;
  final void Function()? onTertiaryLongPressCancel;
  final void Function()? onTertiaryLongPress;
  final void Function(LongPressStartDetails)? onTertiaryLongPressStart;
  final void Function(LongPressMoveUpdateDetails)?
  onTertiaryLongPressMoveUpdate;
  final void Function()? onTertiaryLongPressUp;
  final void Function(LongPressEndDetails)? onTertiaryLongPressEnd;
  final void Function(DragDownDetails)? onVerticalDragDown;
  final void Function(DragStartDetails)? onVerticalDragStart;
  final void Function(DragUpdateDetails)? onVerticalDragUpdate;
  final void Function(DragEndDetails)? onVerticalDragEnd;
  final void Function()? onVerticalDragCancel;
  final void Function(DragDownDetails)? onHorizontalDragDown;
  final void Function(DragStartDetails)? onHorizontalDragStart;
  final void Function(DragUpdateDetails)? onHorizontalDragUpdate;
  final void Function(DragEndDetails)? onHorizontalDragEnd;
  final void Function()? onHorizontalDragCancel;
  final void Function(ForcePressDetails)? onForcePressStart;
  final void Function(ForcePressDetails)? onForcePressPeak;
  final void Function(ForcePressDetails)? onForcePressUpdate;
  final void Function(ForcePressDetails)? onForcePressEnd;
  final void Function(DragDownDetails)? onPanDown;
  final void Function(DragStartDetails)? onPanStart;
  final void Function(DragUpdateDetails)? onPanUpdate;
  final void Function(DragEndDetails)? onPanEnd;
  final void Function()? onPanCancel;
  final void Function(ScaleStartDetails)? onScaleStart;
  final void Function(ScaleUpdateDetails)? onScaleUpdate;
  final void Function(ScaleEndDetails)? onScaleEnd;
  final HitTestBehavior? behavior;
  final bool excludeFromSemantics;
  final DragStartBehavior dragStartBehavior;
  final bool trackpadScrollCausesScale;
  final Offset trackpadScrollToScaleFactor;
  final Set<PointerDeviceKind>? supportedDevices;

  const _GestureDetectorElement({
    this.key,
    this.onTapDown,
    this.onTapUp,
    this.onTap,
    this.onTapMove,
    this.onTapCancel,
    this.onSecondaryTap,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onTertiaryTapDown,
    this.onTertiaryTapUp,
    this.onTertiaryTapCancel,
    this.onDoubleTapDown,
    this.onDoubleTap,
    this.onDoubleTapCancel,
    this.onLongPressDown,
    this.onLongPressCancel,
    this.onLongPress,
    this.onLongPressStart,
    this.onLongPressMoveUpdate,
    this.onLongPressUp,
    this.onLongPressEnd,
    this.onSecondaryLongPressDown,
    this.onSecondaryLongPressCancel,
    this.onSecondaryLongPress,
    this.onSecondaryLongPressStart,
    this.onSecondaryLongPressMoveUpdate,
    this.onSecondaryLongPressUp,
    this.onSecondaryLongPressEnd,
    this.onTertiaryLongPressDown,
    this.onTertiaryLongPressCancel,
    this.onTertiaryLongPress,
    this.onTertiaryLongPressStart,
    this.onTertiaryLongPressMoveUpdate,
    this.onTertiaryLongPressUp,
    this.onTertiaryLongPressEnd,
    this.onVerticalDragDown,
    this.onVerticalDragStart,
    this.onVerticalDragUpdate,
    this.onVerticalDragEnd,
    this.onVerticalDragCancel,
    this.onHorizontalDragDown,
    this.onHorizontalDragStart,
    this.onHorizontalDragUpdate,
    this.onHorizontalDragEnd,
    this.onHorizontalDragCancel,
    this.onForcePressStart,
    this.onForcePressPeak,
    this.onForcePressUpdate,
    this.onForcePressEnd,
    this.onPanDown,
    this.onPanStart,
    this.onPanUpdate,
    this.onPanEnd,
    this.onPanCancel,
    this.onScaleStart,
    this.onScaleUpdate,
    this.onScaleEnd,
    this.behavior,
    this.excludeFromSemantics = false,
    this.dragStartBehavior = DragStartBehavior.start,
    this.trackpadScrollCausesScale = false,
    this.trackpadScrollToScaleFactor = kDefaultTrackpadScrollToScaleFactor,
    this.supportedDevices,
  });

  @override
  Widget build(Widget child) {
    return GestureDetector(
      key: key,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTap: onTap,
      onTapMove: onTapMove,
      onTapCancel: onTapCancel,
      onSecondaryTap: onSecondaryTap,
      onSecondaryTapDown: onSecondaryTapDown,
      onSecondaryTapUp: onSecondaryTapUp,
      onSecondaryTapCancel: onSecondaryTapCancel,
      onTertiaryTapDown: onTertiaryTapDown,
      onTertiaryTapUp: onTertiaryTapUp,
      onTertiaryTapCancel: onTertiaryTapCancel,
      onDoubleTapDown: onDoubleTapDown,
      onDoubleTap: onDoubleTap,
      onDoubleTapCancel: onDoubleTapCancel,
      onLongPressDown: onLongPressDown,
      onLongPressCancel: onLongPressCancel,
      onLongPress: onLongPress,
      onLongPressStart: onLongPressStart,
      onLongPressMoveUpdate: onLongPressMoveUpdate,
      onLongPressUp: onLongPressUp,
      onLongPressEnd: onLongPressEnd,
      onSecondaryLongPressDown: onSecondaryLongPressDown,
      onSecondaryLongPressCancel: onSecondaryLongPressCancel,
      onSecondaryLongPress: onSecondaryLongPress,
      onSecondaryLongPressStart: onSecondaryLongPressStart,
      onSecondaryLongPressMoveUpdate: onSecondaryLongPressMoveUpdate,
      onSecondaryLongPressUp: onSecondaryLongPressUp,
      onSecondaryLongPressEnd: onSecondaryLongPressEnd,
      onTertiaryLongPressDown: onTertiaryLongPressDown,
      onTertiaryLongPressCancel: onTertiaryLongPressCancel,
      onTertiaryLongPress: onTertiaryLongPress,
      onTertiaryLongPressStart: onTertiaryLongPressStart,
      onTertiaryLongPressMoveUpdate: onTertiaryLongPressMoveUpdate,
      onTertiaryLongPressUp: onTertiaryLongPressUp,
      onTertiaryLongPressEnd: onTertiaryLongPressEnd,
      onVerticalDragDown: onVerticalDragDown,
      onVerticalDragStart: onVerticalDragStart,
      onVerticalDragUpdate: onVerticalDragUpdate,
      onVerticalDragEnd: onVerticalDragEnd,
      onVerticalDragCancel: onVerticalDragCancel,
      onHorizontalDragDown: onHorizontalDragDown,
      onHorizontalDragStart: onHorizontalDragStart,
      onHorizontalDragUpdate: onHorizontalDragUpdate,
      onHorizontalDragEnd: onHorizontalDragEnd,
      onHorizontalDragCancel: onHorizontalDragCancel,
      onForcePressStart: onForcePressStart,
      onForcePressPeak: onForcePressPeak,
      onForcePressUpdate: onForcePressUpdate,
      onForcePressEnd: onForcePressEnd,
      onPanDown: onPanDown,
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      onPanCancel: onPanCancel,
      onScaleStart: onScaleStart,
      onScaleUpdate: onScaleUpdate,
      onScaleEnd: onScaleEnd,
      behavior: behavior,
      excludeFromSemantics: excludeFromSemantics,
      dragStartBehavior: dragStartBehavior,
      trackpadScrollCausesScale: trackpadScrollCausesScale,
      trackpadScrollToScaleFactor: trackpadScrollToScaleFactor,
      supportedDevices: supportedDevices,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == GestureDetector;

  @override
  ModifierProperties get props => [
    key,
    onTapDown,
    onTapUp,
    onTap,
    onTapMove,
    onTapCancel,
    onSecondaryTap,
    onSecondaryTapDown,
    onSecondaryTapUp,
    onSecondaryTapCancel,
    onTertiaryTapDown,
    onTertiaryTapUp,
    onTertiaryTapCancel,
    onDoubleTapDown,
    onDoubleTap,
    onDoubleTapCancel,
    onLongPressDown,
    onLongPressCancel,
    onLongPress,
    onLongPressStart,
    onLongPressMoveUpdate,
    onLongPressUp,
    onLongPressEnd,
    onSecondaryLongPressDown,
    onSecondaryLongPressCancel,
    onSecondaryLongPress,
    onSecondaryLongPressStart,
    onSecondaryLongPressMoveUpdate,
    onSecondaryLongPressUp,
    onSecondaryLongPressEnd,
    onTertiaryLongPressDown,
    onTertiaryLongPressCancel,
    onTertiaryLongPress,
    onTertiaryLongPressStart,
    onTertiaryLongPressMoveUpdate,
    onTertiaryLongPressUp,
    onTertiaryLongPressEnd,
    onVerticalDragDown,
    onVerticalDragStart,
    onVerticalDragUpdate,
    onVerticalDragEnd,
    onVerticalDragCancel,
    onHorizontalDragDown,
    onHorizontalDragStart,
    onHorizontalDragUpdate,
    onHorizontalDragEnd,
    onHorizontalDragCancel,
    onForcePressStart,
    onForcePressPeak,
    onForcePressUpdate,
    onForcePressEnd,
    onPanDown,
    onPanStart,
    onPanUpdate,
    onPanEnd,
    onPanCancel,
    onScaleStart,
    onScaleUpdate,
    onScaleEnd,
    behavior,
    excludeFromSemantics,
    dragStartBehavior,
    trackpadScrollCausesScale,
    trackpadScrollToScaleFactor,
    supportedDevices,
  ];
}

extension GestureDetectorModifier<S> on Modifier<S> {
  /// Adds a [_GestureDetectorElement] to this [Modifier].
  Modifier<S> gestureDetector({
    Key? key,
    void Function(TapDownDetails)? onTapDown,
    void Function(TapUpDetails)? onTapUp,
    void Function()? onTap,
    void Function(TapMoveDetails)? onTapMove,
    void Function()? onTapCancel,
    void Function()? onSecondaryTap,
    void Function(TapDownDetails)? onSecondaryTapDown,
    void Function(TapUpDetails)? onSecondaryTapUp,
    void Function()? onSecondaryTapCancel,
    void Function(TapDownDetails)? onTertiaryTapDown,
    void Function(TapUpDetails)? onTertiaryTapUp,
    void Function()? onTertiaryTapCancel,
    void Function(TapDownDetails)? onDoubleTapDown,
    void Function()? onDoubleTap,
    void Function()? onDoubleTapCancel,
    void Function(LongPressDownDetails)? onLongPressDown,
    void Function()? onLongPressCancel,
    void Function()? onLongPress,
    void Function(LongPressStartDetails)? onLongPressStart,
    void Function(LongPressMoveUpdateDetails)? onLongPressMoveUpdate,
    void Function()? onLongPressUp,
    void Function(LongPressEndDetails)? onLongPressEnd,
    void Function(LongPressDownDetails)? onSecondaryLongPressDown,
    void Function()? onSecondaryLongPressCancel,
    void Function()? onSecondaryLongPress,
    void Function(LongPressStartDetails)? onSecondaryLongPressStart,
    void Function(LongPressMoveUpdateDetails)? onSecondaryLongPressMoveUpdate,
    void Function()? onSecondaryLongPressUp,
    void Function(LongPressEndDetails)? onSecondaryLongPressEnd,
    void Function(LongPressDownDetails)? onTertiaryLongPressDown,
    void Function()? onTertiaryLongPressCancel,
    void Function()? onTertiaryLongPress,
    void Function(LongPressStartDetails)? onTertiaryLongPressStart,
    void Function(LongPressMoveUpdateDetails)? onTertiaryLongPressMoveUpdate,
    void Function()? onTertiaryLongPressUp,
    void Function(LongPressEndDetails)? onTertiaryLongPressEnd,
    void Function(DragDownDetails)? onVerticalDragDown,
    void Function(DragStartDetails)? onVerticalDragStart,
    void Function(DragUpdateDetails)? onVerticalDragUpdate,
    void Function(DragEndDetails)? onVerticalDragEnd,
    void Function()? onVerticalDragCancel,
    void Function(DragDownDetails)? onHorizontalDragDown,
    void Function(DragStartDetails)? onHorizontalDragStart,
    void Function(DragUpdateDetails)? onHorizontalDragUpdate,
    void Function(DragEndDetails)? onHorizontalDragEnd,
    void Function()? onHorizontalDragCancel,
    void Function(ForcePressDetails)? onForcePressStart,
    void Function(ForcePressDetails)? onForcePressPeak,
    void Function(ForcePressDetails)? onForcePressUpdate,
    void Function(ForcePressDetails)? onForcePressEnd,
    void Function(DragDownDetails)? onPanDown,
    void Function(DragStartDetails)? onPanStart,
    void Function(DragUpdateDetails)? onPanUpdate,
    void Function(DragEndDetails)? onPanEnd,
    void Function()? onPanCancel,
    void Function(ScaleStartDetails)? onScaleStart,
    void Function(ScaleUpdateDetails)? onScaleUpdate,
    void Function(ScaleEndDetails)? onScaleEnd,
    HitTestBehavior? behavior,
    bool excludeFromSemantics = false,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    bool trackpadScrollCausesScale = false,
    Offset trackpadScrollToScaleFactor = kDefaultTrackpadScrollToScaleFactor,
    Set<PointerDeviceKind>? supportedDevices,
  }) {
    return then(
      _GestureDetectorElement<S>(
        key: key,
        onTapDown: onTapDown,
        onTapUp: onTapUp,
        onTap: onTap,
        onTapMove: onTapMove,
        onTapCancel: onTapCancel,
        onSecondaryTap: onSecondaryTap,
        onSecondaryTapDown: onSecondaryTapDown,
        onSecondaryTapUp: onSecondaryTapUp,
        onSecondaryTapCancel: onSecondaryTapCancel,
        onTertiaryTapDown: onTertiaryTapDown,
        onTertiaryTapUp: onTertiaryTapUp,
        onTertiaryTapCancel: onTertiaryTapCancel,
        onDoubleTapDown: onDoubleTapDown,
        onDoubleTap: onDoubleTap,
        onDoubleTapCancel: onDoubleTapCancel,
        onLongPressDown: onLongPressDown,
        onLongPressCancel: onLongPressCancel,
        onLongPress: onLongPress,
        onLongPressStart: onLongPressStart,
        onLongPressMoveUpdate: onLongPressMoveUpdate,
        onLongPressUp: onLongPressUp,
        onLongPressEnd: onLongPressEnd,
        onSecondaryLongPressDown: onSecondaryLongPressDown,
        onSecondaryLongPressCancel: onSecondaryLongPressCancel,
        onSecondaryLongPress: onSecondaryLongPress,
        onSecondaryLongPressStart: onSecondaryLongPressStart,
        onSecondaryLongPressMoveUpdate: onSecondaryLongPressMoveUpdate,
        onSecondaryLongPressUp: onSecondaryLongPressUp,
        onSecondaryLongPressEnd: onSecondaryLongPressEnd,
        onTertiaryLongPressDown: onTertiaryLongPressDown,
        onTertiaryLongPressCancel: onTertiaryLongPressCancel,
        onTertiaryLongPress: onTertiaryLongPress,
        onTertiaryLongPressStart: onTertiaryLongPressStart,
        onTertiaryLongPressMoveUpdate: onTertiaryLongPressMoveUpdate,
        onTertiaryLongPressUp: onTertiaryLongPressUp,
        onTertiaryLongPressEnd: onTertiaryLongPressEnd,
        onVerticalDragDown: onVerticalDragDown,
        onVerticalDragStart: onVerticalDragStart,
        onVerticalDragUpdate: onVerticalDragUpdate,
        onVerticalDragEnd: onVerticalDragEnd,
        onVerticalDragCancel: onVerticalDragCancel,
        onHorizontalDragDown: onHorizontalDragDown,
        onHorizontalDragStart: onHorizontalDragStart,
        onHorizontalDragUpdate: onHorizontalDragUpdate,
        onHorizontalDragEnd: onHorizontalDragEnd,
        onHorizontalDragCancel: onHorizontalDragCancel,
        onForcePressStart: onForcePressStart,
        onForcePressPeak: onForcePressPeak,
        onForcePressUpdate: onForcePressUpdate,
        onForcePressEnd: onForcePressEnd,
        onPanDown: onPanDown,
        onPanStart: onPanStart,
        onPanUpdate: onPanUpdate,
        onPanEnd: onPanEnd,
        onPanCancel: onPanCancel,
        onScaleStart: onScaleStart,
        onScaleUpdate: onScaleUpdate,
        onScaleEnd: onScaleEnd,
        behavior: behavior,
        excludeFromSemantics: excludeFromSemantics,
        dragStartBehavior: dragStartBehavior,
        trackpadScrollCausesScale: trackpadScrollCausesScale,
        trackpadScrollToScaleFactor: trackpadScrollToScaleFactor,
        supportedDevices: supportedDevices,
      ),
    );
  }
}
