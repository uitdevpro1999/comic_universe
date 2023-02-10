import 'package:comic_universe/controllers/comic_controller.dart';
import 'package:comic_universe/views/pages/comicview_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controllers/chapter_controller.dart';
import 'package:get/get.dart';
class ChapterScreen extends StatefulWidget{
  ChapterScreen({Key? key})  : super (key: key);
  @override
  _ChapterScreenState createState() => _ChapterScreenState();
}
class _ChapterScreenState extends State<ChapterScreen>{
  ChapterController chapterController = Get.put(ChapterController());
  ComicController comicController =Get.put(ComicController());
  @override
  void initState() {
    chapterController.getListChapter(comicController.comic['id']);
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.white, elevation: 0.0,
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
                        height: 75,
                        margin: const EdgeInsets.only(left: 5,bottom: 5,right: 5),
                        child: Card(
                          color: Colors.deepOrange,
                          child: InkWell(
                            onTap: (){
                              comicController.updateViewCount(comicController.comic['id']);
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