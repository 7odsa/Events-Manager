import 'package:events_manager/models/user_dm.dart';
import 'package:events_manager/services/firestore_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  static Future<bool> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      var credintial = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      addNewUser(
        user: UserDM(
          id: credintial.user!.uid,
          email: email,
          name: name,
          favoriteEvents: [],
        ),
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
      return false;
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
      return false;
    }

    return true;
  }

  static Future<bool> signin({
    required String email,
    required String password,
  }) async {
    try {
      var credintial = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // TODO get the user from fireStore Using his password from the credintial and then store it in the User.currentUser
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
      return false;
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
      return false;
    }

    // TODO save the user in the shared pref and navigate to home Page
    return true;
  }

  // TODO: signout
  static Future<bool> logOut() async {
    return false;
  }
}
