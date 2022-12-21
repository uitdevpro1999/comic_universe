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
  Rx<File?>? image;
  List<ComicModel> get listComicCate => _listComicCate.value;
  List<ComicModel> get listComic => _listComic.value;

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
          viewcount: '0',
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