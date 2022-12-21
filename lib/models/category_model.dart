import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriesModel {
  String id;
  String catename;
  String imageurl;
  CategoriesModel({required this.id,required this.catename, required this.imageurl});
  static CategoriesModel fromSnap(DocumentSnapshot snap)
  {
    var snapshot = snap.data() as Map<String, dynamic>;
    return CategoriesModel(
      id: snapshot['id'],
      catename: snapshot['catename'],
      imageurl: snapshot['imageurl'],
    );
  }
  Map<String,dynamic> toJson()=>{
    'id': id,
    'catename': catename,
    'imageurl': imageurl,
  };
}