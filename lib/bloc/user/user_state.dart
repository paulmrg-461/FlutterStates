part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {
  final existUser = false;

  @override
  String toString() => 'InitialUser: ExistUser: False';
}

class SelectedUser extends UserState {
  final existUser = true;
  final User user;

  SelectedUser(this.user);
}
