
import 'package:flutter/material.dart';
import 'package:comic_universe/views/pages/login_screen.dart';
import 'package:comic_universe/views/widgets/bottom_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:motion_toast/motion_toast.dart';

import '../ultils/contrains.dart';
import '../views/widgets/custom_toast.dart';


class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;
  @override
  void onReady() {
    super.onReady();
    // auth is comning from the constants.dart file but it is basically FirebaseAuth.instance.
    // Since we have to use that many times I just made a constant file and declared there

    firebaseUser = Rx<User?>(auth.currentUser);

    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {

      // if the user is not found then the user is navigated to the Register Screen
      Get.offAll(() =>  LoginScreen());

    } else {

      // if the user exists and logged in the the user is navigated to the Home Screen
      Get.offAll(() => BottomNav());

    }
  }
  void register(String email, password) async {
    if(email=="" || password == "")
    {
      var toast = CustomToast(msg: "Bạn chưa nhập email hoặc nhật khẩu");
      toast.showErrorToast();
    }
    else if(email != "" && password != ""){
      try {
        await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        var toast = CustomToast(msg: "Đăng ký thành công");
        toast.showSuccessToast();
      } catch (firebaseAuthException) {
        var toast = CustomToast(msg: "Đăng ký thất bại");
        toast.showErrorToast();
      }
    }
  }

  void login(String email, password) async {
    if(email=="" || password == "")
      {
        var toast = CustomToast(msg: "Bạn chưa nhập email hoặc nhật khẩu");
        toast.showErrorToast();
      }
    else if(email != "" && password != ""){
      try {
        await auth.signInWithEmailAndPassword(email: email, password: password);
        var toast = CustomToast(msg: "Đăng nhập thành công");
        toast.showSuccessToast();
      } catch (firebaseAuthException) {
        var toast = CustomToast(msg: "Đăng nhập thất bại, vui lòng kiểm tra lại email và mật khẩu");
        toast.showErrorToast();
      }
    }
  }

  void signOut() async {
    await auth.signOut();
    var toast = CustomToast(msg: "Đăng xuất thành công");
    toast.showSuccessToast();
  }
}