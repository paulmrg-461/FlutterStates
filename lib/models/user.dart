import 'package:flutter/foundation.dart';

class User {
  String? name;
  int? age;
  List<String>? occupations;

  User({@required this.name, @required this.age, @required this.occupations})
      : assert(name != null);
}
