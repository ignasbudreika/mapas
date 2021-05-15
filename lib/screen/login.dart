import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:mapas/screen/signup.dart';
import 'package:mapas/screen/menu.dart';

class LogInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white, //Color.fromRGBO(34, 38, 76, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(60.0, 130, 60.0, 0.0),
              child: Text(
                "Log in",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.black, //Color.fromRGBO(255, 255, 255, 1),
                  //Color.fromRGBO(179, 83, 113, 1)
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(60.0, 60, 60.0, 0.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Username',
                  hintStyle: TextStyle(
                    color: Colors.black, //Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(60.0, 20, 60.0, 0.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    color: Colors.black, //Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(60.0, 30, 60.0, 0.0),
              child: ButtonTheme(
                minWidth: 115.0,
                height: 45.0,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    //borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: Colors.grey, //Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Menu()),
                  ),
                  color: Colors.grey, //Color.fromRGBO(255, 255, 255, 1),
                  child: Text(
                    "Log In",
                    style: TextStyle(
                      color: Colors.black, //Color.fromRGBO(0, 0, 52, 1),
                    ),
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
                      text: 'Don\'t have an account? ',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()),
                          ).then(
                            (value) => {
                              if (value)
                                {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'account successfully created, welcome to mapas!!'),
                                    ),
                                  ),
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Menu()),
                                  )
                                }
                              else
                                {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'register failed, try again later'),
                                    ),
                                  ),
                                }
                            },
                          );
                        },
                    ),
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
