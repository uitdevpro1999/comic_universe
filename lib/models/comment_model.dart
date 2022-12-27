import 'package:cloud_firestore/cloud_firestore.dart';
class CommentModel {
  String id;
  String comicid;
  String userid;
  String username;
  String content;
  String imageurl;

  CommentModel(
      {required this.id, required this.comicid, required this.userid,required this.username, required this.content, required this.imageurl});

  static CommentModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return CommentModel(
      id: snapshot['id'],
      comicid: snapshot['comicid'],
      userid: snapshot['userid'],
      username: snapshot['username'],
      content: snapshot['content'],
      imageurl: snapshot['imageurl'],
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'comicid': comicid,
        'userid': userid,
        'username': username,
        'content': content,
        'imageurl': imageurl,
      };
}