/// Records allow functions to return multiple values bundled together.
// This method Returns multiple values in a record:
(String, int) userInfo(Map<String, dynamic> json) =>
    (json['name'] as String, json['age'] as int);

void main() {
  final json = <String, dynamic>{'name': 'David', 'age': 10};

//   final info = userInfo(json);
//   final name = info.$1;
//   final age  = info.$2;asdfasd

  /// Destructures using a record pattern:
  final (name, age) = userInfo(json);

  print(name);
  print(age);
}
