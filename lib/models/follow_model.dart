import 'package:cloud_firestore/cloud_firestore.dart';
class FollowModel {
  String id;
  String comicid;
  String userid;
  String comicname;
  String imageurl;
  int likecount;
  int commentcount;
  int viewcount;

  FollowModel(
      {required this.id, required this.comicid, required this.userid,required this.comicname, required this.imageurl,required this.commentcount,required this.likecount,required this.viewcount});

  static FollowModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return FollowModel(
      id: snapshot['id'],
      comicid: snapshot['comicid'],
      userid: snapshot['userid'],
      comicname: snapshot['comicname'],
      imageurl: snapshot['imageurl'],
      likecount: snapshot['likecount'],
      commentcount: snapshot['commentcount'],
      viewcount: snapshot['viewcount'],
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'comicid': comicid,
        'userid': userid,
        'comicname': comicname,
        'imageurl': imageurl,
        'likecount':likecount,
        'viewcount': viewcount,
        'commentcount':commentcount,
      };
}