import 'package:flutter/material.dart';
import 'package:mapas/screen/login.dart';
import 'package:mapas/screen/menu.dart';
import 'package:mapas/screen/new_group.dart';
import 'screen/menu.dart';

void main() => runApp(new Example());

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: LogIn());
  }
}
