/// Records allow functions to return multiple values bundled together.
(String, int) userInfo(Map<String, dynamic> json) =>
    (json['name'] as String, json['age'] as int);

final json = <String, dynamic>{'name': 'David', 'age': 10, 'color': 'blue'};

void main() {
  /// De-structures using a record pattern:
  final (name, age) = userInfo(json);
  print(name);
  print(age);

// // Equivalent to:
//   final info = userInfo(json);
//   final name = info.$1;
//   final age  = info.$2;
}
