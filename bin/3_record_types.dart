/// Each field in a record has its own type. Field types can differ within the same record.
/// The type system is aware of each field’s type wherever it is accessed from the record:

void main() {
  (num, Object) record = (42, 'a');

  final first = record.$1; // Static type `num`, runtime type `int`.
  final second = record.$2; // Static type `Object`, runtime type `String`.
  print('$first: ${first.runtimeType}');
  print('$second: ${second.runtimeType}');
}
