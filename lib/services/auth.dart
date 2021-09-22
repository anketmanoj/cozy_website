import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_navigation_web/models/userModels.dart';

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

  // register email and password

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
