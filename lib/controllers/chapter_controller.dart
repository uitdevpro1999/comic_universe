import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comic_universe/models/chapter_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'dart:io';
import '../ultils/contrains.dart';
import 'package:file_picker/file_picker.dart';

import '../views/widgets/custom_toast.dart';
class ChapterController extends GetxController{
  final Rx<List<ChapterModel>> _listChapter = Rx<List<ChapterModel>>([]);
  List<ChapterModel> get listChapter => _listChapter.value;
  Rx<File>? chapterFile;
  void getListChapter(String comicid) {
    _listChapter.bindStream(
      firebaseFirestore.collection('comic').doc(comicid).collection('chapter').snapshots().map((QuerySnapshot query) {
        List<ChapterModel> retValue = [];
        for (var element in query.docs) {
          retValue.add(ChapterModel.fromSnap(element));
        }
        return retValue;
      },
      ),
    );
  }
  void pickFile() async {
    final pickedFile =
    await FilePicker.platform.pickFiles( type: FileType.custom,
      allowedExtensions: ['pdf']);
    chapterFile = Rx<File>(File(pickedFile?.files.single.path as String));
    update();
  }
  Future<String> _uploadToStorage(File file, String id) async {
    Reference ref = firebaseStorage
        .ref()
        .child('chapters')
        .child(id);

    UploadTask uploadTask = ref.putFile(file);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }
  void createChapter(String comicid, String name, File file) async
  {
    try{
      if(file != null && name != ""){
        String id = uuid.v4();
        String url = await _uploadToStorage(file, id);
        ChapterModel chapter = ChapterModel(
          id: id,
          comicid: comicid,
          chapterurl: url,
          chaptername: name,
        );
        await firebaseFirestore
            .collection('comic')
            .doc(comicid).collection('chapter').doc(id)
            .set(chapter.toJson());
        var toast = CustomToast(msg: "Thêm chapter thành công");
        toast.showSuccessToast();
        Get.back();
      } else {
        var toast = CustomToast(msg: "Vui lòng điền đủ thông tin");
        toast.showcautionToast();
      }
    }
    catch(e){
      var toast = CustomToast(msg: "Thêm thất bại");
      toast.showErrorToast();
    }
  }
  void createChapterG(String comicid, String name, String link) async
  {
    try{
      if(link != "" && name != ""){
        String id = uuid.v4();
        String url = link;
        ChapterModel chapter = ChapterModel(
          id: id,
          comicid: comicid,
          chapterurl: url,
          chaptername: name,
        );
        await firebaseFirestore
            .collection('comic')
            .doc(comicid).collection('chapter').doc(id)
            .set(chapter.toJson());
        var toast = CustomToast(msg: "Thêm chapter thành công");
        toast.showSuccessToast();
        Get.back();
      } else {
        var toast = CustomToast(msg: "Vui lòng điền đủ thông tin");
        toast.showcautionToast();
      }
    }
    catch(e){
      var toast = CustomToast(msg: "Thêm thất bại");
      toast.showErrorToast();
    }
  }
  void deleteChapter(String comicid, String id) async{
   try{
     await firebaseFirestore
         .collection('comic')
         .doc(comicid).collection('chapter').doc(id).delete();
     var toast = CustomToast(msg: "Xoá thành công");
     toast.showSuccessToast();
   }
   catch(e){
     var toast = CustomToast(msg: "Xoá thất bại");
     toast.showErrorToast();
   }
  }
}
