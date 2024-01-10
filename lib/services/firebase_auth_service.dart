import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthservices {
  final firebaseauth = FirebaseAuth.instance;

  Future<void> login(String email, String password) async {
    try {
      await firebaseauth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }
}
