// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

// Portions of this code are derived from Jetpack Compose (Modifier.kt).
// Copyright 2019 The Android Open Source Project
// Licensed under the Apache License, Version 2.0.
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

import '../src/utils/dart_equality_utils.dart';
import 'modifier_node.dart';

/// Scope that enables extensions for [Flex].
///
/// > **Use** `const Modifier<FlexScope>()` **ONLY** inside a parent:
/// >
/// > `Flex`, `Column`, `Row`
///
/// ```dart
/// Row(
///   children: [
///     Text("Hello Flutter")(
///       modifier: const Modifier<FlexScope>()
///           .padding(padding: EdgeInsets.all(8.0))
///           .coloredBox(color: Colors.blue)
///           .expanded(flex: 2),
///     ),
///   ],
/// )
/// ```
abstract class FlexScope {}

/// Scope that enables extensions for [Stack].
///
/// > **Use** `const Modifier<StackScope>()` **ONLY** inside a parent:
/// >
/// > `Stack`
///
/// ```dart
/// Stack(
///   children: [
///     Text("Hello Flutter")(
///       modifier: const Modifier<StackScope>()
///           .padding(padding: EdgeInsets.all(8.0))
///           .coloredBox(color: Colors.blue)
///           .positioned(top: 8.0, left: 8.0),
///     ),
///   ],
/// )
/// ```
abstract class StackScope {}

/// Scope that enables extensions for scrollable slivers.
///
/// > **Use** `const Modifier<SliverScope>()` **ONLY** inside a parent:
/// >
/// > `CustomScrollView`, `NestedScrollView`, `ShrinkWrappingViewport`,
/// > `Viewport`
///
/// ```dart
/// CustomScrollView(
///   slivers: [
///     Text("Hello Flutter")(
///       modifier: const Modifier<SliverScope>()
///           .padding(padding: EdgeInsets.all(8.0))
///           .coloredBox(color: Colors.blue)
///           .sliverToBoxAdapter()
///           .sliverPadding(padding: EdgeInsets.all(8.0)),
///     ),
///   ],
/// )
/// ```
abstract class SliverScope {}

/// Scope that enables extensions for [TableRow].
///
/// > **Use** `const Modifier<TableRowScope>()` **ONLY** inside a parent:
/// >
/// > `TableRow`
///
/// ```dart
/// Table(
///   children: [
///     TableRow(
///       children: [
///         Text("Hello Flutter")(
///           modifier: const Modifier<TableRowScope>()
///               .padding(padding: EdgeInsets.all(8.0))
///               .coloredBox(color: Colors.blue)
///               .tableCell(
///                 verticalAlignment: TableCellVerticalAlignment.middle,
///               ),
///         ),
///       ],
///     ),
///   ],
/// )
/// ```
abstract class TableRowScope {}

/// Scope that enables extensions for [CustomMultiChildLayout].
///
/// > **Use** `const Modifier<MultiChildLayoutScope>()` **ONLY** inside a parent:
/// >
/// > `CustomMultiChildLayout`
///
/// ```dart
/// CustomMultiChildLayout(
///   delegate: MyLayoutDelegate(),
///   children: [
///     Text("Hello Flutter")(
///       modifier: const Modifier<MultiChildLayoutScope>()
///           .padding(padding: EdgeInsets.all(8.0))
///           .coloredBox(color: Colors.blue)
///           .layoutId(id: 'id'),
///     ),
///   ],
/// )
/// ```
abstract class MultiChildLayoutScope {}

/// A function signature for the accumulator callback used by [Modifier.foldIn].
///
/// * [acc]: The current accumulated value of type [R].
/// * [element]: The current atomic [ModifierElement] being processed.
typedef ModifierOperation<R, S> = R Function(R acc, ModifierElement<S> element);

/// Represents a property of a [ModifierElement] used exclusively for testing.
///
/// This alias allows developers to inspect the parameters of a modifier in unit tests
typedef ModifierProperties = List<Object?>;

/// The root interface of the algebraic modifier composition system.
///
/// The generic parameter [S] acts strictly as a "Phantom Type". It is never
/// instantiated at runtime, but serves as a compile-time guard to enforce
/// strict layout scope rules.
///
/// ```dart
/// final modifier = const Modifier().padding(padding: EdgeInsets.all(8.0));
/// ```
@immutable
abstract interface class Modifier<S> {
  /// Creates a neutral identity modifier.
  ///
  /// This redirecting factory ensures that initializing a base `Modifier<S>()`
  /// incurs zero memory allocation overhead.
  @literal
  const factory Modifier() = UnModifier<S>;

  /// Recursively accumulates values across the binary tree of modifiers.
  ///
  /// Executes the [operation] on every atomic element encountered, propagating
  /// the [initial] value from the outermost to the innermost modifier.
  R foldIn<R>(R initial, ModifierOperation<R, S> operation);

  /// Returns `true` if [predicate] returns true for any [ModifierElement] in this [Modifier].
  bool any(bool Function(ModifierElement<S> element) predicate);

  /// Returns `true` if [predicate] returns true for all [ModifierElement]s in this [Modifier] or if this
  /// [Modifier] contains no [MModifierElement]s.
  bool all(bool Function(ModifierElement<S> element) predicate);

  /// Combines this modifier with an [other] modifier into a single chain.
  ///
  /// This implements the associative composition law of a monoid. It
  /// intelligently discards redundant [UnModifier] anchors to keep the
  /// abstract syntax tree shallow and highly optimized.
  Modifier<S> then(Modifier<S> other) {
    if (other is UnModifier<S>) return this;
    if (this is UnModifier<S>) return other;
    return CombinedModifier<S>(this, other);
  }
}

/// An empty, non-operational state in the modifier pipeline.
///
/// Acting as the identity element of the modifier algebra, it performs no
/// visual transformations and passes the accumulator along untouched.
class UnModifier<S> implements Modifier<S> {
  /// A constant constructor to guarantee canonicalization and zero-cost
  /// instantiation.
  const UnModifier();

  @override
  R foldIn<R>(R initial, ModifierOperation<R, S> operation) => initial;

  @override
  bool any(bool Function(ModifierElement<S> element) predicate) => false;

  @override
  bool all(bool Function(ModifierElement<S> element) predicate) => true;

  @override
  Modifier<S> then(Modifier<S> other) => other;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UnModifier<S>;
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

/// The base class for all concrete layout and decorative transformations.
///
/// Every subclass (e.g., `PaddingElement`, `CenterElement`) represents an
/// atomic leaf node in the modifier tree. To create a custom modifier,
/// extend this class and override the [build] method.
abstract class ModifierElement<S> implements Modifier<S> {
  /// A constant constructor allowing static compilation of atomic nodes.
  const ModifierElement();

  /// Wraps the given [child] inside the target native Flutter primitive.
  ///
  /// Returns the newly composed [Widget].
  @internal
  Widget build(Widget child);

  /// Checks whether this modifier produces a Flutter widget of type [Type].
  ///
  /// Used in unit tests to identify a decoration (`Padding` or `ColoredBox`)
  /// or a behavior (like `GestureDetector`) within the modifier chain.
  bool byWidgetType(Type type) => false;

  /// The raw configuration properties of this modifier (e.g., [Color], [EdgeInsets]).
  ///
  /// This list is designed **strictly for testing and debugging purposes**.
  ModifierProperties get props;

  @override
  R foldIn<R>(R initial, ModifierOperation<R, S> operation) =>
      operation(initial, this);

  @override
  bool any(bool Function(ModifierElement<S> element) predicate) =>
      predicate(this);

  @override
  bool all(bool Function(ModifierElement<S> element) predicate) =>
      predicate(this);

  @override
  Modifier<S> then(Modifier<S> other) {
    if (other is UnModifier<S>) return this;
    return CombinedModifier<S>(this, other);
  }

  @override
  @nonVirtual
  @pragma('vm:prefer-inline')
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ModifierElement<S> &&
            runtimeType == other.runtimeType &&
            iterableEquals(props, other.props);
  }

  @override
  @nonVirtual
  @pragma('vm:prefer-inline')
  int get hashCode => runtimeType.hashCode ^ hashProps(props);

  @override
  String toString() {
    return propsToString(runtimeType, props);
  }
}

/// An internal composite node linking two distinct modifier branches together.
///
/// By utilizing an immutable binary tree structure, this class eliminates the
/// need for dynamic array allocations (`List<T>`), resulting in highly
/// deterministic and secure runtime performance.
class CombinedModifier<S> implements Modifier<S> {
  /// The modifier sequence declared first (the outermost layout block).
  final Modifier<S> outer;

  /// The modifier sequence declared last (the innermost layout block).
  final Modifier<S> inner;

  /// Creates a composite binary node grouping the [outer] and [inner] chains.
  const CombinedModifier(this.outer, this.inner);

  @override
  R foldIn<R>(R initial, ModifierOperation<R, S> operation) =>
      inner.foldIn(outer.foldIn(initial, operation), operation);

  @override
  bool all(bool Function(ModifierElement<S> element) predicate) =>
      outer.all(predicate) || inner.all(predicate);

  @override
  bool any(bool Function(ModifierElement<S> element) predicate) =>
      outer.any(predicate) || inner.any(predicate);

  @override
  Modifier<S> then(Modifier<S> other) {
    if (other is UnModifier<S>) return this;
    return CombinedModifier<S>(this, other);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is CombinedModifier<S> &&
            runtimeType == other.runtimeType &&
            outer == other.outer &&
            inner == other.inner;
  }

  @override
  int get hashCode => Object.hash(runtimeType, outer, inner);

  @override
  String toString() {
    final buffer = StringBuffer('[');

    foldIn(buffer, (acc, element) {
      if (acc.length > 1) {
        acc.write(',');
      }
      acc.write(element);
      return acc;
    });

    buffer.write(']');
    return buffer.toString();
  }
}

/// A universal framework extension allowing any [Widget] to be processed by a [Modifier].
extension CallableWidget on Widget {
  Widget call<S>({required Modifier<S> modifier}) {
    return ModifierNode<S>(modifier: modifier, child: this);
  }
}
