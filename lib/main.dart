import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medmind/screens/addIllness.dart';
import 'package:medmind/screens/homeScreen.dart';
import 'package:medmind/screens/loginScreen.dart';
import 'package:medmind/screens/openScreen.dart';
import 'package:medmind/screens/settings.dart';
import 'package:medmind/screens/signupScreen.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void main() async {
  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      'resource://drawable/ic_stat_healthcare1',
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: Color(0xff00fe10),
          ledColor: Colors.white,
          locked: false,
          importance: NotificationImportance.Default,
        ),
        NotificationChannel(
          channelKey: 'scheduled_channel',
          channelName: 'scheduled notifications',
          channelDescription: 'Notification channel for scheduleding tests',
          defaultColor: Color(0xff00fe10),
          ledColor: Colors.white,
          locked: true,
          importance: NotificationImportance.High,
        ),
      ]);
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
        '/addillness': (context) => AddIllness(),
      },
    );
  }
}
