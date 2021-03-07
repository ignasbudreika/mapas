import 'package:flutter/material.dart';
import 'package:mapas/screen/menu.dart';
import 'package:mapas/screen/signup.dart';

void main() => runApp(SignUp());

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: MenuScreen());
  }
}
