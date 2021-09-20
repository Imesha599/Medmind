import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medmind/screens/homeScreen.dart';
import 'package:medmind/screens/loginScreen.dart';
import 'package:medmind/screens/openScreen.dart';
import 'package:medmind/screens/settings.dart';
import 'package:medmind/screens/signupScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => OpenScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/home': (context) => HomeScreen(),
        '/settings': (context) => Settings(),
      },
    );
  }
}
