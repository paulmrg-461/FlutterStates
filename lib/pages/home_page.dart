import 'package:flutter/material.dart';
import 'package:states/models/user.dart';
import 'package:states/pages/services/user_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: StreamBuilder(
        stream: userService.userStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? UserInfo(
                  user: snapshot.data,
                )
              : Center(
                  child: Text('No user data'),
                );
        },
      ),
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
          Text(
            'General',
            style: TextStyle(fontSize: 18),
          ),
          Divider(),
          ListTile(
            title: Text('Name: ${user!.name!}'),
          ),
          ListTile(
            title: Text('Age: ${user!.age!}'),
          ),
          Text(
            'Occupations',
            style: TextStyle(fontSize: 18),
          ),
          Divider(),
          ListTile(
            title: Text('Occupation 1: '),
          ),
          ListTile(
            title: Text('Occupation 2: '),
          ),
          ListTile(
            title: Text('Occupation 3: '),
          ),
        ],
      ),
    );
  }
}
