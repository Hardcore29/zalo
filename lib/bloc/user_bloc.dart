import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:chat_app/models/users.dart';
import 'package:firebase_database/firebase_database.dart';

class UserBloc {
  Future getUser(String uid) async {
    final ref = await FirebaseDatabase.instance.ref().child("users").child(uid);
    Future<DataSnapshot> data = ref.get();
    return data["name"];
  }
}
