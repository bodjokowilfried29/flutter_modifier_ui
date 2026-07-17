// Copyright 2026 Wilfried Bodjoko. All rights reserved.
// Licensed under the Apache License, Version 2.0.

library;

import '../modifier.dart';

@pragma('vm:prefer-inline')
bool iterableEquals(Iterable<Object?> a, Iterable<Object?> b) {
  if (identical(a, b)) return true;
  if (a.length != b.length) return false;

  if (a is List && b is List) {
    for (var i = 0; i < a.length; i++) {
      if (!objectsEquals(a[i], b[i])) return false;
    }
    return true;
  }

  final itA = a.iterator;
  final itB = b.iterator;
  while (itA.moveNext() && itB.moveNext()) {
    if (!objectsEquals(itA.current, itB.current)) return false;
  }
  return true;
}

@pragma('vm:prefer-inline')
bool equals(List<Object?>? a, List<Object?>? b) {
  if (identical(a, b)) return true;
  if (a == null || b == null) return false;
  return iterableEquals(a, b);
}

@pragma('vm:prefer-inline')
bool objectsEquals(Object? a, Object? b) {
  if (identical(a, b)) return true;
  if (a is num && b is num) return a == b;
  if (a is ModifierElement && b is ModifierElement) return a == b;
  if (a is Set && b is Set) return setEquals(a, b);
  if (a is Iterable && b is Iterable) return iterableEquals(a, b);
  if (a is Map && b is Map) return mapEquals(a, b);
  if (a?.runtimeType != b?.runtimeType) return false;
  return a == b;
}

bool setEquals(Set<Object?> a, Set<Object?> b) {
  if (identical(a, b)) return true;
  if (a.length != b.length) return false;
  for (final element in a) {
    if (!b.contains(element) && !b.any((e) => objectsEquals(element, e))) {
      return false;
    }
  }
  return true;
}

bool mapEquals(Map<Object?, Object?> a, Map<Object?, Object?> b) {
  if (identical(a, b)) return true;
  if (a.length != b.length) return false;
  for (final key in a.keys) {
    if (!b.containsKey(key) || !objectsEquals(a[key], b[key])) return false;
  }
  return true;
}

int hashProps(Iterable<Object?>? props) {
  return _finish(props == null ? 0 : props.fold(0, _combine));
}

int _combine(int hash, Object? object) {
  if (object is Map) {
    int mapHash = 0;

    for (final entry in object.entries) {
      mapHash ^= _combine(0, [entry.key, entry.value]);
    }
    return hash ^ mapHash;
  }

  if (object is Set) {
    int setHash = 0;
    for (final value in object) {
      setHash ^= _combine(0, value);
    }
    return hash ^ setHash;
  }

  if (object is Iterable) {
    for (final value in object) {
      hash = _combineHash(hash, value.hashCode);
    }
    return hash ^ object.length;
  }

  return _combineHash(hash, object.hashCode);
}

@pragma('vm:prefer-inline')
int _combineHash(int hash, int valueHash) {
  hash = 0x1fffffff & (hash + valueHash);
  hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
  return hash ^ (hash >> 6);
}

int _finish(int hash) {
  hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
  hash = hash ^ (hash >> 11);
  return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
}
