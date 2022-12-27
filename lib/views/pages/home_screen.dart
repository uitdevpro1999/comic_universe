import 'package:comic_universe/controllers/user_controller.dart';
import 'package:comic_universe/ultils/contrains.dart';
import 'package:comic_universe/views/detail/comic_detail_screen.dart';
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
  String abc= 'hoàng hoa ký';
 final UserController userController = Get.put(UserController());
  @override
  void initState() {
    super.initState();
    userController.getUserData();
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
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                child:  CircleAvatar( backgroundImage: NetworkImage(controller.user['imageurl']),),
                              ),
                              SizedBox(width: 10,),
                              RichText(text: TextSpan(
                                text: 'Chào mừng\n',
                                style: GoogleFonts.dosis(textStyle: TextStyle(fontSize: 16, color: Colors.black)),
                                children: <TextSpan>[
                                  TextSpan(text: controller.user['profilename'], style: GoogleFonts.dosis(fontWeight:FontWeight.w600,fontSize: 24,color: Colors.black))
                                ],
                              ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(onPressed: (){}, icon: Icon(Icons.search,size: 30,)),
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
               child: ListView(
                 physics: BouncingScrollPhysics(),
                 shrinkWrap: true,
                 scrollDirection: Axis.horizontal,
                 children: [
                   Row(
                     children: [
                       Container(
                         margin: EdgeInsets.only(right: 5),
                         width: 300.0,
                         decoration: BoxDecoration(
                           image: DecorationImage(image: NetworkImage("https://thuvienanime.com/wp-content/uploads/2021/11/duong-khai-thuvienanime.jpeg"),fit: BoxFit.cover),
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
                                   width: abc.length.toDouble()*9,
                                   child: InkWell(
                                     child: Text(abc,style: GoogleFonts.dosis(color: Colors.white,fontSize: 20),),
                                   ),
                                 ),
                             ),
                           ],
                         ),
                       ),
                     ],
                   ),
                   Container(
                     width: 300.0,
                     margin: EdgeInsets.only(right: 5),
                     decoration: BoxDecoration(
                       image: DecorationImage(image: NetworkImage("https://zingaudio.net/wp-content/uploads/2020/10/yeu-than-ky.jpg"),fit: BoxFit.cover),
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
                             width: 160,
                             child: InkWell(
                               onTap: (){
                               },
                               child: Text("Võ luyện đỉnh phong",style: GoogleFonts.dosis(color: Colors.white,fontSize: 20),),
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                   Container(
                     width: 300.0,
                     margin: EdgeInsets.only(right: 5),
                     decoration: BoxDecoration(
                       image: DecorationImage(image: NetworkImage("https://zingaudio.net/wp-content/uploads/2020/10/yeu-than-ky.jpg"),fit: BoxFit.cover),
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
                             width: 160,
                             child: InkWell(
                               child: Text("Võ luyện đỉnh phong",style: GoogleFonts.dosis(color: Colors.white,fontSize: 20),),
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                 ],
               ),
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
            GridView.count(
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.all(15),
              crossAxisSpacing: 1,
              mainAxisSpacing: 0,
              crossAxisCount: 2,
              children: <Widget>[
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Container(
                    height: 137,
                    width: 184,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage("https://thuvienanime.com/wp-content/uploads/2021/11/duong-khai-thuvienanime.jpeg"),fit: BoxFit.cover),
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),),
                      Text("Võ luyện đỉnh phong",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 16),),
                    ],
                  )
                ),
                Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 137,
                          width: 184,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage("https://thuvienanime.com/wp-content/uploads/2021/11/duong-khai-thuvienanime.jpeg"),fit: BoxFit.cover),
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5),
                          ),),
                        Text("Võ luyện đỉnh phong",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 16),),
                      ],
                    )
                ),
                Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 137,
                          width: 184,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage("https://thuvienanime.com/wp-content/uploads/2021/11/duong-khai-thuvienanime.jpeg"),fit: BoxFit.cover),
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5),
                          ),),
                        Text("Võ luyện đỉnh phong",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 16),),
                      ],
                    )
                ),
                Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 137,
                          width: 184,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage("https://thuvienanime.com/wp-content/uploads/2021/11/duong-khai-thuvienanime.jpeg"),fit: BoxFit.cover),
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5),
                          ),),
                        Text("Võ luyện đỉnh phong",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 16),),
                      ],
                    )
                ),
              ],
            ),
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
            GridView.count(
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.all(15),
              crossAxisSpacing: 1,
              mainAxisSpacing: 0,
              crossAxisCount: 2,
              children: <Widget>[
                Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 137,
                          width: 184,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage("https://thuvienanime.com/wp-content/uploads/2021/11/duong-khai-thuvienanime.jpeg"),fit: BoxFit.cover),
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5),
                          ),),
                        Text("Võ luyện đỉnh phong",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 16),),
                      ],
                    )
                ),
                Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 137,
                          width: 184,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage("https://thuvienanime.com/wp-content/uploads/2021/11/duong-khai-thuvienanime.jpeg"),fit: BoxFit.cover),
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5),
                          ),),
                        Text("Võ luyện đỉnh phong",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 16),),
                      ],
                    )
                ),
                Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 137,
                          width: 184,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage("https://thuvienanime.com/wp-content/uploads/2021/11/duong-khai-thuvienanime.jpeg"),fit: BoxFit.cover),
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5),
                          ),),
                        Text("Võ luyện đỉnh phong",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 16),),
                      ],
                    )
                ),
                Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 137,
                          width: 184,
                          decoration: BoxDecoration(
                            image:  DecorationImage(image: NetworkImage("https://thuvienanime.com/wp-content/uploads/2021/11/duong-khai-thuvienanime.jpeg"),fit: BoxFit.cover),
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5),
                          ),),
                        Text("Võ luyện đỉnh phong",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 16),),
                      ],
                    )
                ),
              ],
            ),
          ],

        ),
      )
    );
  }
}