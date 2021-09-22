import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:url_navigation_web/controller/form_controller.dart';
import 'package:url_navigation_web/model/form.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _nameController = TextEditingController();
  final _phoneNoController = TextEditingController();
  final _emailController = TextEditingController();
  final _descriptionController = TextEditingController();

  // Method to Submit Feedback and save it in Google Sheets
  void _submitForm() {
    // Validate returns true if the form is valid, or false
    // otherwise.
    if (_formKey.currentState.validate()) {
      // If the form is valid, proceed.
      FeedbackForm feedbackForm = FeedbackForm(
          DateTime.now().toString(),
          _nameController.text.toString(),
          _emailController.text.toString(),
          _phoneNoController.text.toString(),
          _descriptionController.text.toString());

      FormController formController = FormController();

      CoolAlert.show(
              context: context,
              type: CoolAlertType.success,
              title: "Form Sent",
              text:
                  "Thank you for sharing your details with us. A Cozy Homes Rental Agent will contact you shortly")
          .then((value) {
        _nameController.clear();
        _phoneNoController.clear();
        _emailController.clear();
        _descriptionController.clear();
      });

      // Submit 'feedbackForm' and save it in Google Sheets.
      formController.submitForm(feedbackForm, (String response) {
        print("Response: $response");
        if (response == FormController.STATUS_SUCCESS) {
          // Feedback is saved succesfully in Google Sheets.
          // _showSnackbar("Feedback Submitted");
        } else {
          // Error Occurred while saving data in Google Sheets.
          _showSnackbar("Error Occurred!");
        }
      });
    } else {
      _showSnackbar("Please fill all the required details above");
    }
  }

  // Method to show snackbar with 'message'.
  _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

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
                            height: 20,
                          ),
                          AnimatedTextKit(
                            animatedTexts: [
                              TyperAnimatedText(
                                "Your Vacation, Our Pleasure",
                                textStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            "Housekeeping is still developing the website to ensure the best experience for you. In the mean time, please fill out the form below and a Cozy Homes Agent will contact you shortly",
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
                            maxLines: 6,
                            controller: _descriptionController,
                            decoration: formDecoration(
                              hintName:
                                  "Send us a message with your requirments (Optional)",
                              icon: Icons.description_outlined,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: () async {
                                    _submitForm();
                                  },
                                  icon: Icon(Icons.send_to_mobile),
                                  label: Text("Submit"),
                                ),
                              ),
                            ],
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
