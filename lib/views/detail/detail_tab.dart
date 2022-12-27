import 'package:comic_universe/views/pages/chapter_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../../controllers/like_controller.dart';
import '../../controllers/user_controller.dart';
class DetailTab extends StatefulWidget{
  String plot;
  String character;
  String id;
  String author;
  String catename;
  int viewcount;
  DetailTab({Key? key,required this.viewcount, required this.id,required this.character,required this.catename,required this.author,required this.plot}): super (key: key);
  @override
  _DetailTabState createState() => _DetailTabState();
}
class _DetailTabState extends State<DetailTab>{
  @override
  void initState() {

    super.initState();
  }
  Widget build(BuildContext context){
    return Scaffold(
       body: SingleChildScrollView(
           child: Column(
             children: [
               Container(
                 height: MediaQuery.of(context).size.height/1.52,
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
                               Text(widget.catename,style: GoogleFonts.dosis(fontSize: 17)),
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
                               Text(widget.author,style: GoogleFonts.dosis(fontSize: 17)),
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
                               Text(widget.character,style: GoogleFonts.dosis(fontSize: 17)),
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
                               Text(widget.plot,style: GoogleFonts.dosis(fontSize: 17)),
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
                       child: Column(
                         children: [
                           SizedBox(height: 5,),
                           Container(
                             height: 50,
                             width: MediaQuery.of(context).size.width/2,
                             decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.black),
                             child: TextButton(onPressed: (){
                               Get.to(ChapterScreen(comicid: widget.id,viewcount: widget.viewcount,));
                             }, child: Text("Đọc truyện",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 18),),),
                           ),
                           SizedBox(height: 5,),
                         ],
                       )
                   )
               ),
             ],
           ),
         )
    );
  }
}