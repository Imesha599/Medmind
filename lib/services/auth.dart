import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Auth {
  User? _user = FirebaseAuth.instance.currentUser;
  void signup({String email = '', String password = ''}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

  Future<bool> signin({String email = '', String password = ''}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print('success');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  signout() async {
    try {
      await FirebaseAuth.instance.signOut();
      print('logged out');
    } catch (e) {
      print(e);
    }
  }
}
