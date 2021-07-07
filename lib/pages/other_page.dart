import 'package:flutter/material.dart';
import 'package:states/models/user.dart';
import 'package:states/pages/services/user_service.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: userService.userStream,
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            return snapshot.hasData
                ? Text('${snapshot.data!.name}')
                : const Text('ButtonsPage');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  final newUser = User(
                      name: 'Paul',
                      age: 25,
                      occupations: ['Mobile Developer', 'Web Developer']);
                  userService.addUser(newUser);
                },
                child: const Text('SET USER')),
            ElevatedButton(
                onPressed: () {
                  userService.changeAge(22);
                },
                child: const Text('CHANGE AGE')),
            ElevatedButton(
                onPressed: () {}, child: const Text('ADD OCCUPATION')),
          ],
        ),
      ),
    );
  }
}
