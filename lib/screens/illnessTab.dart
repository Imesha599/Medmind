import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medmind/services/curd.dart';
import 'package:medmind/services/notifications.dart';

class IllnessTab extends StatefulWidget {
  @override
  _IllnessTabState createState() => _IllnessTabState();
}

class _IllnessTabState extends State<IllnessTab> {
  Curd db = Curd();
  @override
  Widget build(BuildContext context) {
    CollectionReference ill = FirebaseFirestore.instance.collection('Illness');
    CollectionReference user = FirebaseFirestore.instance.collection('Users');
    return SingleChildScrollView(
      padding: EdgeInsets.all(30.0),
      child: Column(
        children: [
          Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.arrow_drop_down_circle),
                    title: const Text('Card title 1'),
                    subtitle: Text(
                      'Secondary Text',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                ],
              )),
          Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.arrow_drop_down_circle),
                    title: const Text('Card title 1'),
                    subtitle: Text(
                      'Secondary Text',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                ],
              )),
          Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.arrow_drop_down_circle),
                    title: const Text('Card title 1'),
                    subtitle: Text(
                      'Secondary Text',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                ],
              )),
          Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.arrow_drop_down_circle),
                    title: const Text('Card title 1'),
                    subtitle: Text(
                      'Secondary Text',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                ],
              )),
          Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.arrow_drop_down_circle),
                    title: const Text('Card title 1'),
                    subtitle: Text(
                      'Secondary Text',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                ],
              )),
          Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.arrow_drop_down_circle),
                    title: const Text('Card title 1'),
                    subtitle: Text(
                      'Secondary Text',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                ],
              )),
          Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.arrow_drop_down_circle),
                    title: const Text('Card title 1'),
                    subtitle: Text(
                      'Secondary Text',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                ],
              )),
          Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.arrow_drop_down_circle),
                    title: const Text('Card title 1'),
                    subtitle: Text(
                      'Secondary Text',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                ],
              )),
          Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.arrow_drop_down_circle),
                    title: const Text('Card title 1'),
                    subtitle: Text(
                      'Secondary Text',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                ],
              )),
          Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.arrow_drop_down_circle),
                    title: const Text('Card title 1'),
                    subtitle: Text(
                      'Secondary Text',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                ],
              )),
          FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Color(0xff1081EE),
              onPressed: () async {
                await db.getData();
                Navigator.pushNamed(context, '/addillness');
              }),
        ],
      ),
    );
  }
}
