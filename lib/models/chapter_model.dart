import 'package:cloud_firestore/cloud_firestore.dart';
class ChapterModel {
  String id;
  String comicid;
  String chaptername;
  String chapterurl;
  ChapterModel({required this.id,required this.comicid, required this.chaptername,required this.chapterurl});
  static ChapterModel fromSnap(DocumentSnapshot snap)
  {
    var snapshot = snap.data() as Map<String, dynamic>;
    return ChapterModel(
      id: snapshot['id'],
      comicid: snapshot['comicid'],
      chaptername: snapshot['chaptername'],
      chapterurl: snapshot['chapterurl']
    );
  }
  Map<String,dynamic> toJson()=>{
  'id': id,
  'comicid': comicid,
  'chaptername': chaptername,
  'chapterurl': chapterurl,
  };
}