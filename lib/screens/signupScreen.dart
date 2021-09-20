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

  TextEditingController _gurdian1namecontroller = TextEditingController();
  TextEditingController _gurdian1telephonecontroller = TextEditingController();
  TextEditingController _gurdian2namecontroller = TextEditingController();
  TextEditingController _gurdian2telephonecontroller = TextEditingController();
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final logo = Image.asset(
      'assets/logo.png',
      height: mq.size.height / 7,
    );
    final logogroup = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'Create Account',
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        logo,
      ],
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
          height: mq.size.height / 30,
        ),
        telephone,
        SizedBox(
          height: mq.size.height / 30,
        ),
        emailfield,
        SizedBox(
          height: mq.size.height / 30,
        ),
        passwordfield,
      ],
    );

    final gurdian1namefield = TextFormField(
      decoration: InputDecoration(
        hintText: 'John doe',
        hintStyle: TextStyle(color: Colors.grey[600]),
        labelText: 'Gurdian name - 1',
        labelStyle: TextStyle(color: Colors.black, fontSize: 23.0),
        //errorText: 'Ivalid Email',
        border: OutlineInputBorder(),
        suffixIcon: Icon(
          Icons.error,
        ),
      ),
    );

    final gurdian1telephonefield = TextFormField(
      decoration: InputDecoration(
        hintText: '077xxxxxxx',
        hintStyle: TextStyle(color: Colors.grey[600]),
        labelText: 'Gurdian Telephone - 1',
        labelStyle: TextStyle(color: Colors.black, fontSize: 23.0),
        //errorText: 'Ivalid Email',
        border: OutlineInputBorder(),
        suffixIcon: Icon(
          Icons.error,
        ),
      ),
    );

    final gurdian2namefield = TextFormField(
      decoration: InputDecoration(
        hintText: 'John doe',
        hintStyle: TextStyle(color: Colors.grey[600]),
        labelText: 'Gurdian name - 2',
        labelStyle: TextStyle(color: Colors.black, fontSize: 23.0),
        //errorText: 'Ivalid Email',
        border: OutlineInputBorder(),
        suffixIcon: Icon(
          Icons.error,
        ),
      ),
    );

    final gurdian2telephonefield = TextFormField(
      decoration: InputDecoration(
        hintText: '077xxxxxxx',
        hintStyle: TextStyle(color: Colors.grey[600]),
        labelText: 'Gurdian Telephone - 2',
        labelStyle: TextStyle(color: Colors.black, fontSize: 23.0),
        //errorText: 'Ivalid Email',
        border: OutlineInputBorder(),
        suffixIcon: Icon(
          Icons.error,
        ),
      ),
    );

    final gurdian1info = Column(
      children: [
        gurdian1namefield,
        SizedBox(
          height: mq.size.height / 30,
        ),
        gurdian1telephonefield
      ],
    );
    final gurdian2info = Column(
      children: [
        gurdian2namefield,
        SizedBox(
          height: mq.size.height / 30,
        ),
        gurdian2telephonefield
      ],
    );
    final adduser = Column(
      children: [
        gurdian1info,
        Divider(
          height: mq.size.height / 20,
        ),
        gurdian2info,
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

    final step = Stepper(
      currentStep: _index,
      onStepCancel: () {
        if (_index > 0) {
          setState(() {
            _index -= 1;
          });
        }
      },
      onStepContinue: () {
        if (_index <= 0) {
          setState(() {
            _index += 1;
          });
        }
      },
      onStepTapped: (int index) {
        setState(() {
          _index = index;
        });
      },
      steps: <Step>[
        Step(
            title: const Text('Add User Infomation'),
            content: Container(
              alignment: Alignment.centerLeft,
              child: fields,
            )),
        Step(
            title: Text('Add Gurdian Infomation'),
            content: Container(
              alignment: Alignment.centerLeft,
              child: adduser,
            )),
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
              logogroup,
              SizedBox(height: mq.size.height / 25),
              //fields,
              //SizedBox(height: mq.size.height / 32),
              step,
              SizedBox(height: mq.size.height / 15),
              //adduser,
              //SizedBox(height: mq.size.height / 15),

              buttons
            ],
          ),
        ),
      ),
    );
  }
}
