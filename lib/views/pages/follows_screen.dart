import 'package:comic_universe/controllers/user_controller.dart';
import 'package:comic_universe/views/pages/detail/comic_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/follow_controller.dart';
import 'package:get/get.dart';
class FollowSreen extends StatefulWidget{
  FollowSreen({Key? key}): super (key: key);
  @override
  _FollowScreenState createState() => _FollowScreenState();
}
class _FollowScreenState extends State<FollowSreen>{
  @override
  FollowController followController =Get.put(FollowController());
  UserController userController= Get.put(UserController());
  @override
  void initState() {
    followController.getListFollow(userController.user['id']);
    super.initState();
  }
  Widget build(BuildContext context){
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Theo dõi",style: GoogleFonts.dosis(fontSize: 24,fontWeight: FontWeight.w600),),
                ],
              ),
            ),
            Obx(() {
              if(followController.listFollow.isEmpty){
                return Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height/2,),
                    Text("Bạn chưa theo dõi truyện nào",style: GoogleFonts.dosis(fontSize: 24,fontWeight: FontWeight.w600),),
                  ],
                );
              }
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: followController.listFollow.length,
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){
                       Get.to(ComicDetail(id: followController.listFollow[index].comicid));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        margin: EdgeInsets.only(left: 5,bottom: 5),
                        height: 83,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height,
                              width: 118,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage(followController.listFollow[index].imageurl),fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(followController.listFollow[index].comicname,style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 18),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              );
            }
            ),
          ],
        ),
      ),
    );
  }
}