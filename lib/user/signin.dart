import 'package:flutter/material.dart';
import 'package:url_navigation_web/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: size.height,
                width: size.width,
                child: Image.asset(
                  'assets/hotelRoom.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: size.height,
                width: size.width,
                padding: EdgeInsets.all(60),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            child: Image.asset(
                              'assets/cozy_logo.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            "Welcome to Cozy Homes Rental. Sign In and take the first steps to you incredible vacation!",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value.toString().length >= 1) {
                                return null;
                              } else {
                                return "Please enter a valid email";
                              }
                            },
                            controller: _emailController,
                            decoration: formDecoration(
                              hintName: "Enter Your Email",
                              icon: Icons.email_outlined,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            obscureText: _passwordVisible,
                            validator: (value) {
                              if (value.toString().length >= 6) {
                                return null;
                              } else {
                                return "Password must be at least 6 Characters long";
                              }
                            },
                            controller: _passwordController,
                            decoration: formDecoration(
                              hintName: "Enter Your Password",
                              icon: Icons.password_outlined,
                            ).copyWith(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                    icon: Icon(_passwordVisible
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined))),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: () async {
                                    // _submitForm();
                                  },
                                  icon: Icon(Icons.login_outlined),
                                  label: Text("Login"),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Are you a new user? Click the link below to register now!",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text("Sign Up"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration formDecoration({String hintName, IconData icon}) {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(5.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(5.5),
      ),
      prefixIcon: Icon(
        icon,
        color: Colors.blue,
      ),
      hintText: hintName,
      hintStyle: TextStyle(color: Colors.blue),
      filled: true,
      fillColor: Colors.blue[50],
    );
  }
}
