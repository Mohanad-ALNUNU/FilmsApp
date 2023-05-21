import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:films_app/view/root_screen.dart';
import 'package:films_app/view/sign_screen/siqnup.dart';

class FilmsApp extends StatelessWidget {
  const FilmsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SignIn(),
        '/home': (context) => RootScreen(),
      },
    );
  }
}
