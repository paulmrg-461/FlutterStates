class User {
  final String? name;
  final int? age;
  final List<String>? occupations;

  User({this.name, this.age, this.occupations});

  copyWith({
    String? name,
    int? age,
    List<String>? occupations,
  }) =>
      User(
          name: name ?? this.name,
          age: age ?? this.age,
          occupations: occupations ?? this.occupations);
}
