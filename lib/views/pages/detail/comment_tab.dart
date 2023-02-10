import 'package:comic_universe/controllers/comment_controller.dart';
import 'package:comic_universe/controllers/follow_controller.dart';
import 'package:comic_universe/controllers/like_controller.dart';
import 'package:comic_universe/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart' as res;
import 'package:get/get.dart';

import '../../../controllers/comic_controller.dart';
class CommentTab extends StatefulWidget{
  CommentTab({Key? key,}): super (key: key);
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

  void initState() {
    likeController.getListLike(comicController.comic['id'],userController.user['id']);
    commentController.getListComment(comicController.comic['id']);
    userController.getUserData();
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
             Container(
               height:  res.Device.screenType == res.ScreenType.tablet ? 44.5.h: MediaQuery.of(context).size.height<842 ? MediaQuery.of(context).size.height/1.8 : MediaQuery.of(context).size.height/1.58,
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
                               userController.user['id'] == commentController.listComment[index].userid || userController.user['role'] == "admin" ?
                               IconButton(onPressed: (){
                                 commentController.deleteComment(comicController.comic['id'], commentController.listComment[index].id);
                                 comicController.updateCmtCount(comicController.comic['id'], "down");
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
                    GetBuilder<LikeController>(
                     init: LikeController(),
                     builder: (controller){
                              if(controller.isLiked.value == true)
                                return IconButton(onPressed: (){
                                 controller.ulike();
                                 comicController.updateLikeCount(comicController.comic['id'], "down");
                                 likeController.unLike( comicController.comic['id'],userController.user['id'],);
                                 followController.deleteFollow(userController.user['id'], comicController.comic['id']);
                                 }, icon: Icon(Icons.favorite,size: 30,color: Colors.red,));
                                    return IconButton(onPressed: (){
                                    controller.like();
                                    comicController.updateLikeCount(comicController.comic['id'], "up");
                                    likeController.addLike(userController.user['id'], comicController.comic['id']);
                                    followController.createFollow(comicController.comic['id'],userController.user['id'], comicController.comic['name'], comicController.comic['imageurl'], );
                                    }, icon: Icon(Icons.favorite_border_outlined,size: 30,color: Colors.red,));
                            }
                       ),
                    Container(
                      width: MediaQuery.of(context).size.width/1.18,
                      margin: EdgeInsets.only(left: 5,right: 5),
                      child: TextFormField(
                        style: GoogleFonts.dosis(),
                        controller: _content,
                        decoration:  InputDecoration(
                            suffixIcon:IconButton(onPressed: (){
                              commentController.createComment(comicController.comic['id'], userController.user['id'], userController.user['profilename'], _content.text, userController.user['imageurl']);
                              comicController.updateCmtCount(comicController.comic['id'], "up");
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
          ),
            ],
          ),

        ),
      ),
    );
  }
}