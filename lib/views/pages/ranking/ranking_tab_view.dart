import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart' as scr;

import '../../../controllers/comic_controller.dart';
import '../detail/comic_detail_screen.dart';

class RankingView extends StatefulWidget{
  RankingView({Key? key}) : super (key: key);
  @override
  _RankingViewState createState() => _RankingViewState();
}
class _RankingViewState extends State<RankingView>{
  ComicController comicController = Get.put(ComicController());
  @override
  void initState() {
    // TODO: implement initState
    comicController.getListComicView();
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              if(comicController.listComicView.isEmpty){
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
                  itemCount: comicController.listComicView.length,
                  itemBuilder: (context, index){
                     return InkWell(
                       onTap: (){
                         Get.to(ComicDetail(id: comicController.listComicView[index].id));
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
                                 image: DecorationImage(image: NetworkImage(comicController.listComicView[index].imageurl),fit: BoxFit.cover),
                                 borderRadius: BorderRadius.circular(5),
                               ),
                             ),
                             SizedBox(width: 20,),
                            Container(
                             width: MediaQuery.of(context).size.width/2,
                             child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(child: Text(comicController.listComicView[index].name,style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 18),softWrap: true,)),
                                  Text("Lượt xem: " + comicController.listComicView[index].viewcount.toString(),style: GoogleFonts.dosis(fontSize: 16),),
                                ],
                              ),
                            ),
                             Container(width: scr.Device.screenType == scr.ScreenType.tablet ? 15.w : 5.w,),

                             Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 if(index ==0)Container(
                                   height: 30,
                                   width: 30,
                                   child: Image.asset("assets/images/gold.png",fit: BoxFit.cover,),
                                 ),
                                 if(index ==1)Container(
                                   height: 30,
                                   width: 30,
                                   child: Image.asset("assets/images/silver.png",fit: BoxFit.cover,),
                                 ),
                                 if(index ==2)Container(
                                   height: 30,
                                   width: 30,
                                   child: Image.asset("assets/images/bronze.png",fit: BoxFit.cover,),
                                 ),
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