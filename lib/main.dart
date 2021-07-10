import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states/pages/home_page.dart';
import 'package:states/pages/other_page.dart';
import 'package:states/services/user_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserService(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomePage(),
          'other': (_) => const OtherPage()
        },
      ),
    );
  }
}
