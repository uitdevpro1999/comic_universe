import 'package:comic_universe/controllers/comic_controller.dart';
import 'package:comic_universe/views/pages/comicview_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/chapter_controller.dart';
import 'package:get/get.dart';
class ChapterScreen extends StatefulWidget{
  final comicid;
  int viewcount;
  ChapterScreen({Key? key, required this.comicid,required this.viewcount})  : super (key: key);
  @override
  _ChapterScreenState createState() => _ChapterScreenState();
}
class _ChapterScreenState extends State<ChapterScreen>{
  ChapterController chapterController = Get.put(ChapterController());
  ComicController comicController =Get.put(ComicController());
  @override
  void initState() {
    chapterController.getListChapter(widget.comicid);
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.transparent, elevation: 0.0,
        title: Text("Danh sách chapter"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              if(chapterController.listChapter.isEmpty){
                return Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height/2,),
                    Row(
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width/3.6,),
                        Text("Chưa có chapter nào",style: GoogleFonts.dosis(fontSize: 24,fontWeight: FontWeight.w600),),
                      ],
                    )
                  ],
                );
              }
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: chapterController.listChapter.length,
                  itemBuilder: (context, index){
                    return
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          child: InkWell(
                            onTap: (){
                              comicController.updateViewCount(widget.comicid, widget.viewcount);
                              Get.to(View(name:chapterController.listChapter[index].chaptername, chapterurl:chapterController.listChapter[index].chapterurl ));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(chapterController.listChapter[index].chaptername,style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 18),),
                              ],
                            ),
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