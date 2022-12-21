
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../models/category_model.dart';
import '../ultils/contrains.dart';
import '../views/widgets/custom_toast.dart';
class CategoryController extends GetxController{
  final Rx<List<CategoriesModel>> _listCate = Rx<List<CategoriesModel>>([]);
  final Rx<List<String>> _listCateDrop = Rx<List<String>>([]);
  Rx<File?>? image;
  List<CategoriesModel> get listCate => _listCate.value;
  List<String> get listCateDrop => _listCateDrop.value;
 void getListCate() {
    _listCate.bindStream(
      firebaseFirestore.collection('categories').snapshots().map((QuerySnapshot query) {
          List<CategoriesModel> retValue = [];
          for (var element in query.docs) {
            retValue.add(CategoriesModel.fromSnap(element));
          }
          return retValue;
        },
      ),
    );
    update();
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
        .child('categoryPics')
        .child(id);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }
  void createCate(File? image, String name) async{
    try{
      if(image != null && name != ""){
        String id = uuid.v4();
       String url = await _uploadToStorage(image, id);
       CategoriesModel categories = CategoriesModel(
           id: id,
           catename: name,
           imageurl: url,
       );
        await firebaseFirestore
            .collection('categories')
            .doc(id)
            .set(categories.toJson());
        var toast = CustomToast(msg: "Thêm thể loại thành công");
        toast.showcautionToast();
        getListCate();
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