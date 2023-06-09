[//]: # (A sample command-line application with an entrypoint in `bin/`, library code)

[//]: # (in `lib/`, and example unit test in `test/`.)

## 1. Research: Dart3 Records (New Features)

- Keywords:
    - Dart 3 records
    - Dart 3 records github
    - Dart 3 records example
    - Records in dart examples
    - Records in dart examples
    - Records in dart examples
    - flutter record type
    - records in dart language
- Video Title: Records in Dart Language | New Features in Dart 3 with Records Examples

## 2. Research: Competitors

**Flutter Videos/Articles**

- 8.6K: https://youtu.be/aWOyc3HG9XM
- https://dart.dev/language/records
- https://api.flutter.dev/flutter/dart-core/Record-class.html
- https://github.com/dart-lang/language/blob/main/accepted/future-releases/records/records-feature-specification.md
- https://www.christianfindlay.com/blog/dart-records-and-futures
- https://stevenosse.com/dart-3-in-depth-records

  **Dart3 All Features:**
- 30K: https://youtu.be/KhYTFglbF2k
- 65K: https://youtu.be/yRlwOdCK7Ho?t=412
- 19K: https://youtu.be/dBwvc-U8q-c
- 2.3K: https://youtu.be/kJLLzrhMku4
- 1.6K: https://youtu.be/r51ARivU2GM
- 873: https://youtu.be/YGDYjtbx9Yg
- 442: https://youtu.be/7NsBBXyCX3s
- https://medium.com/dartlang/announcing-dart-3-53f065a10635
- https://medium.com/flutter-community/new-features-in-dart-3-0-7e95ad8d0b81
- https://codewithandrea.com/articles/whats-new-dart-3-introduction/
- https://proandroiddev.com/dart-3-0-revolutionizing-development-with-cutting-edge-features-a59e7b37aaf5
- https://www.sandromaglione.com/techblog/records-and-patterns-dart-language
- https://medium.com/@dnkibere/dart-3-records-pattern-matching-sealed-classes-and-more-12a9e3a52447
- https://blog.devgenius.io/dart-3-the-biggest-release-of-dart-yet-c9cf44ad428
- https://codelabs.developers.google.com/codelabs/dart-patterns-records#0
- https://www.infoworld.com/article/3696353/googles-dart-3-and-flutter-310-bring-big-changes.html

**Android/Swift/React Videos**

- 175K: https://youtu.be/gJ9DYC-jswo
- 18K: https://youtu.be/pmVgs8wOk5o
- 16K: https://youtu.be/X9JlNONeoM8
- 8K: https://youtu.be/NRonCfB4RYg
- 10K: https://youtu.be/vjhcU02io_E
- https://www.developer.com/java/java-record-class/
- https://www.geeksforgeeks.org/what-are-java-records-and-how-to-use-them-alongside-constructors-and-methods/
- https://www.digitalocean.com/community/tutorials/java-records-class
- https://www.programiz.com/swift-programming/tuples
- https://www.tutorialspoint.com/swift/swift_tuples.htm
- https://www.hackingwithswift.com/example-code/language/what-is-a-tuple
- https://www.tutlane.com/tutorial/swift/swift-tuples
- https://blog.logrocket.com/data-fetching-react-native/

**Great Features**

- Records in dart has multiple returns feature which does not exist in any other types of
  collections in dart. They are immutable, have compact syntax and allow pattern matching.

**Problems from Videos**

- NA

**Problems from Flutter Stackoverflow**

- NA

## 3. Video Structure

**Main Points / Purpose Of Lesson**

1. In this video, you will learn how to merge data of different types and return multiple types of
   data from a function using records.
2. Main Points:
    - Record syntax
    - Record fields
    - Record types
    - Record equality
    - Multiple returns
3. Records can also
   be [de-structured](https://dart.dev/language/patterns#destructuring-multiple-returns) using
   patterns matching in dart.

**The Structured Main Content**

##### Contents

[Record syntax](#Record-syntax)<br/>
[Record fields](#Record-fields)<br/>
[Record types](#Record-types)<br/>
[Record equality](#Record-equality)<br/>
[Multiple returns](#Multiple-returns)<br/>

# Records:

- Records are an anonymous, immutable(Records only have getters and don't have setters), merge type(
  gather separate sets of data).
- Like other collection types, they allow you gather multiple objects into a single object.
- Unlike other collection types, records are fixed-sized, heterogeneous(many types of variables it
  can store), and typed(guarantees that an expression of one type cannot produce a value of another
  type).
- Records are real values; you can store them in variables, nest them, pass them to and from
  functions, and store them in data structures such as lists, maps, and sets.

## Record syntax

1. **Syntax**

   Records expressions are separated by comma lists of named or positional fields, enclosed in
   parenthesis:

```dart
/// Positional
final records = (4.5, 'Hi', true, 2);

/// Named
final records = (4.5, 2, greeting: 'Hi', isAdult: true);
```

2. **Declaring and Initialization**

- Positional fields go directly inside the parenthesis separated by comma:

```dart 
// Record type annotation in a variable declaration:
(String, int) record;

// Initialize it with a record expression:
record = ('A string', 123);
```

- Named fields go inside a curly brace with type-and-name pairs, after all positional fields. In a
  record expression, the names go before each field value with a colon after:

```dart 
// Record type annotation in a variable declaration:
({int a, bool b}) record;

// Initialize it with a record expression:
record = (a: 123, b: true);
```

3. **Equality**

   Two records with named fields with different names have different types. They are not equal:

```dart

({int a, int b}) recordAB = (a: 1, b: 2);
({int x, int y}) recordXY = (x: 3, y: 4);

// Compile error! These records don't have the same type.
// recordAB = recordXY;
```

In a record type annotation, you can also name the positional fields, but these names are purely for
documentation and don’t affect the record’s type:

```dart

(int a, int b) recordAB = (1, 2);
(int x, int y) recordXY = (3, 4);

// recordAB = recordXY; // OK.
```

## Record fields

- Record fields are accessible through built-in getters. Records are immutable, so fields do not
  have setters.

- Named fields have getters of the same name. Positional fields have getters of the name $<position>
  , skipping the named fields:

```dart
/// Record fields are accessible through built-in getters.
/// Records are immutable, so fields do not have setters.

void main() {
  /// positionalRecord
  final positionalRecord = ('A string', 123);
  print(positionalRecord); // Prints (A string, 123)
  print(positionalRecord.$1); // Prints 'A string'
  print(positionalRecord.$2); // Prints 123

  /// namedRecord
  final namedRecord = (a: 123, b: true);
  print(namedRecord); // Prints (a: 123, b: true)
  print(namedRecord.a); // Prints 123
  print(namedRecord.b); // Prints true

  /// positional and named mix Record
  final record = ('first', a: 2, b: true, 'last');
  print(record); // Prints (first, last, a: 2, b: true)
  print(record.$1); // Prints 'first'
  print(record.a); // Prints 2
  print(record.b); // Prints true
  print(record.$2); // Prints 'last'
}
```

## Record types

- There is no type declaration for individual record types. Records are structurally typed based on
  the types of their fields. A record’s shape (the set of its fields, the fields’ types, and their
  names, if any) determines the type of a record.
- Each field in a record has its own type. Field types can differ within the same record:

```dart 
(num, Object) pair = (42, 'a');
final first = pair.$1; // Static type `num`, runtime type `int`.
final second = pair.$2; // Static type `Object`, runtime type `String`.
print('$first: ${first.runtimeType}');
print('$second: ${second.runtimeType}');
```

Consider two unrelated libraries that create records with the same set of fields. The type system
understands that those records are the same type even though the libraries are not coupled to each
other.

## Record equality

Two records are equal if they have the same shape (set of fields), and their corresponding fields
have the same values. Since named field order is not part of a record’s shape, the order of named
fields does not affect equality.

For example:

```dart 
(int x, int y, int z) point = (1, 2, 3);
(int r, int g, int b) color = (1, 2, 3); // Positional fields' names are purely for documentation and don’t affect the record’s type.

print(point == color); // Prints 'true'.
({int x, int y, int z}) point = (x: 1, y: 2, z: 3);
({int r, int g, int b}) color = (r: 1, g: 2, b: 3);

print(point == color); // Prints 'false'. Lint: Equals on unrelated types.
```

Records automatically define hashCode and equality == methods based on the structure of their
fields.

## Multiple returns

- Records allow functions to return multiple values bundled together in parenthesis before method
  name with their types.
- To retrieve record values from a return, de-structure the values into local variables using
  pattern matching.

```dart
(String, int) userInfo(Map<String, dynamic> json) =>
    (json['name'] as String, json['age'] as int);

final json = <String, dynamic>{'name': 'David', 'age': 10, 'color': 'blue'};

void main() {
  /// De-structures using a record pattern:
  final (name, age) = userInfo(json);
  print(name);
  print(age);

// // Equivalent to:
//   var info = userInfo(json);
//   var name = info.$1;
//   var age  = info.$2;
}
```

You can return multiple values from a function without records, but other methods have their
downsides. For example, creating a class is much more verbose, and using other collection types like
List or Map loses type safety(the types of variables).
