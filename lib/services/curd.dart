import 'package:cloud_firestore/cloud_firestore.dart';

class Curd {
  CollectionReference user = FirebaseFirestore.instance.collection('Users');
  CollectionReference ill = FirebaseFirestore.instance.collection('Illness');

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

  Future<bool> addIllnessInfo(
      {required String user_id,
      required String ill_name,
      String? morning,
      String? noon,
      String? night}) async {
    try {
      await ill.add({
        'user_id': user_id,
        'illness_name': ill_name,
        'morning': morning,
        'noon': noon,
        'night': night
      });
      return true;
    } catch (e) {
      print('error is: ${e}');
      return false;
    }
  }

  Future<void> getData() async {
    FirebaseFirestore.instance
        .collection('Illness')
        .get()
        .then((values) => {print(values.toString())});
  }
}
