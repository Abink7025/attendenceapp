import 'package:attendenceapp/services/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginService{

 final _firebaseloginservices = FirebaseAuthservices();

  Future<void> loginpage(
      String email, String password, BuildContext context) async {
    try {
      await _firebaseloginservices.login(email, password);
    } on FirebaseAuthException catch (e) {
    
      if (e.code == 'user-not-found') {
        throw 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        throw 'Wrong password provided for that user.';
      } else {
        throw 'somthing went wrong';
      }
    } catch (e) {
      rethrow;
    }
  }
}


