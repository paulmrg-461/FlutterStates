import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states/models/user.dart';
import 'package:states/services/user_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final UserService userService = Provider.of<UserService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Information'),
        actions: [
          IconButton(
              onPressed: () => userService.removeUser(),
              icon: const Icon(Icons.restore))
        ],
      ),
      body: userService.existUser
          ? UserInfo(
              user: userService.user,
            )
          : const Center(child: Text('User information doesn\'t exist')),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.navigation_outlined),
          onPressed: () => Navigator.pushNamed(context, 'other')),
    );
  }
}

class UserInfo extends StatelessWidget {
  final User? user;
  const UserInfo({
    Key? key,
    @required this.user,
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
            title: Text('Name: ${user!.name}'),
          ),
          ListTile(
            title: Text('Age: ${user!.age}'),
          ),
          const Text(
            'Occupations',
            style: TextStyle(fontSize: 18),
          ),
          const Divider(),
          ...user!.occupations!
              .map((occupation) => ListTile(
                    title: Text(occupation),
                  ))
              .toList(),
        ],
      ),
    );
  }
}
