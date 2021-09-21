import 'package:flutter/material.dart';

class FrequentIllnessTab extends StatefulWidget {
  @override
  _FrequentIllnessTabState createState() => _FrequentIllnessTabState();
}

class _FrequentIllnessTabState extends State<FrequentIllnessTab> {
  @override
  Widget build(BuildContext context) {
    final floatbutton = Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Color(0xff1081EE),
            onPressed: () {
              print('hi');
            }));
    return Container(
      child: Column(
        children: [floatbutton],
      ),
    );
  }
}
