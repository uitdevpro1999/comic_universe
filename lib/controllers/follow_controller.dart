import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../models/follow_model.dart';
import '../ultils/contrains.dart';

import '../views/widgets/custom_toast.dart';
class FollowController extends GetxController{
  final Rx<List<FollowModel>> _listFollow = Rx<List<FollowModel>>([]);
  List<FollowModel> get listFollow => _listFollow.value;
  void getListFollow(String userid) {
    _listFollow.bindStream(
      firebaseFirestore.collection('user').doc(userid).collection('follow').snapshots().map((QuerySnapshot query) {
        List<FollowModel> retValue = [];
        for (var element in query.docs) {
          retValue.add(FollowModel.fromSnap(element));
        }
        return retValue;
      },
      ),
    );
  }
  void createFollow(String comicid, String userid, String comicname, String imageurl,int viewcount,int likecount,int commentcount) async
  {
    try{
        String id = comicid;
        FollowModel follow = FollowModel(
          id: comicid,
          comicid: comicid,
          userid: userid,
          comicname: comicname,
          imageurl: imageurl,
          viewcount: viewcount,
          likecount: likecount,
          commentcount: commentcount,
        );
        await firebaseFirestore
            .collection('users')
            .doc(userid).collection('follow').doc(id)
            .set(follow.toJson());
        var toast = CustomToast(msg: "Theo dõi thành công");
        toast.showSuccessToast();
    }
    catch(e){
      var toast = CustomToast(msg: "Theo dõi thất bại");
      toast.showErrorToast();
    }
  }
  void deleteFollow(String userid, String id) async{
    try{
      await firebaseFirestore.collection('users').doc(userid).collection('follow').doc(id).delete();
      var toast = CustomToast(msg: "Huỷ theo dõi thành công");
      toast.showSuccessToast();
    }
    catch(e){
      var toast = CustomToast(msg: "Huỷ theo dõi thất bại");
      toast.showErrorToast();
    }
  }
}
