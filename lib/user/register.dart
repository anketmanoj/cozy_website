import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[400],
      child: Center(
          child: Text(
        'register page ... :D',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
      )),
    );
  }
}
