import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_navigation_web/constants/loading.dart';
import 'package:url_navigation_web/models/userModels.dart';
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
    final userModel = Provider.of<UserModel>(context);
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(userModel.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var userData = snapshot.data;
            return Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                padding: EdgeInsets.all(50),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Welcome, ${userData['name']}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        ElevatedButton.icon(
                          icon: Icon(Icons.logout_outlined),
                          onPressed: () async {
                            await _authService.signOutUser();
                          },
                          label: Text("Logout"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
