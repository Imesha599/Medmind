import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medmind/services/curd.dart';
import 'package:medmind/services/notifications.dart';

class IllnessTab extends StatefulWidget {
  @override
  _IllnessTabState createState() => _IllnessTabState();
}

class _IllnessTabState extends State<IllnessTab> {
  Curd db = Curd();
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('Illness')
      .where('user_id', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Builder(builder: (context) {
      return StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(children: [
                    ListTile(
                      leading: Icon(
                        Icons.medical_services,
                        color: Colors.red[600],
                        size: 20.0,
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            document['illness_name'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          TextButton.icon(
                              onPressed: () {
                                FirebaseFirestore.instance
                                    .collection('Illness')
                                    .doc(document.id)
                                    .delete()
                                    .then((value) => print("User Deleted"))
                                    .catchError((error) =>
                                        print("Failed to delete user: $error"));
                              },
                              icon: Icon(Icons.delete),
                              label: Text('')),
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          Icon(Icons.alarm),
                          SizedBox(
                            width: mq.size.width / 35,
                          ),
                          Text(
                            'Dose reminder set at :',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              document['morning'],
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              document['noon'],
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              document['night'],
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        )),
                  ]));
            }).toList(),
          );
        },
      );
    });
  }
}
