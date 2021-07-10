import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states/models/user.dart';
import 'package:states/services/user_service.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final UserService userService = Provider.of<UserService>(context);
    return Scaffold(
      appBar: AppBar(
        title: userService.existUser
            ? Text(userService.user.name!)
            : const Text('Actions'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  User user = User(name: 'Paul', age: 25, occupations: [
                    'Mobile developer',
                    'Frontend Web developer',
                    'Fullstack junior developer'
                  ]);

                  userService.user = user;
                },
                child: const Text('SET USER')),
            ElevatedButton(
                onPressed: () {
                  userService.changeAge(27);
                },
                child: const Text('CHANGE AGE')),
            ElevatedButton(
                onPressed: () {
                  userService.addOccupation('iOS Developer');
                },
                child: const Text('ADD OCCUPATION')),
          ],
        ),
      ),
    );
  }
}
