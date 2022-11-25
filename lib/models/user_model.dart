import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String id;
  String profilename;
  String imageurl;
  UserModel({required this.id,required this.profilename, required this.imageurl});
  factory UserModel.fromJson(Map<String,dynamic> json)
  {
    return UserModel(
      id: json["id"],
      profilename: json["profilename"],
      imageurl: json["imageurl"],
    );
  }

}