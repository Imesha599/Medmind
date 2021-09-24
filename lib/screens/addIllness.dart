import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medmind/services/curd.dart';
import 'package:medmind/services/notifications.dart';

class AddIllness extends StatefulWidget {
  @override
  _AddIllnessState createState() => _AddIllnessState();
}

class _AddIllnessState extends State<AddIllness> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _emailcontroller = TextEditingController();

  var children;
  Future<DateTime?> _selectDate() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now()
          .subtract(Duration(seconds: Duration.secondsPerDay * 365 * 5)),
      lastDate:
          (DateTime.now().add(Duration(hours: Duration.hoursPerDay * 365 * 5))),
      helpText: 'Select a date',
    );
    if (newDate != null) {
      return newDate;
    }
  }

  Future<TimeOfDay?> _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 7, minute: 15),
    );
    if (newTime != null) {
      print(newTime);
      return newTime;
    }
  }

  bool stmorning = false;
  bool stnoon = false;
  bool stnight = false;
  Widget clockm = Text('');
  Widget clockn = Text('');
  Widget clockni = Text('');
  String? nightTime;
  String? morningTime;
  String? noonTime;
  Curd db = Curd();
  TextEditingController _illnesscontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    User? _user = FirebaseAuth.instance.currentUser;

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

    final field = TextFormField(
      controller: _illnesscontroller,
      decoration: InputDecoration(
        labelText: 'Illness',
        labelStyle: TextStyle(
          color: Color(0xFF6200EE),
        ),
        suffixIcon: Icon(
          Icons.check_circle,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF6200EE)),
        ),
      ),
    );

    final date = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Special Reinder',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: mq.size.width / 4,
        ),
        TextButton.icon(
          onPressed: () {
            _selectDate().then((value) {
              if (value != null)
                print('Date is ${value.year}-${value.month}-${value.day}');
            });
          },
          icon: Icon(
            Icons.calendar_today_outlined,
            size: 18,
            color: Colors.red,
          ),
          label: Text(""),
        ),
      ],
    );

    final divider = Column(
      children: [
        Divider(
          height: mq.size.height / 17,
          color: Colors.blue[700],
          thickness: 5.0,
        ),
        Text(
          'Shedule',
          style: TextStyle(fontSize: 25.0, color: Colors.blue[400]),
        ),
      ],
    );

    final time = Column(
      children: [
        Row(
          children: [
            Container(
              child: Text('Morning'),
              width: mq.size.width / 4,
            ),
            Switch(
              value: stmorning,
              onChanged: (state) => {
                setState(() => {
                      stmorning = state,
                      if (stmorning)
                        {
                          clockm = TextButton.icon(
                            onPressed: () {
                              _selectTime().then((value) {
                                setState(() {
                                  if (value != null) {
                                    morningTime =
                                        value.toString().substring(10, 15);
                                  } else
                                    morningTime = '';
                                });
                              });
                            },
                            icon: Icon(
                              Icons.add_alarm,
                              size: 40.0,
                            ),
                            label: Text(''),
                          ),
                        }
                      else
                        {
                          clockm = Text(''),
                          morningTime = '',
                        }
                    }),
                print(state)
              },
            ),
            clockm,
            Text('${morningTime}')
          ],
        ),
        Row(
          children: [
            Container(
              child: Text('After Noon'),
              width: mq.size.width / 4,
            ),
            Switch(
              value: stnoon,
              onChanged: (state) => {
                setState(() => {
                      stnoon = state,
                      if (stnoon)
                        {
                          clockn = TextButton.icon(
                            onPressed: () {
                              _selectTime().then((value) {
                                setState(() {
                                  if (value != null) {
                                    noonTime =
                                        value.toString().substring(10, 15);
                                  } else
                                    noonTime = '';
                                });
                              });
                            },
                            icon: Icon(
                              Icons.add_alarm,
                              size: 40.0,
                            ),
                            label: Text(''),
                          ),
                        }
                      else
                        {clockn = Text(''), noonTime = ''}
                    }),
                print(state)
              },
            ),
            clockn,
            Text('${noonTime}')
          ],
        ),
        Row(
          children: [
            Container(
              child: Text('Night'),
              width: mq.size.width / 4,
            ),
            Switch(
              value: stnight,
              onChanged: (state) => {
                setState(() => {
                      stnight = state,
                      if (stnight)
                        {
                          clockni = TextButton.icon(
                            onPressed: () {
                              _selectTime().then((value) {
                                setState(() {
                                  if (value != null) {
                                    nightTime =
                                        value.toString().substring(10, 15);
                                  } else
                                    nightTime = '';
                                });
                              });
                            },
                            icon: Icon(
                              Icons.add_alarm,
                              size: 40.0,
                            ),
                            label: Text(''),
                          ),
                        }
                      else
                        {
                          clockni = Text(''),
                          nightTime = '',
                        }
                    }),
                print(state)
              },
            ),
            clockni,
            Text('${nightTime}'),
          ],
        ),
      ],
    );

    final button = Row(
      children: [
        ElevatedButton(
          onPressed: () {
            db
                .addIllnessInfo(
                    user_id: _user!.uid,
                    ill_name: _illnesscontroller.text,
                    morning: morningTime,
                    noon: noonTime,
                    night: nightTime)
                .then((value) => {
                      show(
                          title: 'Illness Infomation Manager',
                          body: 'Successfully added your illness'),
                      Navigator.pushNamed(context, '/settings')
                    })
                .catchError((e) => print('error is:${e}'));
          },
          child: Text(
            'Ok',
            style: TextStyle(fontSize: 18.0),
          ),
        )
      ],
    );

    return Scaffold(
      appBar: topappbar,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: [
            field,
            date,
            divider,
            time,
            button,
          ],
        ),
      ),
    );
  }
}
