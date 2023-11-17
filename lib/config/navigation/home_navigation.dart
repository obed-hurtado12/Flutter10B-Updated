import 'package:first_project_learningb/modules/home.dart';
import 'package:first_project_learningb/modules/login.dart';
import 'package:first_project_learningb/modules/welcome.dart';
import 'package:flutter/material.dart';

class HomeNavigation extends StatelessWidget {
  const HomeNavigation({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => const Home(),
        '/welcome': (context) => const Welcome(),
        '/login': (context) => Login()
      },
    );
  }
}
