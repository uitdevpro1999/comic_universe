import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../models/comment_model.dart';
import '../ultils/contrains.dart';

import '../views/widgets/custom_toast.dart';
class CommentController extends GetxController{
  final Rx<List<CommentModel>> _listComment = Rx<List<CommentModel>>([]);
  List<CommentModel> get listComment => _listComment.value;
  void getListComment(String comicid) {
    _listComment.bindStream(
      firebaseFirestore.collection('comic').doc(comicid).collection('comment').snapshots().map((QuerySnapshot query) {
        List<CommentModel> retValue = [];
        for (var element in query.docs) {
          retValue.add(CommentModel.fromSnap(element));
        }
        return retValue;
      },
      ),
    );
  }
  void createComment(String comicid, String userid, String username, String content, String imageurl) async
  {
    try{
      if(content != ""){
        String id = uuid.v4();
        CommentModel comment = CommentModel(
          id: id,
          comicid: comicid,
          userid: userid,
          username: username,
          content: content,
          imageurl: imageurl,
        );
        await firebaseFirestore
            .collection('comic')
            .doc(comicid).collection('comment').doc(id)
            .set(comment.toJson());
        var toast = CustomToast(msg: "Bình luận thành công");
        toast.showSuccessToast();
      } else {
        var toast = CustomToast(msg: "Vui lòng điền đủ thông tin");
        toast.showcautionToast();
      }
    }
    catch(e){
      var toast = CustomToast(msg: "Thêm bình luận thất bại");
      toast.showErrorToast();
    }
  }
  void deleteComment(String comicid, String id) async{
    try{
      await firebaseFirestore.collection('comic').doc(comicid).collection('comment').doc(id).delete();
      var toast = CustomToast(msg: "Xoá bình luận thành công");
      toast.showSuccessToast();
    }
    catch(e){
      var toast = CustomToast(msg: "Xoá bình luận thất bại");
      toast.showErrorToast();
    }
  }
}
