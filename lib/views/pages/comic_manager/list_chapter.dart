import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:comic_universe/views/pages/comic_manager/add_chapter.dart';
import 'package:comic_universe/views/pages/comic_manager/add_chapter_google.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../../../controllers/chapter_controller.dart';
class ChapterManager extends StatefulWidget{
  final comicid;
  ChapterManager({Key? key, required this.comicid})  : super (key: key);
  @override
  _ChapterManagerState createState() => _ChapterManagerState();
}
class _ChapterManagerState extends State<ChapterManager>{
  ChapterController chapterController = Get.put(ChapterController());
  @override
  void initState() {
    chapterController.getListChapter(widget.comicid);
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: Colors.transparent, elevation: 0.0,
        title: Text("Quản lý chapter"),
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
                    return InkWell(
                      onLongPress: () => AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          animType: AnimType.rightSlide,
                          title: 'Cảnh báo',
                          desc: 'Bạn chắc chắn muốn xoá chứ ?',
                          btnCancelOnPress: (){},
                          btnOkOnPress: () {
                            chapterController.deleteChapter(chapterController.listChapter[index].comicid, chapterController.listChapter[index].id);
                          },
                        )..show(),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        margin: EdgeInsets.only(left: 5,bottom: 5,right: 5),
                        height: 75,
                        child:
                          Card(
                            color: Colors.grey,
                            child: Center(child: Text(chapterController.listChapter[index].chaptername,style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 18),),)
                          )
                      ),
                    );
                  }
              );
            }
            ),
          ],
        ),

      ),
      floatingActionButton:  Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
         FloatingActionButton(
                onPressed: () {
                  Get.to(AddChapter(comicid: widget.comicid));
                },
                child: Icon(Icons.add),
              ),
         SizedBox(height: 5,),
         FloatingActionButton(
                onPressed: () { Get.to(AddChapterG(comicid: widget.comicid)); },
                child: Icon(Icons.link_outlined),
              ),
        ],
      ),
    );
  }
}