import 'package:flutter/material.dart';
import 'package:mapas/screen/map.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(body: MapScreen()),
    );
  }
}
