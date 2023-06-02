void main() {
  final record = (3, 1);
  print(record);
  print(swap(record));
}

(int, int) swap((int, int) record) {
  final (a, b) = record;
  return (b, a);
}
