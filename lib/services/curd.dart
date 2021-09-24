import 'package:cloud_firestore/cloud_firestore.dart';

class Curd {
  CollectionReference user = FirebaseFirestore.instance.collection('Users');

  Future<bool> addUser(
      {String name = '',
      String email = '',
      String telephone = '',
      String g1Name = '',
      String g1Tele = '',
      String g2Name = '',
      String g2Tele = ''}) async {
    try {
      await user.add({
        'name': name,
        'email': email,
        'telephone': telephone,
        'Gurdians': {
          'g1name': g1Name,
          'g1tele': g1Tele,
          'g2name': g2Name,
          'g2tele': g2Tele
        }
      });
      return true;
    } catch (e) {
      print('eroor is: ${e}');
      return false;
    }
  }
}
