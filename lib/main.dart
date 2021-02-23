import 'package:flutter/material.dart';
import 'package:mapas/screen/menu.dart';

void main() => runApp(new Example());

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
