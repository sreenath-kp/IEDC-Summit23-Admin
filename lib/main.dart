import 'package:flutter/material.dart';
import 'package:summit_admin_app/screens/home_screen.dart';
import 'package:summit_admin_app/theme/pallete.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Pallete.darkModeAppTheme,
      home: const HomeScreen(),
    );
  }
}
