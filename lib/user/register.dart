import 'package:flutter/material.dart';
import 'package:url_navigation_web/constants/loading.dart';
import 'package:url_navigation_web/models/userModels.dart';
import 'package:url_navigation_web/services/auth.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<Register> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneNoController = TextEditingController();
  bool _passwordVisible = true;
  String error = "";
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return _loading
        ? Loading()
        : Scaffold(
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
                                  height: 30,
                                ),
                                Text(
                                  "Welcome to Cozy Homes Rental. Sign up and take the first steps to you incredible vacation!",
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
                                      return "Please enter your name";
                                    }
                                  },
                                  controller: _nameController,
                                  decoration: formDecoration(
                                    hintName: "Enter Your Name",
                                    icon: Icons.person,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value.toString().length >= 1) {
                                      return null;
                                    } else {
                                      return "Please enter your phone number";
                                    }
                                  },
                                  keyboardType: TextInputType.phone,
                                  controller: _phoneNoController,
                                  decoration: formDecoration(
                                    hintName: "Enter Your Mobile Number",
                                    icon: Icons.phone_outlined,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
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
                                              _passwordVisible =
                                                  !_passwordVisible;
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
                                          if (_formKey.currentState
                                              .validate()) {
                                            setState(() {
                                              _loading = true;
                                            });
                                            dynamic result = _authService
                                                .registerWithEmailAndPassword(
                                              email: _emailController.text
                                                  .toString(),
                                              password: _passwordController.text
                                                  .toString(),
                                              name: _nameController.text
                                                  .toString(),
                                              phoneNo: _phoneNoController.text
                                                  .toString(),
                                            );
                                            if (result == null) {
                                              setState(() {
                                                _loading = false;
                                                error =
                                                    "Unable to create account";
                                              });
                                            } else {
                                              setState(() {
                                                _loading = false;
                                              });
                                              Navigator.pushNamed(
                                                  context, '/main/profile');
                                            }
                                          }
                                        },
                                        icon: Icon(Icons.login_outlined),
                                        label: Text("Register"),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Already have an account? Click the link below to login",
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
                                  onPressed: () => Navigator.pushNamed(
                                      context, '/main/profile'),
                                  child: Text("Sign In"),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Divider(),
                                Text(
                                  error,
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 16),
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
