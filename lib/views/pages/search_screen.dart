import 'package:comic_universe/controllers/comic_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import 'detail/comic_detail_screen.dart';
class SearchScreen extends StatefulWidget{
  SearchScreen({Key? key}) : super (key: key);
  @override
  _SearchScreenState createState() => _SearchScreenState();
}
class _SearchScreenState extends State<SearchScreen>{
  ComicController comicController = Get.put(ComicController());
  @override
  void initState() {
    comicController.listComicSearch.clear();
    super.initState();
  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Tìm kiếm",style: GoogleFonts.dosis(fontWeight: FontWeight.w600),),
      ),
       body: SingleChildScrollView(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Container(
               padding: EdgeInsets.only(top: 20, left: 10,right: 10,bottom: 30),
               width: MediaQuery.of(context).size.width,
               child: TextFormField(
                 onChanged: (value){setState(() {
                     comicController.listComicSearch.clear();
                     comicController.getListComicSearch(value);
                 });},
                 decoration:  InputDecoration(
                     hintText: "Nhập tên truyện......",
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
             Obx(() {
               if(comicController.listComicSearch.isEmpty){
                 return Column(
                   children: [
                     SizedBox(height: MediaQuery.of(context).size.height/3,),
                     Row(
                       children: [
                         SizedBox(width: MediaQuery.of(context).size.width/3.6,),
                         Text("Chưa tìm thấy truyện",style: GoogleFonts.dosis(fontSize: 24,fontWeight: FontWeight.w600),),
                       ],
                     )
                   ],
                 );
               }
               return ListView.builder(
                   shrinkWrap: true,
                   itemCount: comicController.listComicSearch.length,
                   itemBuilder: (context, index){
                     return InkWell(
                       onTap: (){
                         Get.to(ComicDetail(id: comicController.listComicSearch[index].id));
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
                                 image: DecorationImage(image: NetworkImage(comicController.listComicSearch[index].imageurl),fit: BoxFit.cover),
                                 borderRadius: BorderRadius.circular(5),
                               ),
                             ),
                             SizedBox(width: 20,),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text(comicController.listComicSearch[index].name,style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 18),),
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