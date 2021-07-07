import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: UserInfo(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.navigation_outlined),
          onPressed: () => Navigator.pushNamed(context, 'other')),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
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
            title: Text('Name: '),
          ),
          ListTile(
            title: Text('Age: '),
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
