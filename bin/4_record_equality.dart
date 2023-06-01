/// Two records are equal if they have the same shape (set of fields), and their corresponding fields have the same values.
/// Since named field order is not part of a record’s shape, the order of named fields does not affect equality.

void main() {
  (int x, int y, int z) optionalPoints = (1, 2, 3);
  (int r, int g, int b) optionalColors = (1, 2, 3);

  print(optionalPoints == optionalColors); // Prints 'true'.

  ({int x, int y, int z}) namedPoints = (x: 1, y: 2, z: 3);
  ({int r, int g, int b}) namedColors = (r: 1, g: 2, b: 3);

  print(namedPoints == namedColors); // Prints 'false'. Lint: Equals on unrelated types.
}
