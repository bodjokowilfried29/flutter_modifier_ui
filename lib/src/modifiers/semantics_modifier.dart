// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../modifier.dart';

/// Represents a [Semantics] in a modifier chain.
class _SemanticsElement<S> extends ModifierElement<S> {
  final Key? key;
  final bool container;
  final bool explicitChildNodes;
  final bool excludeSemantics;
  final bool blockUserActions;
  final bool? enabled;
  final bool? checked;
  final bool? mixed;
  final bool? selected;
  final bool? toggled;
  final bool? button;
  final bool? slider;
  final bool? keyboardKey;
  final bool? link;
  final Uri? linkUrl;
  final bool? header;
  final int? headingLevel;
  final bool? textField;
  final bool? readOnly;
  final bool? focusable;
  final bool? focused;
  final AccessibilityFocusBlockType? accessibilityFocusBlockType;
  final bool? inMutuallyExclusiveGroup;
  final bool? obscured;
  final bool? multiline;
  final bool? scopesRoute;
  final bool? namesRoute;
  final bool? hidden;
  final bool? image;
  final bool? liveRegion;
  final bool? expanded;
  final bool? isRequired;
  final int? maxValueLength;
  final int? currentValueLength;
  final String? identifier;
  final Object? traversalParentIdentifier;
  final Object? traversalChildIdentifier;
  final String? label;
  final AttributedString? attributedLabel;
  final String? value;
  final AttributedString? attributedValue;
  final String? increasedValue;
  final AttributedString? attributedIncreasedValue;
  final String? decreasedValue;
  final AttributedString? attributedDecreasedValue;
  final String? hint;
  final AttributedString? attributedHint;
  final String? tooltip;
  final String? onTapHint;
  final String? onLongPressHint;
  final TextDirection? textDirection;
  final SemanticsSortKey? sortKey;
  final SemanticsTag? tagForChildren;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final void Function()? onScrollLeft;
  final void Function()? onScrollRight;
  final void Function()? onScrollUp;
  final void Function()? onScrollDown;
  final void Function()? onIncrease;
  final void Function()? onDecrease;
  final void Function()? onCopy;
  final void Function()? onCut;
  final void Function()? onPaste;
  final void Function()? onDismiss;
  final void Function(bool)? onMoveCursorForwardByCharacter;
  final void Function(bool)? onMoveCursorBackwardByCharacter;
  final void Function(TextSelection)? onSetSelection;
  final void Function(String)? onSetText;
  final void Function()? onDidGainAccessibilityFocus;
  final void Function()? onDidLoseAccessibilityFocus;
  final void Function()? onFocus;
  final void Function()? onExpand;
  final void Function()? onCollapse;
  final Map<CustomSemanticsAction, void Function()>? customSemanticsActions;
  final SemanticsRole? role;
  final Set<String>? controlsNodes;
  final SemanticsValidationResult validationResult;
  final SemanticsHitTestBehavior? hitTestBehavior;
  final SemanticsInputType? inputType;
  final Locale? localeForSubtree;
  final String? minValue;
  final String? maxValue;

  const _SemanticsElement({
    this.key,
    this.container = false,
    this.explicitChildNodes = false,
    this.excludeSemantics = false,
    this.blockUserActions = false,
    this.enabled,
    this.checked,
    this.mixed,
    this.selected,
    this.toggled,
    this.button,
    this.slider,
    this.keyboardKey,
    this.link,
    this.linkUrl,
    this.header,
    this.headingLevel,
    this.textField,
    this.readOnly,
    this.focusable,
    this.focused,
    this.accessibilityFocusBlockType,
    this.inMutuallyExclusiveGroup,
    this.obscured,
    this.multiline,
    this.scopesRoute,
    this.namesRoute,
    this.hidden,
    this.image,
    this.liveRegion,
    this.expanded,
    this.isRequired,
    this.maxValueLength,
    this.currentValueLength,
    this.identifier,
    this.traversalParentIdentifier,
    this.traversalChildIdentifier,
    this.label,
    this.attributedLabel,
    this.value,
    this.attributedValue,
    this.increasedValue,
    this.attributedIncreasedValue,
    this.decreasedValue,
    this.attributedDecreasedValue,
    this.hint,
    this.attributedHint,
    this.tooltip,
    this.onTapHint,
    this.onLongPressHint,
    this.textDirection,
    this.sortKey,
    this.tagForChildren,
    this.onTap,
    this.onLongPress,
    this.onScrollLeft,
    this.onScrollRight,
    this.onScrollUp,
    this.onScrollDown,
    this.onIncrease,
    this.onDecrease,
    this.onCopy,
    this.onCut,
    this.onPaste,
    this.onDismiss,
    this.onMoveCursorForwardByCharacter,
    this.onMoveCursorBackwardByCharacter,
    this.onSetSelection,
    this.onSetText,
    this.onDidGainAccessibilityFocus,
    this.onDidLoseAccessibilityFocus,
    this.onFocus,
    this.onExpand,
    this.onCollapse,
    this.customSemanticsActions,
    this.role,
    this.controlsNodes,
    this.validationResult = SemanticsValidationResult.none,
    this.hitTestBehavior,
    this.inputType,
    this.localeForSubtree,
    this.minValue,
    this.maxValue,
  });

  @override
  Widget build(Widget child) {
    return Semantics(
      key: key,
      container: container,
      explicitChildNodes: explicitChildNodes,
      excludeSemantics: excludeSemantics,
      blockUserActions: blockUserActions,
      enabled: enabled,
      checked: checked,
      mixed: mixed,
      selected: selected,
      toggled: toggled,
      button: button,
      slider: slider,
      keyboardKey: keyboardKey,
      link: link,
      linkUrl: linkUrl,
      header: header,
      headingLevel: headingLevel,
      textField: textField,
      readOnly: readOnly,
      focusable: focusable,
      focused: focused,
      accessibilityFocusBlockType: accessibilityFocusBlockType,
      inMutuallyExclusiveGroup: inMutuallyExclusiveGroup,
      obscured: obscured,
      multiline: multiline,
      scopesRoute: scopesRoute,
      namesRoute: namesRoute,
      hidden: hidden,
      image: image,
      liveRegion: liveRegion,
      expanded: expanded,
      isRequired: isRequired,
      maxValueLength: maxValueLength,
      currentValueLength: currentValueLength,
      identifier: identifier,
      traversalParentIdentifier: traversalParentIdentifier,
      traversalChildIdentifier: traversalChildIdentifier,
      label: label,
      attributedLabel: attributedLabel,
      value: value,
      attributedValue: attributedValue,
      increasedValue: increasedValue,
      attributedIncreasedValue: attributedIncreasedValue,
      decreasedValue: decreasedValue,
      attributedDecreasedValue: attributedDecreasedValue,
      hint: hint,
      attributedHint: attributedHint,
      tooltip: tooltip,
      onTapHint: onTapHint,
      onLongPressHint: onLongPressHint,
      textDirection: textDirection,
      sortKey: sortKey,
      tagForChildren: tagForChildren,
      onTap: onTap,
      onLongPress: onLongPress,
      onScrollLeft: onScrollLeft,
      onScrollRight: onScrollRight,
      onScrollUp: onScrollUp,
      onScrollDown: onScrollDown,
      onIncrease: onIncrease,
      onDecrease: onDecrease,
      onCopy: onCopy,
      onCut: onCut,
      onPaste: onPaste,
      onDismiss: onDismiss,
      onMoveCursorForwardByCharacter: onMoveCursorForwardByCharacter,
      onMoveCursorBackwardByCharacter: onMoveCursorBackwardByCharacter,
      onSetSelection: onSetSelection,
      onSetText: onSetText,
      onDidGainAccessibilityFocus: onDidGainAccessibilityFocus,
      onDidLoseAccessibilityFocus: onDidLoseAccessibilityFocus,
      onFocus: onFocus,
      onExpand: onExpand,
      onCollapse: onCollapse,
      customSemanticsActions: customSemanticsActions,
      role: role,
      controlsNodes: controlsNodes,
      validationResult: validationResult,
      hitTestBehavior: hitTestBehavior,
      inputType: inputType,
      localeForSubtree: localeForSubtree,
      minValue: minValue,
      maxValue: maxValue,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == Semantics;

  @override
  ModifierProperties get props => [
    key,
    container,
    explicitChildNodes,
    excludeSemantics,
    blockUserActions,
    enabled,
    checked,
    mixed,
    selected,
    toggled,
    button,
    slider,
    keyboardKey,
    link,
    linkUrl,
    header,
    headingLevel,
    textField,
    readOnly,
    focusable,
    focused,
    accessibilityFocusBlockType,
    inMutuallyExclusiveGroup,
    obscured,
    multiline,
    scopesRoute,
    namesRoute,
    hidden,
    image,
    liveRegion,
    expanded,
    isRequired,
    maxValueLength,
    currentValueLength,
    identifier,
    traversalParentIdentifier,
    traversalChildIdentifier,
    label,
    attributedLabel,
    value,
    attributedValue,
    increasedValue,
    attributedIncreasedValue,
    decreasedValue,
    attributedDecreasedValue,
    hint,
    attributedHint,
    tooltip,
    onTapHint,
    onLongPressHint,
    textDirection,
    sortKey,
    tagForChildren,
    onTap,
    onLongPress,
    onScrollLeft,
    onScrollRight,
    onScrollUp,
    onScrollDown,
    onIncrease,
    onDecrease,
    onCopy,
    onCut,
    onPaste,
    onDismiss,
    onMoveCursorForwardByCharacter,
    onMoveCursorBackwardByCharacter,
    onSetSelection,
    onSetText,
    onDidGainAccessibilityFocus,
    onDidLoseAccessibilityFocus,
    onFocus,
    onExpand,
    onCollapse,
    customSemanticsActions,
    role,
    controlsNodes,
    validationResult,
    hitTestBehavior,
    inputType,
    localeForSubtree,
    minValue,
    maxValue,
  ];
}

extension SemanticsModifier<S> on Modifier<S> {
  /// Adds a [_SemanticsElement] to this [Modifier].
  Modifier<S> semantics({
    Key? key,
    bool container = false,
    bool explicitChildNodes = false,
    bool excludeSemantics = false,
    bool blockUserActions = false,
    bool? enabled,
    bool? checked,
    bool? mixed,
    bool? selected,
    bool? toggled,
    bool? button,
    bool? slider,
    bool? keyboardKey,
    bool? link,
    Uri? linkUrl,
    bool? header,
    int? headingLevel,
    bool? textField,
    bool? readOnly,
    bool? focusable,
    bool? focused,
    AccessibilityFocusBlockType? accessibilityFocusBlockType,
    bool? inMutuallyExclusiveGroup,
    bool? obscured,
    bool? multiline,
    bool? scopesRoute,
    bool? namesRoute,
    bool? hidden,
    bool? image,
    bool? liveRegion,
    bool? expanded,
    bool? isRequired,
    int? maxValueLength,
    int? currentValueLength,
    String? identifier,
    Object? traversalParentIdentifier,
    Object? traversalChildIdentifier,
    String? label,
    AttributedString? attributedLabel,
    String? value,
    AttributedString? attributedValue,
    String? increasedValue,
    AttributedString? attributedIncreasedValue,
    String? decreasedValue,
    AttributedString? attributedDecreasedValue,
    String? hint,
    AttributedString? attributedHint,
    String? tooltip,
    String? onTapHint,
    String? onLongPressHint,
    TextDirection? textDirection,
    SemanticsSortKey? sortKey,
    SemanticsTag? tagForChildren,
    void Function()? onTap,
    void Function()? onLongPress,
    void Function()? onScrollLeft,
    void Function()? onScrollRight,
    void Function()? onScrollUp,
    void Function()? onScrollDown,
    void Function()? onIncrease,
    void Function()? onDecrease,
    void Function()? onCopy,
    void Function()? onCut,
    void Function()? onPaste,
    void Function()? onDismiss,
    void Function(bool)? onMoveCursorForwardByCharacter,
    void Function(bool)? onMoveCursorBackwardByCharacter,
    void Function(TextSelection)? onSetSelection,
    void Function(String)? onSetText,
    void Function()? onDidGainAccessibilityFocus,
    void Function()? onDidLoseAccessibilityFocus,
    void Function()? onFocus,
    void Function()? onExpand,
    void Function()? onCollapse,
    Map<CustomSemanticsAction, void Function()>? customSemanticsActions,
    SemanticsRole? role,
    Set<String>? controlsNodes,
    SemanticsValidationResult validationResult = SemanticsValidationResult.none,
    SemanticsHitTestBehavior? hitTestBehavior,
    SemanticsInputType? inputType,
    Locale? localeForSubtree,
    String? minValue,
    String? maxValue,
  }) {
    return then(
      _SemanticsElement<S>(
        key: key,
        container: container,
        explicitChildNodes: explicitChildNodes,
        excludeSemantics: excludeSemantics,
        blockUserActions: blockUserActions,
        enabled: enabled,
        checked: checked,
        mixed: mixed,
        selected: selected,
        toggled: toggled,
        button: button,
        slider: slider,
        keyboardKey: keyboardKey,
        link: link,
        linkUrl: linkUrl,
        header: header,
        headingLevel: headingLevel,
        textField: textField,
        readOnly: readOnly,
        focusable: focusable,
        focused: focused,
        accessibilityFocusBlockType: accessibilityFocusBlockType,
        inMutuallyExclusiveGroup: inMutuallyExclusiveGroup,
        obscured: obscured,
        multiline: multiline,
        scopesRoute: scopesRoute,
        namesRoute: namesRoute,
        hidden: hidden,
        image: image,
        liveRegion: liveRegion,
        expanded: expanded,
        isRequired: isRequired,
        maxValueLength: maxValueLength,
        currentValueLength: currentValueLength,
        identifier: identifier,
        traversalParentIdentifier: traversalParentIdentifier,
        traversalChildIdentifier: traversalChildIdentifier,
        label: label,
        attributedLabel: attributedLabel,
        value: value,
        attributedValue: attributedValue,
        increasedValue: increasedValue,
        attributedIncreasedValue: attributedIncreasedValue,
        decreasedValue: decreasedValue,
        attributedDecreasedValue: attributedDecreasedValue,
        hint: hint,
        attributedHint: attributedHint,
        tooltip: tooltip,
        onTapHint: onTapHint,
        onLongPressHint: onLongPressHint,
        textDirection: textDirection,
        sortKey: sortKey,
        tagForChildren: tagForChildren,
        onTap: onTap,
        onLongPress: onLongPress,
        onScrollLeft: onScrollLeft,
        onScrollRight: onScrollRight,
        onScrollUp: onScrollUp,
        onScrollDown: onScrollDown,
        onIncrease: onIncrease,
        onDecrease: onDecrease,
        onCopy: onCopy,
        onCut: onCut,
        onPaste: onPaste,
        onDismiss: onDismiss,
        onMoveCursorForwardByCharacter: onMoveCursorForwardByCharacter,
        onMoveCursorBackwardByCharacter: onMoveCursorBackwardByCharacter,
        onSetSelection: onSetSelection,
        onSetText: onSetText,
        onDidGainAccessibilityFocus: onDidGainAccessibilityFocus,
        onDidLoseAccessibilityFocus: onDidLoseAccessibilityFocus,
        onFocus: onFocus,
        onExpand: onExpand,
        onCollapse: onCollapse,
        customSemanticsActions: customSemanticsActions,
        role: role,
        controlsNodes: controlsNodes,
        validationResult: validationResult,
        hitTestBehavior: hitTestBehavior,
        inputType: inputType,
        localeForSubtree: localeForSubtree,
        minValue: minValue,
        maxValue: maxValue,
      ),
    );
  }
}

/// Represents a [Semantics.fromProperties] in a modifier chain.
class _SemanticsFromPropertiesElement<S> extends ModifierElement<S> {
  final Key? key;
  final bool container;
  final bool explicitChildNodes;
  final bool excludeSemantics;
  final bool blockUserActions;
  final Locale? localeForSubtree;
  final SemanticsProperties properties;

  const _SemanticsFromPropertiesElement({
    this.key,
    this.container = false,
    this.explicitChildNodes = false,
    this.excludeSemantics = false,
    this.blockUserActions = false,
    this.localeForSubtree,
    required this.properties,
  });

  @override
  Widget build(Widget child) {
    return Semantics.fromProperties(
      key: key,
      container: container,
      explicitChildNodes: explicitChildNodes,
      excludeSemantics: excludeSemantics,
      blockUserActions: blockUserActions,
      localeForSubtree: localeForSubtree,
      properties: properties,
      child: child,
    );
  }

  @override
  bool byWidgetType(Type type) => type == Semantics;

  @override
  ModifierProperties get props => [
    key,
    container,
    explicitChildNodes,
    excludeSemantics,
    blockUserActions,
    localeForSubtree,
    properties,
  ];
}

extension SemanticsFromPropertiesModifier<S> on Modifier<S> {
  /// Adds a [_SemanticsFromPropertiesElement] to this [Modifier].
  Modifier<S> semanticsFromProperties({
    Key? key,
    bool container = false,
    bool explicitChildNodes = false,
    bool excludeSemantics = false,
    bool blockUserActions = false,
    Locale? localeForSubtree,
    required SemanticsProperties properties,
  }) {
    return then(
      _SemanticsFromPropertiesElement<S>(
        key: key,
        container: container,
        explicitChildNodes: explicitChildNodes,
        excludeSemantics: excludeSemantics,
        blockUserActions: blockUserActions,
        localeForSubtree: localeForSubtree,
        properties: properties,
      ),
    );
  }
}
