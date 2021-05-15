import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String email;
  String uid;

  UserModel({this.email, this.uid});

  @override
  String toString() {
    return this.email + " " + this.uid;
  }
}
