import 'package:comic_universe/views/pages/comic_manager/add_comic.dart';
import 'package:comic_universe/views/pages/comic_manager/list_chapter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../../../controllers/comic_controller.dart';
class ComicManager extends StatefulWidget{
  ComicManager({Key? key})  : super (key: key);
  @override
  _ComicManagerState createState() => _ComicManagerState();
}
class _ComicManagerState extends State<ComicManager>{
  ComicController comicController = Get.put(ComicController());
  @override
  void initState() {
    comicController.getListComic();
    super.initState();
  }
 @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              if(comicController.listComic.isEmpty){
                return Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height/2,),
                    Row(
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width/3.6,),
                        Text("Chưa có truyện nào",style: GoogleFonts.dosis(fontSize: 24,fontWeight: FontWeight.w600),),
                      ],
                    )
                  ],
                );
              }
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: comicController.listComic.length,
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){
                        Get.to(ChapterManager(comicid: comicController.listComic[index].id));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        margin: EdgeInsets.only(left: 5,bottom: 5),
                        height: 75,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height,
                              width: 118,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage(comicController.listComic[index].imageurl),fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(comicController.listComic[index].name,style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 18),),
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
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Get.to(AddComic());
          },
          backgroundColor: Colors.blueGrey,
          child: Icon(Icons.add),

      ),
    );
  }
}