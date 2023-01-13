
import 'package:comic_universe/controllers/comic_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import 'comment_tab.dart';
import 'detail_tab.dart';
class ComicDetail extends StatefulWidget{
  String id;
  ComicDetail({Key? key, required this.id}) : super (key: key);
  @override
  _ComicDetailState createState() => _ComicDetailState();
}
class _ComicDetailState extends State<ComicDetail> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  ComicController comicController = Get.put(ComicController());
  @override
  void initState() {
    comicController.getComicDetail(widget.id);
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: GetBuilder<ComicController>(
        init: ComicController(),
        builder: (controller){
          if(controller.comic.values.isEmpty){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            child: Column(
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width/2,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(comicController.comic['imageurl']),fit: BoxFit.cover),
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              child: Align(
                                alignment: FractionalOffset.topLeft,
                                child: Column(
                                  children: [
                                    SizedBox(height: 8,),
                                    IconButton(onPressed: (){
                                      Get.back();
                                    }, icon: Icon(Icons.arrow_back,size: 30,)),
                                  ],
                                )
                              ),
                            ),
                            Positioned(
                              child: Align(
                                alignment: FractionalOffset.bottomLeft,
                                child:  Container(
                                  color: Colors.black,
                                  height: 30,
                                  width: MediaQuery.of(context).size.width/2,
                                  child:  Row(
                                      children: [
                                        SizedBox(width: 5,),
                                        Expanded(child: Text(controller.comic['name'],style: GoogleFonts.dosis(color: Colors.white,fontSize: 20),softWrap: true,),),
                                      ],
                                    ),
                                ),
                              ),
                            ),
                            Positioned(
                              child: Align(
                                alignment: FractionalOffset.bottomRight,
                                child:  Container(
                                    color: Colors.black,
                                    height: 30,
                                    width: MediaQuery.of(context).size.width/2,
                                    child: GetBuilder<ComicController>(
                                      init: ComicController(),
                                      builder: (controller){
                                        return Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Icon(Icons.remove_red_eye_outlined, color: Colors.white,size: 20,),
                                            SizedBox(width: 5,),
                                            Text(controller.comic['viewcount'].toString(),style: GoogleFonts.dosis(color: Colors.white,fontSize: 20),),
                                            SizedBox(width: 10,),
                                            Icon(Icons.favorite_border_outlined, color: Colors.white,size: 20,),
                                            Text(controller.comic['likecount'].toString(),style: GoogleFonts.dosis(color: Colors.white,fontSize: 20),),
                                            SizedBox(width: 5,),
                                          ],
                                        );
                                      },
                                    )
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                Container(
                  height: 30,
                  child: TabBar(
                    controller: _tabController,
                    indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(width: 2.0 ,color: Colors.red),
                        insets: EdgeInsets.symmetric(horizontal:60.0)
                    ),
                    labelColor: Colors.red,
                    unselectedLabelColor: Colors.black,
                    unselectedLabelStyle: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 20),
                    labelStyle: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 20),
                    tabs: [
                      Tab(
                        text: 'Chi tiết',
                      ),
                      Tab(
                        text: 'Bình luận',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),// tab bar view here
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      DetailTab(),
                      CommentTab(),
                    ],
                  ),
                ),
              ],),
          );
        }
      )
    );
  }
}