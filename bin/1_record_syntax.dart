/// Records expressions are comma lists of named or positional fields, enclosed in parentheses.

void main() {
  final record = ('Hello World', 1, 8.0, true, false);
  print(record);
  /// positionalRecord
  (String, int) positionalRecord;
  positionalRecord = ('A string', 123);

  /// namedRecord
  ({int a, bool b}) namedRecord;
  namedRecord = (a: 123, b: true);

  /// positional and named mix Record
  // positional parameters are printed first and then
  // named parameters are printed
  final mixedRecords1 = ('first', a: 2, b: true, 'last');
  (int a, {int b, bool c}) mixedRecords2;
  mixedRecords2 = (1, b: 123, c: true);

  print(mixedRecords1);
  print(mixedRecords2);
}
