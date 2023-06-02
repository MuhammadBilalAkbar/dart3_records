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
