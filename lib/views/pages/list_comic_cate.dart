import 'package:comic_universe/views/pages/comic_manager/add_comic.dart';
import 'package:comic_universe/views/pages/comic_manager/list_chapter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../../../controllers/comic_controller.dart';
class ComicC extends StatefulWidget{
  final cateid;
  ComicC({Key? key, required this.cateid})  : super (key: key);
  @override
  _ComicCState createState() => _ComicCState();
}
class _ComicCState extends State<ComicC>{
  ComicController comicController = Get.put(ComicController());
  @override
  void initState() {
    comicController.getListComicfromCate(widget.cateid);
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.transparent, elevation: 0.0,
      title: Text("Danh sách truyện"),
      centerTitle: true,
    ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              if(comicController.listComicCate.isEmpty){
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
                  itemCount: comicController.listComicCate.length,
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){
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
                                image: DecorationImage(image: NetworkImage(comicController.listComicCate[index].imageurl),fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(comicController.listComicCate[index].name,style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 18),),
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
    );
  }
}