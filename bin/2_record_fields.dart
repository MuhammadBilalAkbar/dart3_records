/// Record fields are accessible through built-in getters.
/// Records are immutable, so fields do not have setters.

void main() {
  /// positionalRecord
  final positionalRecord = ('A string', 123);
  print(positionalRecord.$1); // Prints 'A string'
  print(positionalRecord.$2); // Prints 123

  /// namedRecord
  final namedRecord = (a: 123, b: true);
  print(namedRecord.a); // Prints 123
  print(namedRecord.b); // Prints true

  /// positional and named mix Record
  final mixedRecord = ('first', a: 2, b: true, 'last');
  print(mixedRecord.$1); // Prints 'first'
  print(mixedRecord.a); // Prints 2
  print(mixedRecord.b); // Prints true
  print(mixedRecord.$2); // Prints 'last'
}
