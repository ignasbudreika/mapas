import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            resizeToAvoidBottomPadding: false,
            body: Container(
                color: Color.fromRGBO(
                    255, 255, 255, 1), //Color.fromRGBO(34, 38, 76, 1),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.fromLTRB(60.0, 130, 60.0, 0.0),
                          child: Text(
                            "HELLO THERE!",
                            style: TextStyle(
                                fontSize: 35,
                                color: Color.fromRGBO(0, 0, 0,
                                    1) //Color.fromRGBO(179, 83, 113, 1)
                                ),
                          )),
                      Container(
                        margin: EdgeInsets.fromLTRB(60.0, 60, 60.0, 0.0),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Username',
                              hintStyle:
                                  TextStyle(color: Color.fromRGBO(0, 0, 0, 1))),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(60.0, 20, 60.0, 0.0),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Email Address',
                              hintStyle:
                                  TextStyle(color: Color.fromRGBO(0, 0, 0, 1))),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(60.0, 20, 60.0, 0.0),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle:
                                  TextStyle(color: Color.fromRGBO(0, 0, 0, 1))),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(60.0, 20, 60.0, 0.0),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Repeat password',
                              hintStyle:
                                  TextStyle(color: Color.fromRGBO(0, 0, 0, 1))),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(60.0, 30, 60.0, 0.0),
                          child: ButtonTheme(
                            minWidth: 115.0,
                            height: 45.0,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  //borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(
                                      color: Color.fromRGBO(0, 0, 0, 1))),
                              onPressed: () {},
                              color: Color.fromRGBO(0, 0, 0, 1),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1)),
                              ),
                            ),
                          )),
                      Container(
                          margin: EdgeInsets.fromLTRB(60.0, 40, 40.0, 0.0),
                          child: Text(
                            "I am already a member",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color.fromRGBO(0, 0, 0, 1)),
                          ))
                    ]))));
  }
}
