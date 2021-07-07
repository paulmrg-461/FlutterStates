import 'package:flutter/material.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OtherPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('SET USER')),
            ElevatedButton(onPressed: () {}, child: const Text('CHANGE AGE')),
            ElevatedButton(
                onPressed: () {}, child: const Text('ADD OCCUPATION')),
          ],
        ),
      ),
    );
  }
}
