A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

# dart3_records

##### Contents

- [Record syntax](#Record syntax)
- [Record fields](#Record fields)
- [Record types](#Record types)
- [Record equality](#Record equality)
- [Multiple returns](#Multiple returns)

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
var record = ('first', a: 2, b: true, 'last');

print(record.$1); // Prints 'first'
print(record.a); // Prints 2
print(record.b); // Prints true
print(record.$2); // Prints 'last'
```

## Record types

- There is no type declaration for individual record types. Records are structurally typed based on
  the types of their fields. A record’s shape (the set of its fields, the fields’ types, and their
  names, if any) determines the type of a record.
- Each field in a record has its own type. Field types can differ within the same record:

```dart

(num, Object) pair = (42, 'a');

var first = pair.$1; // Static type `num`, runtime type `int`.
var second = pair.$2; // Static type `Object`, runtime type `String`.
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
  var (name, age) = userInfo(json);
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