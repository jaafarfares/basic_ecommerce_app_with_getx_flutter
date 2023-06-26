import 'package:flutter/material.dart';

class UserModel {
  late String userid, email, name, photo;
  UserModel(
      {this.userid = "", this.email = "", this.name = "", this.photo = ""});
  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    userid = map['userid'];
    email = map["email"];
    name = map["name"];
    photo = map["photo"];
  }
  toJson() {
    return {
      'userid': userid,
      'email': email,
      'name': name,
      'photo': photo,

    };
  }
}
