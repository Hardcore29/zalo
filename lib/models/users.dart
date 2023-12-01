import 'package:firebase_database/firebase_database.dart';

class Users {
  String? id;
  String? name;
  String? email;
  String? phone;
  bool? gender;
  DateTime? birdthday;
  String? photo;
  Users(this.id, this.name, this.email, this.phone, this.gender, this.birdthday,
      this.photo);

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json["name"];
    email = json['email'];
    phone = json['phone'];
    gender = json['gender'];
    birdthday = json['birthday'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['gender'] = gender;
    data['birthday'] = birdthday;
    return data;
  }
}
