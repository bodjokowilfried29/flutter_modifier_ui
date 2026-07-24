import '../modifier.dart';

/// Determines whether two iterables are equal.
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

/// Determines whether two lists are equal.
@pragma('vm:prefer-inline')
bool equals(List<Object?>? a, List<Object?>? b) {
  if (identical(a, b)) return true;
  if (a == null || b == null) return false;
  return iterableEquals(a, b);
}

/// Determines whether two objects are equal.
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

/// Determines whether two sets are equal.
bool setEquals(Set<Object?> a, Set<Object?> b) {
  if (identical(a, b)) return true;
  if (a.length != b.length) return false;

  for (final element in a) {
    if (b.contains(element)) continue;

    bool found = false;
    for (final bElement in b) {
      if (objectsEquals(element, bElement)) {
        found = true;
        break;
      }
    }
    if (!found) return false;
  }
  return true;
}

/// Determines whether two maps are equal
bool mapEquals(Map<Object?, Object?> a, Map<Object?, Object?> b) {
  if (identical(a, b)) return true;
  if (a.length != b.length) return false;
  for (final key in a.keys) {
    if (!b.containsKey(key) || !objectsEquals(a[key], b[key])) return false;
  }
  return true;
}

/// Returns a `hashCode` for [props].
@pragma('vm:prefer-inline')
int hashProps(Iterable<Object?>? props) {
  if (props == null) return _finish(0);

  int hash = 0;
  for (final prop in props) {
    hash = _combine(hash, prop);
  }
  return _finish(hash);
}

/// Jenkins Hash Functions
int _combine(int hash, Object? object) {
  if (object == null) return _combineHash(hash, 0);

  if (object is Map) {
    int mapHash = 0;
    for (final key in object.keys) {
      int entryHash = _combine(0, key);
      mapHash ^= _combine(entryHash, object[key]);
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
    int iterHash = 0;
    for (final value in object) {
      iterHash = _combine(iterHash, value);
    }
    return hash ^ iterHash;
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

String propsToString(Type runtimeType, List<Object?> props) {
  return '$runtimeType(${props.map((prop) => prop.toString()).join(', ')})';
}
