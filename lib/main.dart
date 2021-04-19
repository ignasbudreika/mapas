import 'package:flutter/material.dart';
import 'package:mapas/screen/login.dart';

void main() => runApp(new Application());

class Application extends StatefulWidget {
  @override
  _Application createState() => _Application();
}

class _Application extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: LogIn());
  }
}
