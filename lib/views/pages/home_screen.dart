import 'package:comic_universe/controllers/comic_controller.dart';
import 'package:comic_universe/controllers/user_controller.dart';
import 'package:comic_universe/ultils/contrains.dart';
import 'package:comic_universe/views/pages/detail/comic_detail_screen.dart';
import 'package:comic_universe/views/pages/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget{
  HomeScreen({Key? key}): super (key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>{
 final UserController userController = Get.put(UserController());
 final ComicController comicController=Get.put(ComicController());
  @override
  void initState() {
    super.initState();
    userController.getUserData();
    comicController.getListComicView();
    comicController.getListComicLike();
    comicController.getListComicCmt();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GetBuilder<UserController>(
                init: UserController(),
                builder: (controller){
                  if(controller.user.isEmpty){
                    return CircularProgressIndicator();
                  }
                  return Container(
                    padding: EdgeInsets.only(top: 57,left: 23),
                    height: 110,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 40, 0),
                          width: MediaQuery.of(context).size.width/1.5,
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                child:  CircleAvatar( backgroundImage: NetworkImage(controller.user['imageurl']),),
                              ),
                              SizedBox(width: 10,),
                              Flexible(child: RichText(text: TextSpan(
                                text: 'Chào mừng\n',
                                style: GoogleFonts.dosis(textStyle: TextStyle(fontSize: 16, color: Colors.black)),
                                children:[
                                  TextSpan(text: controller.user['profilename'], style: GoogleFonts.dosis(fontWeight:FontWeight.w600,fontSize: 22,color: Colors.black),)
                                ],
                              ),
                              ),)
                            ],
                          ),
                        ),
                        IconButton(onPressed: (){
                          Get.to(SearchScreen());
                        }, icon: Icon(Icons.search,size: 30,)),
                      ],
                    ),
                  );
                },
            ),
             SizedBox(height: 30,),
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 SizedBox(width: 15,),
                 Text("Truyện được xem nhiều",style: GoogleFonts.dosis(fontSize: 24,fontWeight: FontWeight.w600),),
                 SizedBox(width: 5,),
                 Image.asset("assets/images/crown.png",scale: 20,),
               ],
             ),

            Container(
               padding: EdgeInsets.only(top: 10),
               height: 200,
               child: Obx((){
                 if(comicController.listComicView.isEmpty){
                   return Center(child: CircularProgressIndicator(),);
                 }
                 return ListView.builder(
                   scrollDirection: Axis.horizontal,
                   physics: BouncingScrollPhysics(),
                   itemCount: comicController.listComicView.length > 4 ? 4 : comicController.listComicView.length,
                   shrinkWrap: true,
                   itemBuilder: (context, index){
                     return InkWell(
                       onTap: (){ Get.to(ComicDetail(id: comicController.listComicView[index].id));},
                       child: Container(
                         width: 300.0,
                         margin: EdgeInsets.only(right: 5),
                         decoration: BoxDecoration(
                           image: DecorationImage(image: NetworkImage(comicController.listComicView[index].imageurl),fit: BoxFit.cover),
                           color: Colors.blue,
                           borderRadius: BorderRadius.circular(10),
                         ),
                         child: Stack(
                           children: [
                             Positioned(
                               top: 140,
                               child: Container(
                                 color: Colors.black,
                                 height: 30,
                                 width: MediaQuery.of(context).size.width,
                                 child: Expanded(child: Text(comicController.listComicView[index].name,style: GoogleFonts.dosis(color: Colors.white,fontSize: 20),)),
                               ),
                             ),
                           ],
                         ),
                       ),
                     );
                   },
                 );
               }),
             ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 15,),
                Text("Truyện được yêu thích",style: GoogleFonts.dosis(fontSize: 24,fontWeight: FontWeight.w600),),
                SizedBox(width: 5,),
                Image.asset("assets/images/flame.png",scale: 20,),
              ],
            ),
            Obx((){
              if(comicController.listComicLike.isEmpty){
                return Center(child: CircularProgressIndicator(),);
              }
              return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 4,mainAxisSpacing: 0),
                  itemCount: comicController.listComicLike.length > 4 ? 4 : comicController.listComicLike.length,
                  shrinkWrap: true,
                  primary: false,
                  padding: const EdgeInsets.all(5),
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){
                        Get.to(ComicDetail(id: comicController.listComicLike[index].id));
                      },
                      child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 137,
                                width: 205,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: NetworkImage(comicController.listComicLike[index].imageurl),fit: BoxFit.cover),
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(5),
                                ),),
                              Expanded(child: Text(comicController.listComicLike[index].name,style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 16),)),
                            ],
                          )
                      ),
                    );
                  }
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 15,),
                Text("Truyện được tương tác nhiều",style: GoogleFonts.dosis(fontSize: 24,fontWeight: FontWeight.w600),),
                SizedBox(width: 5,),
                Image.asset("assets/images/thunder.png",scale:20,),
              ],
            ),
            Obx((){
              if(comicController.listComicCmt.isEmpty){
                return Center(child: CircularProgressIndicator(),);
              }
              return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 4,mainAxisSpacing: 0),
                  itemCount: comicController.listComicCmt.length > 4 ? 4 : comicController.listComicCmt.length,
                  shrinkWrap: true,
                  primary: false,
                  padding: const EdgeInsets.all(5),
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){Get.to(ComicDetail(id: comicController.listComicCmt[index].id));},
                      child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 137,
                                width: 205,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: NetworkImage(comicController.listComicCmt[index].imageurl),fit: BoxFit.cover),
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(5),
                                ),),
                              Text(comicController.listComicCmt[index].name,style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 16),),
                            ],
                          )
                      ),
                    );
                  }
              );
            }),
          ],

        ),
      )
    );
  }
}