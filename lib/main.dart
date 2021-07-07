import 'package:flutter/material.dart';
import 'package:states/pages/home_page.dart';
import 'package:states/pages/other_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {'home': (_) => HomePage(), 'other': (_) => OtherPage()},
    );
  }
}
