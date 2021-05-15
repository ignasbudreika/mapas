import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mapas/screen/login.dart';
import 'package:mapas/screen/menu.dart';
import 'package:mapas/back/firebase.dart' as backas;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new Application());
}

class Application extends StatefulWidget {
  @override
  _Application createState() => _Application();
}

class _Application extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          ((backas.Firebase().getUid == "" || backas.Firebase().getUid == null)
              ? LogInScreen()
              : Menu()),
    );
  }
}
