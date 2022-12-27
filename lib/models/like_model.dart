import 'package:cloud_firestore/cloud_firestore.dart';
class LikeModel {
  String id;
  String userid;

  LikeModel(
      {required this.id,required this.userid});

  static LikeModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return LikeModel(
      id: snapshot['id'],
      userid: snapshot['userid'],
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'userid': userid,
      };
}