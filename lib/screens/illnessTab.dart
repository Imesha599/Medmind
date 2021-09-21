import 'package:flutter/material.dart';

class IllnessTab extends StatefulWidget {
  @override
  _IllnessTabState createState() => _IllnessTabState();
}

class _IllnessTabState extends State<IllnessTab> {
  final floatbutton = Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Color(0xff1081EE),
          onPressed: () {
            print('hi');
          }));
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //
          floatbutton
        ],
      ),
    );
  }
}
