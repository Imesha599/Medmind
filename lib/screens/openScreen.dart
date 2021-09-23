import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class OpenScreen extends StatefulWidget {
  @override
  _OpenScreenState createState() => _OpenScreenState();
}

class _OpenScreenState extends State<OpenScreen> {
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('Allow Notification'),
                  content: Text('Our app will send you notifications'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Don\'t allow',
                          style: TextStyle(fontSize: 18.0),
                        )),
                    TextButton(
                        onPressed: () => AwesomeNotifications()
                            .requestPermissionToSendNotifications()
                            .then((_) => Navigator.pop(context)),
                        child: Text(
                          'Allow',
                          style: TextStyle(fontSize: 18.0),
                        )),
                  ],
                ));
        // Insert here your friendly dialog box before call the request method
        // This is very important to not harm the user experience

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final logo = Image.asset(
      'assets/logo.png',
      height: mq.size.height / 4,
    );
    final medmind = Image.asset('assets/medmind.jpeg');
    final logoGroup = Column(
      children: [
        medmind,
        logo,
      ],
    );
    final login = Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          padding: EdgeInsets.fromLTRB(10.0, 15.0, 18.0, 15.0),
          minWidth: mq.size.width / 1.2,
          child: Text(
            'Login',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
        ));

    final signup = Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: () {
            Navigator.pushNamed(context, '/signup');
          },
          padding: EdgeInsets.fromLTRB(10.0, 15.0, 18.0, 15.0),
          minWidth: mq.size.width / 1.2,
          child: Text(
            'Sign up',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
        ));

    final buttons = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        login,
        SizedBox(
          height: mq.size.height / 20,
        ),
        signup,
      ],
    );
    return Scaffold(
      backgroundColor: Color(0xff1081EE),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            logoGroup,
            buttons,
          ],
        ),
      ),
    );
  }
}
