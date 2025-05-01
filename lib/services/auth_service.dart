import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  static Future<void> signup({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      String msg = 'Error';
      if (e.code == 'weak-password') {
        msg = "The Password Provided is too weak";
      } else if (e.code == 'email_already_in_use') {
        msg = "an Account already exist";
      } else if (e.code == 'invalid-email') {
        msg = "Invalid Email";
      } else if (e.code == 'network-request-failed') {
        msg = "No Internet to Signup";
      }

      print("error12312 :  " + msg);

      Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 14,
      );
      // SnackBar(content: Text(msg), duration: Duration(seconds: 2));
    } catch (e) {
      print("error :  " + e.toString());
      Fluttertoast.showToast(
        msg: "An Error Occured Please Try Again Later",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 14,
      );
    }

    // TODO save the user in the shared pref and navigate to home Page
  }

  static Future<void> signin({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      String msg = 'Error';
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        msg = "No User Found";
      } else if (e.code == 'invalid-email') {
        msg = "Invalid Email";
      } else if (e.code == 'network-request-failed') {
        msg = "No Internet to Signup";
      }

      print("error12312 :  " + msg);

      Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 14,
      );
      // SnackBar(content: Text(msg), duration: Duration(seconds: 2));
    } catch (e) {
      print("error :  " + e.toString());
      Fluttertoast.showToast(
        msg: "An Error Occured Please Try Again Later",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 14,
      );
    }

    // TODO save the user in the shared pref and navigate to home Page
  }

  // TODO: signout
}
