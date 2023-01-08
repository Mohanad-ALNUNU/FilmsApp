import 'package:flutter/material.dart';
import 'package:revesion_app/view/home.dart';
import 'package:revesion_app/view/screenHolder.dart';
import 'package:revesion_app/view/siqnup.dart';

class AppProxy extends StatelessWidget {
  const AppProxy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => SignIn(),
        '/home':(context) => ScreenHolder(),
        // '/': (context) => ScreenHolder(),
      },
    );
  }
}