import 'package:cloud_firestore/cloud_firestore.dart';

class ComicModel {
  String id;
  String cateid;
  String name;
  String catename;
  int viewcount;
  int likecount;
  int commentcount;
  String plot;
  String author;
  String characters;
  String imageurl;
  ComicModel({
    required this.id,
    required this.cateid,
    required this.name,
    required this.catename,
    required this.viewcount,
    required this.likecount,
    required this.commentcount,
    required this.plot,
    required this.author,
    required this.characters,
    required this.imageurl
  });
  static ComicModel fromSnap(DocumentSnapshot snap)
  {
    var snapshot = snap.data() as Map<String, dynamic>;
    return ComicModel(
      id: snapshot['id'],
      cateid: snapshot['cateid'],
      name: snapshot['name'],
      catename: snapshot['catename'],
      viewcount: snapshot['viewcount'],
      likecount: snapshot['likecount'],
      commentcount: snapshot['commentcount'],
      plot: snapshot['plot'],
      author: snapshot['author'],
      characters: snapshot['characters'],
      imageurl: snapshot['imageurl'],
    );
  }
  Map<String,dynamic> toJson()=>{
    'id': id,
    'cateid': cateid,
    'name': name,
    'catename': catename,
    'viewcount': viewcount,
    'likecount':likecount,
    'commentcount': commentcount,
    'plot': plot,
    'author': author,
    'characters': characters,
    'imageurl':imageurl,
  };
}