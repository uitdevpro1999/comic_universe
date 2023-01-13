
import 'package:comic_universe/views/pages/login_screen.dart';
import 'package:comic_universe/views/widgets/bottom_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:comic_universe/models/user_model.dart';
import '../ultils/contrains.dart';
import '../views/widgets/custom_toast.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;
  @override
  void onReady() {
    super.onReady();
    // auth is comning from the constants.dart file but it is basically FirebaseAuth.instance.
    // Since we have to use that many times I just made a constant file and declared there

    firebaseUser = Rx<User?>(auth.currentUser);
    ever(firebaseUser, _setInitialScreen);
    firebaseUser.bindStream(auth.userChanges());
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
  void register(String email, String password,String name) async {
    if(email=="" || password == "")
    {
      var toast = CustomToast(msg: "Bạn chưa nhập email hoặc nhật khẩu");
      toast.showErrorToast();
    }
    else if(email != "" && password != ""){
      try {
        UserCredential cred = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        UserModel user = UserModel(id: cred.user!.uid, profilename: name,email: email, imageurl: "https://firebasestorage.googleapis.com/v0/b/comic-universe-da8f4.appspot.com/o/User_icon_2.svg.png?alt=media&token=81df9c28-139c-4acc-a31a-c7728b80c039", role: "user");
        await firebaseFirestore.collection('users').doc(cred.user!.uid).set(user.toJson());
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
  void resetpass(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      var toast = CustomToast(msg: "Gửi email thành công, vui lòng kiểm tra hộp thư của bạn");
      toast.showcautionToast();
    }
    catch(firebaseAuthExeption){
      var toast = CustomToast(msg: "Gửi email thất bại, vui lòng kiểm tra lại");
      toast.showErrorToast();
    }
}
}