/// Records expressions are comma lists of named or positional fields, enclosed in parentheses.

void main() {
  /// positionalRecord
  (String, int) positionalRecord;
  positionalRecord = ('A string', 123);
  print(positionalRecord);

  /// namedRecord
  ({int a, bool b}) namedRecord;
  namedRecord = (a: 123, b: true);
  print(namedRecord);

  /// positional and named mix Record
  var record = ('first', a: 2, b: true, 'last');
  print(record); // positional parameters are printed first and then
  // named parameters are printed

  /// In a record type annotation, you can also name the positional fields. They don’t affect the record’s type.
  ({int a, int b}) recordAB = (a: 1, b: 2);
  ({int x, int y}) recordXY = (x: 3, y: 4);
  // recordAB = recordXY; // Compile error! These records don't have the same type.

  (int a, int b) recordA = (1, 2);
  (int x, int y) recordB = (3, 4);
  recordA = recordB; // OK.
  print(recordA);
}
