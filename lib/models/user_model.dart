
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String profilename;
  String email;
  String imageurl;
  String role;
  UserModel({required this.id,required this.profilename,required this.email, required this.imageurl, required this.role});
  static UserModel fromSnap(DocumentSnapshot snap)
  {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      id: snapshot['id'],
      profilename: snapshot['profilename'],
      email: snapshot['email'],
      imageurl: snapshot['imageurl'],
      role: snapshot["role"],
    );
  }
  Map<String,dynamic> toJson()=>{
    'id': id,
    'profilename': profilename,
    'email': email,
    'imageurl': imageurl,
    'role': role,
  };

}