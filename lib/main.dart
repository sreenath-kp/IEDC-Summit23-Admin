import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:summit_admin_app/screens/scanner_screen.dart';
import 'firebase_options.dart';
import 'package:summit_admin_app/screens/home_screen.dart';
import 'package:summit_admin_app/theme/pallete.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Pallete.darkModeAppTheme,
      initialRoute: '/',
      //sample routes
      //TODO: Replace later
      routes: {
        '/': (context) => const HomeScreen(),
        '/scanner': (context) => const ScannerScreen(),
      },
    );
  }
}
