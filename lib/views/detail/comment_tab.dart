import 'package:comic_universe/controllers/comment_controller.dart';
import 'package:comic_universe/controllers/follow_controller.dart';
import 'package:comic_universe/controllers/like_controller.dart';
import 'package:comic_universe/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/comic_controller.dart';
import '../pages/comic_manager/add_comic.dart';
import '../pages/comic_manager/list_chapter.dart';
import 'package:get/get.dart';
class CommentTab extends StatefulWidget{
  String comicid;
  int commentcount;
  int likecount;
  String comicname;
  int viewcount;
  String imageurl;
  CommentTab({Key? key,required this.comicid,required this.commentcount,required this.likecount,required this.viewcount,required this.comicname,required this.imageurl}): super (key: key);
  @override
  _CommentTabState createState() => _CommentTabState();
}
class _CommentTabState extends State<CommentTab>{
  CommentController commentController = Get.put(CommentController());
  ComicController comicController =Get.put(ComicController());
  UserController userController = Get.put(UserController());
  LikeController likeController = Get.put(LikeController());
  FollowController followController = Get.put(FollowController());
  TextEditingController _content = TextEditingController();
  @override
  void isLike(String userid){
    for(int i =0; i < likeController.listLike.length;i++){
      if(likeController.listLike[i].userid == userid){
        likeController.isLiked.value = true;
        break;
      }
    }
  }
  void initState() {
    likeController.getListLike(widget.comicid);
    commentController.getListComment(widget.comicid);
    userController.getUserData();
    isLike(userController.user['id']);
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
           Container(
             height: MediaQuery.of(context).size.height/1.56,
             child:  Obx(() {
               if(commentController.listComment.isEmpty){
                 return Column(
                   children: [
                     SizedBox(height: MediaQuery.of(context).size.height/1.82/2,),
                     Row(
                       children: [
                         SizedBox(width: MediaQuery.of(context).size.width/3.6,),
                         Text("Chưa có bình luận nào",style: GoogleFonts.dosis(fontSize: 24,fontWeight: FontWeight.w600),),
                       ],
                     )
                   ],
                 );
               }
               return ListView.builder(
                   shrinkWrap: true,
                   itemCount: commentController.listComment.length,
                   itemBuilder: (context, index){
                     return  Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(5),
                         ),
                         margin: EdgeInsets.only(left: 5,bottom: 5),
                         height: 50,
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Container(
                               height: MediaQuery.of(context).size.height,
                               width: 50,
                               decoration: BoxDecoration(
                                 image: DecorationImage(image: NetworkImage(commentController.listComment[index].imageurl),fit: BoxFit.cover),
                                 borderRadius: BorderRadius.circular(100),
                               ),
                             ),
                             SizedBox(width: 20,),
                            Container(
                              width: MediaQuery.of(context).size.width/1.5,
                              child:  Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(commentController.listComment[index].username,style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 18),),
                                  SizedBox(height: 5,),
                                  Expanded(child: Text(commentController.listComment[index].content,style: GoogleFonts.dosis(fontSize: 18),softWrap: true,),),
                                ],
                              ),
                            ),
                             userController.user['id'] == commentController.listComment[index].userid ?
                             IconButton(onPressed: (){
                               commentController.deleteComment(widget.comicid, commentController.listComment[index].id);
                               comicController.updateCmtCount("down", widget.comicid, widget.commentcount);
                             }, icon: Icon(Icons.delete_outline)) : Container(),
                           ],
                         ),
                       );
                   },

               );
             }
             ),
           ),
              Row(
                children: [
                  Obx(() {
                    while(likeController.isLiked.value == true){
                      return IconButton(onPressed: (){
                        comicController.updateLikeCount("down", widget.comicid, widget.likecount);
                        followController.deleteFollow(userController.user['id'], widget.comicid);
                        likeController.unLike(widget.comicid,userController.user['id']);
                        likeController.isLiked.value= false;
                      }, icon: Icon(Icons.favorite,size: 30,color: Colors.red,));}
                    return IconButton(onPressed: (){
                      comicController.updateLikeCount("up", widget.comicid, widget.likecount);
                      followController.createFollow(widget.comicid, userController.user['id'], widget.comicname, widget.imageurl, widget.viewcount, widget.likecount, widget.commentcount);
                      likeController.addLike(userController.user['id'], widget.comicid);
                      likeController.isLiked.value= true;
                       }, icon: Icon(Icons.favorite_border_outlined,size: 30,color: Colors.red,));
                  }),

                  Container(
                    width: MediaQuery.of(context).size.width/1.18,
                    margin: EdgeInsets.only(left: 5,right: 5),
                    child: TextFormField(
                      controller: _content,
                      decoration:  InputDecoration(
                          suffixIcon:IconButton(onPressed: (){
                            commentController.createComment(widget.comicid, userController.user['id'], userController.user['profilename'], _content.text, userController.user['imageurl']);
                            comicController.updateCmtCount("up", widget.comicid, widget.commentcount);
                            _content.clear();
                          },
                              icon: Icon(Icons.create,size: 30,color: Colors.black,)) ,
                          hintText: "Nội dung",
                          hintStyle: GoogleFonts.dosis(fontSize: 16) ,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 3),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 3),
                            borderRadius: BorderRadius.circular(15),
                          )
                      ),

                    ),
                  ),
                ],
              )
          ],
        ),

      ),
    );
  }
}