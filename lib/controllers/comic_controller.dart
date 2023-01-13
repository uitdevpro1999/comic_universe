import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../models/category_model.dart';
import '../models/comic_model.dart';
import '../ultils/contrains.dart';
import '../views/widgets/custom_toast.dart';
class ComicController extends GetxController{
  final Rx<List<ComicModel>> _listComicCate = Rx<List<ComicModel>>([]);
  final Rx<List<ComicModel>> _listComic = Rx<List<ComicModel>>([]);
  final Rx<List<ComicModel>> _listComicView = Rx<List<ComicModel>>([]);
  final Rx<List<ComicModel>> _listComicLike = Rx<List<ComicModel>>([]);
  final Rx<List<ComicModel>> _listComicCmt = Rx<List<ComicModel>>([]);
  final Rx<List<ComicModel>> _listComicSearch = Rx<List<ComicModel>>([]);
  final Rx<Map<String,dynamic>> _comic = Rx<Map<String,dynamic>>({});
  Rx<File?>? image;
  List<ComicModel> get listComicCate => _listComicCate.value;
  List<ComicModel> get listComic => _listComic.value;
  List<ComicModel> get listComicView => _listComicView.value;
  List<ComicModel> get listComicLike => _listComicLike.value;
  List<ComicModel> get listComicCmt => _listComicCmt.value;
  List<ComicModel> get listComicSearch => _listComicSearch.value;


  Map<String,dynamic> get comic => _comic.value;
  void getComicDetail(String id) async{
    DocumentSnapshot comicDoc =await firebaseFirestore.collection('comic').doc(id).get();
    String cateid = comicDoc['cateid'];
    String name = comicDoc['name'];
    String catename = comicDoc['catename'];
    int viewcount = comicDoc['viewcount'];
    int likecount = comicDoc['likecount'];
    int commentcount = comicDoc['commentcount'];
    String plot = comicDoc['plot'];
    String author = comicDoc['author'];
    String characters = comicDoc['characters'];
    String imageurl = comicDoc['imageurl'];
    _comic.value={
      'id':id,
      'cateid':cateid,
      'name':name,
      'catename':catename,
      'viewcount':viewcount,
      'likecount':likecount,
      'commentcount':commentcount,
      'plot':plot,
      'author':author,
      'characters': characters,
      'imageurl': imageurl,
    };
    update();
  }
  getListComicSearch(String name) {
    if (name == "") {
      _listComicSearch.value.clear();
    }
    else {
      _listComicSearch.bindStream(firebaseFirestore.collection('comic').where(
          'name', isEqualTo: name).snapshots().map((
          QuerySnapshot query) {
        List<ComicModel> retValue = [];
        for (var element in query.docs) {
          retValue.add(ComicModel.fromSnap(element));
        }
        return retValue;
      },
      ),);
    }
  }
  void getListComic() {
    _listComic.bindStream(
      firebaseFirestore.collection('comic').snapshots().map((QuerySnapshot query) {
        List<ComicModel> retValue = [];
        for (var element in query.docs) {
          retValue.add(ComicModel.fromSnap(element));
        }
        return retValue;
      },
      ),
    );
  }
  void getListComicView(){
    _listComicView.bindStream(
      firebaseFirestore.collection('comic').orderBy("viewcount",descending: true).limit(20).snapshots().map((QuerySnapshot query) {
        List<ComicModel> retValue = [];
        for (var element in query.docs) {
          retValue.add(ComicModel.fromSnap(element));
        }
        return retValue;
      },
      ),
    );
  }
  void getListComicLike(){
    _listComicLike.bindStream(
      firebaseFirestore.collection('comic').orderBy("likecount",descending: true).limit(20).snapshots().map((QuerySnapshot query) {
        List<ComicModel> retValue = [];
        for (var element in query.docs) {
          retValue.add(ComicModel.fromSnap(element));
        }
        return retValue;
      },
      ),
    );
  }
  void getListComicCmt(){
    _listComicCmt.bindStream(
      firebaseFirestore.collection('comic').orderBy("commentcount",descending: true).snapshots().map((QuerySnapshot query) {
        List<ComicModel> retValue = [];
        for (var element in query.docs) {
          retValue.add(ComicModel.fromSnap(element));
        }
        return retValue;
      },
      ),
    );
  }
  void getListComicfromCate(String cateid) async{
    _listComicCate.bindStream(
      firebaseFirestore.collection('comic').where('cateid',isEqualTo: cateid).snapshots().map((QuerySnapshot query) {
        List<ComicModel> retValue = [];
        for (var element in query.docs) {
          retValue.add(ComicModel.fromSnap(element));
        }
        return retValue;
      },
      ),
    );
  }
  @override
  void pickImage() async {
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    image = Rx<File?>(File(pickedImage!.path));
    update();
  }
  Future<String> _uploadToStorage(File image, String id) async {
    Reference ref = firebaseStorage
        .ref()
        .child('ComicPics')
        .child(id);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }
  void updateCmtCount(String comicid, String type) async{
    getComicDetail(comicid);
       if(type =="up"){
         comic['commentcount']= comic['commentcount'] +1;
       }
       else if(type=="down"){
         comic['commentcount']= comic['commentcount'] -1;
       }
      await firebaseFirestore.collection('comic').doc(comicid).update({'commentcount':comic['commentcount']});
       update();
  }
  void updateLikeCount (String comicid, String type) async{
    getComicDetail(comicid);
    if(type =="up"){
      comic['likecount']= comic['likecount'] + 1;
    }
    else if(type=="down"){
      comic['likecount']= comic['likecount'] - 1;
    }
      await firebaseFirestore.collection('comic').doc(comicid).update({'likecount':comic['likecount']});
    update();
  }
  void updateViewCount(String comicid) async{
    getComicDetail(comicid);
    comic['viewcount']= comic['viewcount'] +1;
    await firebaseFirestore.collection('comic').doc(comicid).update({'viewcount':comic['viewcount']});
    update();
  }
  void deleteComic(String id) async{
   try{
     await firebaseFirestore
         .collection('comic')
         .doc(id);
     var toast = CustomToast(msg: "Xoá thành công");
     toast.showSuccessToast();
   }
   catch(e){
     var toast = CustomToast(msg: "Xoá thất bại");
     toast.showErrorToast();
   }
  }
  void createComic(File? image, String name, CategoriesModel cate, String plot, String characters, String author ) async{
    try{
      String cateid = cate.id;
      String catename = cate.catename;
      if(image != null && name != "" && cateid != "" && plot != "" && characters != "" && author !=""){
        String id = uuid.v4();
        String url = await _uploadToStorage(image, id);
        ComicModel comic = ComicModel(
          id: id,
          cateid: cateid,
          name: name,
          catename: catename,
          plot: plot,
          author: author,
          characters: characters,
          imageurl: url,
          viewcount: 0,
          likecount: 0,
          commentcount: 0,
        );
        await firebaseFirestore
            .collection('comic')
            .doc(id)
            .set(comic.toJson());
        var toast = CustomToast(msg: "Thêm truyện thành công");
        toast.showcautionToast();
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
}