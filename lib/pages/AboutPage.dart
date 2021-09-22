import 'package:flutter/material.dart';

class About extends StatelessWidget {
  final String name;

  const About(this.name);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: Center(
          child: Column(
            children: [
              Text(
                'About Page ... :D and here is the Parameter passed.... $name',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/test/123456789');
                },
                child: Text("Next"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// only in this page i have added the name parameter to check the second paramter that is passed.....