import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:mapas/screen/signup.dart';
import 'package:mapas/screen/menu.dart';
import 'package:mapas/back/firebase.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Future<bool> login() async {
    Firebase firebase = new Firebase();
    return firebase.logInUser(emailController.text, passwordController.text);
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
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Text(
                                'Log In ',
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
                                return 'we need your pw as well!!!';
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
                          GestureDetector(
                            onTap: () async {
                              if (_formKey.currentState.validate()) {
                                try {
                                  login().then(
                                    (value) => {
                                      if (value)
                                        {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  'welcome back to mapas!!'),
                                            ),
                                          ),
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Menu()),
                                          ),
                                        }
                                      else
                                        {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text('login failed'),
                                            ),
                                          ),
                                        },
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
                                  'log in',
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
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignUpScreen()),
                                          ).then(
                                            (value) => {
                                              if (value)
                                                {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                          'account successfully created, welcome to mapas!!'),
                                                    ),
                                                  ),
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Menu()),
                                                  )
                                                }
                                              else
                                                {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                          'register failed, try again later'),
                                                    ),
                                                  ),
                                                }
                                            },
                                          );
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
