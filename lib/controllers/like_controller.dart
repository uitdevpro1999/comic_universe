
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comic_universe/models/like_model.dart';
import'package:get/get.dart';
import '../ultils/contrains.dart';
class LikeController extends GetxController {
  final Rx<List<LikeModel>> _listLike = Rx<List<LikeModel>>([]);
  List<LikeModel> get listLike => _listLike.value;
   final Rx<bool> isLiked = Rx<bool>(false);

  void getListLike(String comicid, String userid) {
    isLiked.value = false;
    _listLike.bindStream(
      firebaseFirestore.collection('comic').doc(comicid)
          .collection('like')
          .snapshots()
          .map((QuerySnapshot query) {
        List<LikeModel> retValue = [];
        for (var element in query.docs) {
          retValue.add(LikeModel.fromSnap(element));
         var data = element.data() as Map<String,dynamic>;
          if(data['userid'] == userid)
          {
            like();
          }
        }
        return retValue;
      },
      ),
    );
    update();
  }
  void isLike(String userid){
    for(int i =0; i < listLike.length;i++){
      if(listLike[i].userid == userid){
        like();
      }
    }
    update();
  }
  void ulike(){
    isLiked.value=false;
    update();
  }
  void like(){
    isLiked.value= true;
    update();
  }
  void addLike(String userid,String comicid) async {
    String id = userid;
    LikeModel like = LikeModel(
      id: id,
      userid: userid,
    );

    await firebaseFirestore
        .collection('comic')
        .doc(comicid).collection('like').doc(id)
        .set(like.toJson());
  }
  void unLike(String comicid, String userid) async{
      await firebaseFirestore
          .collection('comic')
          .doc(comicid).collection('like').doc(userid).delete();
  }
  }
