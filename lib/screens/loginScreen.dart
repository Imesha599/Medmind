import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medmind/services/auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('build');
    Auth _auth = Auth();
    User? _user = FirebaseAuth.instance.currentUser;
    final mq = MediaQuery.of(context);
    final logo = Image.asset(
      'assets/logo.png',
      height: mq.size.height / 4,
    );
    final emailfield = TextFormField(
      controller: _emailcontroller,
      decoration: InputDecoration(
        hintText: 'something@example.com',
        hintStyle: TextStyle(color: Colors.grey[600]),
        labelText: 'Email',
        labelStyle: TextStyle(color: Colors.black, fontSize: 23.0),
        //errorText: 'Ivalid Email',
        border: OutlineInputBorder(),
        suffixIcon: Icon(
          Icons.error,
        ),
      ),
    );

    final passwordfield = TextFormField(
      controller: _passwordcontroller,
      decoration: InputDecoration(
        //hintText: 'something@example.com',
        hintStyle: TextStyle(color: Colors.grey[600]),
        labelText: 'Password',
        labelStyle: TextStyle(color: Colors.black, fontSize: 23.0),
        //errorText: 'Ivalid Email',
        border: OutlineInputBorder(),
        suffixIcon: Icon(
          Icons.error,
        ),
      ),
    );
    final fields = Column(
      children: [
        emailfield,
        SizedBox(
          height: mq.size.height / 21,
        ),
        passwordfield
      ],
    );

    final login = Material(
        color: Color(0xff5A9DFF),
        borderRadius: BorderRadius.circular(25.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: () async {
            //Navigator.pushNamed(context, '/home');
            await _auth.signin(
                email: _emailcontroller.text,
                password: _passwordcontroller.text);
            if (FirebaseAuth.instance.currentUser != null) {
              Navigator.pushNamed(context, '/home');
            } else {
              setState(() {
                _passwordcontroller.text = '';
              });
            }
          },
          padding: EdgeInsets.fromLTRB(10.0, 15.0, 18.0, 15.0),
          minWidth: mq.size.width / 1.2,
          child: Text(
            'Login',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25.0),
          ),
        ));
    final signup = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('Not a member ?'),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/signup');
          },
          child: Text('Sign up'),
        )
      ],
    );
    final buttons = Column(
      children: [
        login,
        signup,
      ],
    );
    return Scaffold(
      backgroundColor: Color(0xffE7F0FF),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              logo,
              SizedBox(height: mq.size.height / 10),
              fields,
              SizedBox(height: mq.size.height / 10),
              buttons
            ],
          ),
        ),
      ),
    );
  }
}
