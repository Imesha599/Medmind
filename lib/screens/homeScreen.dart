import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medmind/services/auth.dart';
import 'package:medmind/services/notifications.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Auth _auth = Auth();
  User? _user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final notify = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(
          'assets/bell.png',
          height: mq.size.height / 20,
        ),
      ],
    );
    final topappbar = AppBar(
        backgroundColor: Color(0xff1081EE),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Med Mind",
              style: TextStyle(fontSize: 34.0),
            ),
            SizedBox(
              width: mq.size.width / 20,
            ),
            Image.asset(
              'assets/logo.png',
              height: mq.size.height / 12,
            )
          ],
        ));
    final circlebutton = ElevatedButton(
      onPressed: () {
        show(title: 'Emergancy Alart', body: 'Your request has been sent');
      },
      child: Text(
        'Emergancy',
        style: TextStyle(fontSize: 28.0),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(CircleBorder()),
        padding: MaterialStateProperty.all(EdgeInsets.all(70)),
        backgroundColor:
            MaterialStateProperty.all(Colors.red[700]), // <-- Button color
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed))
            return Colors.red; // <-- Splash color
        }),
      ),
    );

    final settings = ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/settings');
      },
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.settings, size: 30),
            Text(
              "Settings",
              style: TextStyle(fontSize: 15.0),
            ),
          ],
        ),
      ),
    );

    final addillness = ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/addillness');
      },
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, size: 30),
            Text(
              "Add Illness",
              style: TextStyle(fontSize: 15.0),
            ),
          ],
        ),
      ),
    );

    final logout = ElevatedButton(
      onPressed: () {
        //cancelScheduledNotifications();
        //Navigator.pushNamed(context, '/');
        _auth.signout();
        Navigator.pushNamed(context, '/login');
      },
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout, size: 30),
            Text(
              "Logout",
              style: TextStyle(fontSize: 15.0),
            ),
          ],
        ),
      ),
    );
    final buttons = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        settings,
        addillness,
        logout,
      ],
    );
    return Scaffold(
      backgroundColor: Color(0xffA3D9FF),
      appBar: topappbar,
      body: Container(
          padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 30.0),
          child: Column(
            children: [
              notify,
              SizedBox(
                height: mq.size.height / 6,
              ),
              circlebutton,
              SizedBox(
                height: mq.size.height / 10,
              ),
              buttons,
            ],
          )),
    );
  }
}
