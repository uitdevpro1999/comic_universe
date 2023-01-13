import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import '../../../controllers/chapter_controller.dart';
class AddChapterG extends StatefulWidget{
  final comicid;
  AddChapterG({Key? key, required final this.comicid}): super(key: key);
@override
_AddChapterGState createState() => _AddChapterGState();
}
class _AddChapterGState extends State<AddChapterG>{
  ChapterController chapterController = Get.put(ChapterController());
  TextEditingController _name =TextEditingController();
  TextEditingController _link =TextEditingController();
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
              Container(
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  style: GoogleFonts.dosis(),
                  controller: _link,
                  decoration:  InputDecoration(
                      icon: Icon(Icons.link_outlined),
                      hintText: "ID Google Chapter",
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
              SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  style: GoogleFonts.dosis(),
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
                  chapterController.createChapterG(widget.comicid, _name.text, "https://drive.google.com/uc?export=view&id="+_link.text);
                }, child: Text("Xác nhận",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 18),),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}