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

  @override
  Widget build(BuildContext context) {
    User? _user = FirebaseAuth.instance.currentUser;
    print(_user);
    final mq = MediaQuery.of(context);
    final notify = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(
          'assets/cancel_bell.png',
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
        'Emergency',
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
              "Illness",
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

    final dialog = AlertDialog(
      title: Text('Reset settings?'),
      content:
          Text('This will reset your device to its default factory settings.'),
      actions: [
        ElevatedButton(
          //textColor: Color(0xFF6200EE),
          onPressed: () {},
          child: Text('CANCEL'),
        ),
        ElevatedButton(
          //textColor: Color(0xFF6200EE),
          onPressed: () {},
          child: Text('ACCEPT'),
        ),
      ],
    );

    final subcription = TextButton(
      onPressed: () {
        //cancelScheduledNotifications();
        //Navigator.pushNamed(context, '/');
        //return dialog;
        //_auth.signout();
        //Navigator.pushNamed(context, '/login');
      },
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/diamond.png',
              height: mq.size.height / 16,
            ),
            Text(
              "Premium",
              style: TextStyle(fontSize: 15.0),
            ),
            Text(
              "Subscription",
              style: TextStyle(fontSize: 15.0),
            ),
            //Icon(Icons., size: 30),
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

    final sub = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        subcription,
      ],
    );

    /*final buttons = Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            settings,
            addillness,
          ],
        ),
        SizedBox(
          height: mq.size.height / 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            subcription,
            logout,
          ],
        )
      ],
    );*/

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
              SizedBox(
                height: mq.size.height / 20,
              ),
              sub,
            ],
          )),
    );
  }
}
