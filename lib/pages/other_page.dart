import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/bloc/user/user_cubit.dart';
import 'package:states/models/user.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('OtherPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  final User user = User(
                      name: 'Paul Realpe',
                      age: 25,
                      occupations: [
                        'Flutter Mobile Developer',
                        'Fullstack Junior Developer'
                      ]);
                  userCubit.selectUser(user);
                },
                child: const Text('SET USER')),
            ElevatedButton(
                onPressed: () => userCubit.changeAge(22),
                child: const Text('CHANGE AGE')),
            ElevatedButton(
                onPressed: () => userCubit.addOccupation('iOS Developer'),
                child: const Text('ADD OCCUPATION')),
          ],
        ),
      ),
    );
  }
}
