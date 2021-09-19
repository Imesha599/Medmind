import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _usernamecontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _telephonecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final logo = Image.asset(
      'assets/logo.png',
      height: mq.size.height / 5,
    );
    final usernamefield = TextFormField(
      decoration: InputDecoration(
        hintText: 'John doe',
        hintStyle: TextStyle(color: Colors.grey[600]),
        labelText: 'User name',
        labelStyle: TextStyle(color: Colors.black, fontSize: 23.0),
        //errorText: 'Ivalid Email',
        border: OutlineInputBorder(),
        suffixIcon: Icon(
          Icons.error,
        ),
      ),
    );

    final emailfield = TextFormField(
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

    final telephone = TextFormField(
      controller: _telephonecontroller,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.grey[600]),
        labelText: 'Mobile no.',
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
        usernamefield,
        SizedBox(
          height: mq.size.height / 28,
        ),
        telephone,
        SizedBox(
          height: mq.size.height / 28,
        ),
        emailfield,
        SizedBox(
          height: mq.size.height / 28,
        ),
        passwordfield,
      ],
    );

    final signup = Material(
        color: Color(0xff5A9DFF),
        borderRadius: BorderRadius.circular(25.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          padding: EdgeInsets.fromLTRB(10.0, 15.0, 18.0, 15.0),
          minWidth: mq.size.width / 1.2,
          child: Text(
            'sign up',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25.0),
          ),
        ));
    final login = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('Already member?'),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          child: Text('Login'),
        )
      ],
    );
    final buttons = Column(
      children: [
        signup,
        login,
      ],
    );
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              logo,
              SizedBox(height: mq.size.height / 15),
              fields,
              SizedBox(height: mq.size.height / 15),
              buttons
            ],
          ),
        ),
      ),
    );
  }
}
