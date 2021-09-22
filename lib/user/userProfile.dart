import 'package:flutter/material.dart';
import 'package:url_navigation_web/services/auth.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<UserProfilePage> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Container(
        padding: EdgeInsets.all(50),
        child: ElevatedButton(
          onPressed: () async {
            await _authService.signOutUser();
          },
          child: Text("Sign Out"),
        ),
      ),
    );
  }
}
