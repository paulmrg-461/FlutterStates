import 'package:flutter/foundation.dart';
import 'package:states/models/user.dart';

class UserService with ChangeNotifier {
  User? _user;
  User get user => _user!;
  bool get existUser => (_user != null) ? true : false;
  set user(User user) {
    _user = user;
    notifyListeners();
  }

  void changeAge(int age) {
    _user!.age = age;
    notifyListeners();
  }

  void removeUser() {
    _user = null;
    notifyListeners();
  }

  void addOccupation(String occupation) {
    _user?.occupations?.add(occupation);
    notifyListeners();
  }
}
