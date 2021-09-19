import 'package:flutter/material.dart';

class OpenScreen extends StatelessWidget {
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
