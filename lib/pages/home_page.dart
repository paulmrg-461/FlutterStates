import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/bloc/user/user_cubit.dart';
import 'package:states/models/user.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        actions: [
          IconButton(
              onPressed: () => userCubit.deletUser(),
              icon: const Icon(Icons.delete))
        ],
      ),
      body: const ScaffoldBody(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.navigation_outlined),
          onPressed: () => Navigator.pushNamed(context, 'other')),
    );
  }
}

class ScaffoldBody extends StatelessWidget {
  const ScaffoldBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (_, state) {
      switch (state.runtimeType) {
        case UserInitial:
          return const Center(child: Text('User information doesn\'t exist.'));
        case SelectedUser:
          return UserInfo(user: (state as SelectedUser).user);
        default:
          return const Text('State Error');
      }
      // if (state is UserInitial) {
      //   return const Center(child: Text('User information doesn\'t exist.'));
      // } else if (state is SelectedUser) {
      //   return UserInfo(user: state.user);
      // } else {
      //   return const Text('State Error');
      // }
    });
  }
}

class UserInfo extends StatelessWidget {
  final User? user;

  const UserInfo({
    Key? key,
    this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'General',
            style: TextStyle(fontSize: 18),
          ),
          const Divider(),
          ListTile(
            title: Text(user!.name!),
          ),
          ListTile(
            title: Text('${user!.age!}'),
          ),
          const Text(
            'Occupations',
            style: TextStyle(fontSize: 18),
          ),
          const Divider(),
          ...user!.occupations!
              .map((occupation) => ListTile(title: Text(occupation)))
              .toList(),
        ],
      ),
    );
  }
}
