import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_navigation_web/models/userModels.dart';
import 'package:url_navigation_web/user/signin.dart';
import 'package:url_navigation_web/user/userProfile.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    return Container(
        color: Colors.blue[400],
        child: user == null ? SignIn() : UserProfilePage());
  }
}
