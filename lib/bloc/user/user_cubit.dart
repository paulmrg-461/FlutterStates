import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/models/user.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void selectUser(User user) => emit(SelectedUser(user));

  void changeAge(int age) {
    final currentState = state;
    if (currentState is SelectedUser) {
      final newUser = currentState.user.copyWith(age: age);
      emit(SelectedUser(newUser));
    }
  }

  void addOccupation(String occupation) {
    final currentState = state;
    if (currentState is SelectedUser) {
      final newOccupations = [...currentState.user.occupations!, occupation];
      final newUser = currentState.user.copyWith(occupations: newOccupations);
      emit(SelectedUser(newUser));
    }
  }

  void deletUser() => emit(UserInitial());
}
