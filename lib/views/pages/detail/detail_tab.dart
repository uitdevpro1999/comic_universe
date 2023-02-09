import 'package:comic_universe/controllers/comic_controller.dart';
import 'package:comic_universe/controllers/like_controller.dart';
import 'package:comic_universe/controllers/user_controller.dart';
import 'package:comic_universe/views/pages/chapter_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
class DetailTab extends StatefulWidget{
  DetailTab({Key? key}): super (key: key);
  @override
  _DetailTabState createState() => _DetailTabState();
}
class _DetailTabState extends State<DetailTab>{
  ComicController comicController = Get.put(ComicController());

  @override
  void initState() {

    super.initState();
  }
  Widget build(BuildContext context){
    return Scaffold(
       body: SingleChildScrollView(
         child: Container(
           margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
             child: Column(
               children: [
                 Container(
                   height: MediaQuery.of(context).size.height<842 ? MediaQuery.of(context).size.height/1.8 : MediaQuery.of(context).size.height/1.6 ,
                   child:  SingleChildScrollView(
                     child: Column(
                       children: [
                         Container(
                             width: MediaQuery.of(context).size.width,
                             margin: EdgeInsets.only(left: 20,top: 20, bottom: 0),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 Text("Thể loại",style: GoogleFonts.dosis(fontSize: 24,fontWeight: FontWeight.w600),),
                                 SizedBox(height: 3,),
                                 Text(comicController.comic['catename'],style: GoogleFonts.dosis(fontSize: 17)),
                               ],
                             )
                         ),
                         Container(
                             width: MediaQuery.of(context).size.width,
                             margin: EdgeInsets.only(left: 20,top: 20, bottom: 10),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 Text("Tác giả",style: GoogleFonts.dosis(fontSize: 24,fontWeight: FontWeight.w600),),
                                 SizedBox(height: 3,),
                                 Text(comicController.comic['author'],style: GoogleFonts.dosis(fontSize: 17)),
                               ],
                             )
                         ),
                         Container(
                             width: MediaQuery.of(context).size.width,
                             margin: EdgeInsets.only(left: 20,top: 20, bottom: 10),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 Text("Nhân vật trong truyện",style: GoogleFonts.dosis(fontSize: 24,fontWeight: FontWeight.w600),),
                                 SizedBox(height: 3,),
                                 Text(comicController.comic['characters'],style: GoogleFonts.dosis(fontSize: 17)),
                               ],
                             )
                         ),

                         Container(
                             width: MediaQuery.of(context).size.width,
                             margin: EdgeInsets.only(left: 20,top: 20, bottom: 10),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 Text("Cốt truyện",style: GoogleFonts.dosis(fontSize: 24,fontWeight: FontWeight.w600),),
                                 SizedBox(height: 3,),
                                 Text(comicController.comic['plot'],style: GoogleFonts.dosis(fontSize: 17)),
                               ],
                             )
                         ),

                       ],
                     ),
                   ),
                 ),
                 Align(
                     alignment: FractionalOffset.bottomCenter,
                     child: Container(
                         height: 60,
                         child:
                             Center(
                               child: Container(
                                 height: 50,
                                 width: MediaQuery.of(context).size.width/2,
                                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.black),
                                 child: TextButton(onPressed: (){
                                   Get.to(ChapterScreen());
                                 }, child: Text("Đọc truyện",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 18),),),
                               ),
                             ),

                     )
                 ),
               ],
             ),
           ),
       )
    );
  }
}