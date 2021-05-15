import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mapas/back/firebase.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
  }

  Future<bool> register() async {
    Firebase firebase = new Firebase();
    return firebase.signUpUser(emailController.text, passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(
            left: 32,
            right: 32,
          ),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - 70,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: (MediaQuery.of(context).size.height - 70) * 0.25,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                              size: 25.0,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Text(
                                'Register ',
                                style: TextStyle(
                                    fontSize: 50.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '.',
                                style: TextStyle(
                                    fontSize: 50.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[400]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height - 70) * 0.75,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          TextFormField(
                            controller: emailController,
                            maxLength: 25,
                            cursorColor: Colors.black,
                            validator: (String value) {
                              if (value == null || value.isEmpty) {
                                return 'please enter email address!!!';
                              }
                              if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return 'please enter a valid Email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'put your email here',
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: passwordController,
                            maxLength: 50,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'cmon enter your pw!!!';
                              }
                              if (value.length < 6) {
                                return 'password must contain at least 6 characters';
                              }
                              return null;
                            },
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              labelText: 'password',
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: passwordConfirmationController,
                            maxLength: 50,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'repeat your pw!!!';
                              }
                              if (passwordController.text !=
                                  passwordConfirmationController.text) {
                                return "passwords do not match";
                              }
                              return null;
                            },
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              labelText: 'confirm password',
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (_formKey.currentState.validate()) {
                                try {
                                  register().then(
                                    (value) {
                                      if (value) {
                                        Navigator.pop(context, true);
                                      } else {
                                        Navigator.pop(context, false);
                                      }
                                    },
                                  );
                                } catch (e) {
                                  Navigator.pop(context, false);
                                }
                              }
                            },
                            child: Container(
                              height: 35.0,
                              width: 120.0,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey[800],
                              ),
                              child: Center(
                                child: Text(
                                  'sign up',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontSize: 15.0),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(60.0, 40, 40.0, 0.0),
                            child: MaterialButton(
                              onPressed: () {},
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: 'Already have an account? ',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.pop(context);
                                        }),
                                  TextSpan(
                                    text: 'Log In',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ]),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
