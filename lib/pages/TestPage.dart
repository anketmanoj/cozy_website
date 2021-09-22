import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  final String id;

  const TestPage({Key key, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      child: Center(
          child: Text(
        'test Page ... :D --- ${this.id} ',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
      )),
    );
  }
}
