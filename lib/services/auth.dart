import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_navigation_web/models/userModels.dart';
import 'package:url_navigation_web/services/database.dart';

class AuthService with ChangeNotifier {
  final _auth = FirebaseAuth.instance;

  // create user object based on firebase user
  UserModel _userFromFirebaseUser(User user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  // auth chnage user stream

  Stream<UserModel> get user {
    return _auth.authStateChanges().map((User user) {
      return _userFromFirebaseUser(user);
    });
  }

  // Sign in Anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print("ERROR ===== ${e.toString()}");
      return null;
    }
  }

  // Sign in email and password
  Future signInWithEmailAndPassword({String email, String password}) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print("ERROR ===== ${e.toString()}");
      return null;
    }
  }

  // register email and password
  Future registerWithEmailAndPassword(
      {String email, String password, String phoneNo, String name}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

      // create user in db
      await DatabaseService(uid: user.uid).updateUserData(
        email: email,
        phoneNo: phoneNo,
        name: name,
      );

      return _userFromFirebaseUser(user);
    } catch (e) {
      print("ERROR ===== ${e.toString()}");
      return null;
    }
  }

  // Signout
  Future signOutUser() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print("ERROR ===== ${e.toString()}");
      return null;
    }
  }
}
