import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comic_universe/ultils/contrains.dart';
import 'package:comic_universe/views/widgets/bottom_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:comic_universe/models/user_model.dart';
import 'package:image_picker/image_picker.dart';

import '../views/widgets/custom_toast.dart';
class UserController extends GetxController{
  final Rx<Map<String, dynamic>> _user = Rx<Map<String, dynamic>>({});
  Map<String, dynamic> get user => _user.value;
 void getUserData() async{
    DocumentSnapshot userDoc =
    await firebaseFirestore.collection('users').doc(auth.currentUser?.uid).get();
    String profilename = userDoc['profilename'];
    String email = userDoc['email'];
    String role = userDoc['role'];
    String imageurl = userDoc['imageurl'];
     _user.value={
       'profilename': profilename,
       'email':email,
       'imageurl': imageurl,
       'role': role,
    };
     update();
 }
  void pickImage() async {
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
   File ipickedImage = File(pickedImage!.path);
    _updateAvatar(ipickedImage);
  }
 void _updateAvatar(File image) async{
  try{
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(auth.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    await firebaseFirestore.collection('users').doc(auth.currentUser!.uid).update({'imageurl':downloadUrl});
    var toast = CustomToast(msg: "Cập nhật thành công");
    toast.showSuccessToast();
  }
  catch(firebaseExeption){
    var toast = CustomToast(msg: "Cập nhật thất bại");
    toast.showErrorToast();
  }
  getUserData();
 }
 void updateName(String name) async{
   try {
     await firebaseFirestore.collection('users')
         .doc(auth.currentUser!.uid)
         .update({'profilename': name});
     var toast = CustomToast(msg: "Cập nhật thành công");
     toast.showSuccessToast();
     Get.back();
   }
   catch(e){
     var toast = CustomToast(msg: "Cập nhật thất bại");
     toast.showErrorToast();
   }
   getUserData();
 }
}