import 'package:flutter/material.dart';
import 'package:medmind/services/notifications.dart';

class IllnessTab extends StatefulWidget {
  @override
  _IllnessTabState createState() => _IllnessTabState();
}

class _IllnessTabState extends State<IllnessTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: FloatingActionButton(
                  child: Icon(Icons.add),
                  backgroundColor: Color(0xff1081EE),
                  onPressed: () {
                    Navigator.pushNamed(context, '/addillness');
                  })),
          Switch(value: false, onChanged: (bool s) {})
        ],
      ),
    );
  }
}
