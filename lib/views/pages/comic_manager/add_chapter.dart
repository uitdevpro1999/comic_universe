import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import '../../../controllers/chapter_controller.dart';
class AddChapter extends StatefulWidget{
  final comicid;
  AddChapter({Key? key, required final this.comicid}): super(key: key);
  @override
  _AddChapterState createState() => _AddChapterState();
}
class _AddChapterState extends State<AddChapter>{
  ChapterController chapterController = Get.put(ChapterController());
  TextEditingController _name =TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.transparent, elevation: 0.0,
        title: Text("Quản lý chapter"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<ChapterController>(
                  init: ChapterController(),
                  builder: (controller) {
                    if (controller.chapterFile?.value.path==null){
                      return Row(
                        children: [
                      Container(
                      margin: const EdgeInsets.only(top: 50,left: 100,right: 100,bottom: 20),
                          height: 50,
                            width: 100,
                           child: Text("Chưa có file")),
                          IconButton(
                            icon: Icon(Icons.border_color_outlined,color: Colors.black,size: 20,),
                            onPressed: (){
                              chapterController.pickFile();
                            },
                          ),
                        ],
                      );}
                    return
                     Row(
                       children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50,left: 100,right: 100,bottom: 20),
                        height: 50,
                        width: 100,
                        child: Text(controller.chapterFile?.value.path as String)),
                         IconButton(
                           icon: Icon(Icons.border_color_outlined,color: Colors.black,size: 20,),
                           onPressed: (){
                             chapterController.pickFile();
                           },
                         ),
                       ],
                     );
                  }
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                 controller: _name,
                  decoration:  InputDecoration(
                      icon: Icon(Icons.edit_outlined),
                      hintText: "Tên Chapter",
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
              SizedBox(height: MediaQuery.of(context).size.height/2,),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width/2,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.black),
                child: TextButton(onPressed: (){
                  chapterController.createChapter(widget.comicid, _name.text, chapterController.chapterFile?.value as File);
                }, child: Text("Xác nhận",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 18),),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}