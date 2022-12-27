import 'package:comic_universe/views/detail/comment_tab.dart';
import 'package:comic_universe/views/detail/detail_tab.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/like_controller.dart';
import '../../controllers/user_controller.dart';
import '../pages/category_manager/category_manager.dart';
import '../pages/comic_manager/list_comic_manager.dart';
import 'package:get/get.dart';
class ComicDetail extends StatefulWidget{
  String name;
  String plot;
  String character;
  String id;
  String image;
  String author;
  String catename;
  int viewcount;
  int commentcount;
  int likecount;
  ComicDetail({Key? key, required this.id, required this.name, required this.plot, required this.author,required this.image,required this.catename, required this.character,required this.viewcount,required this.likecount,required this.commentcount}) : super (key: key);
  @override
  _ComicDetailState createState() => _ComicDetailState();
}
class _ComicDetailState extends State<ComicDetail> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState() {
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
      body: Container(
        child: Column(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width/2,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(widget.image),fit: BoxFit.cover),
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          child: Align(
                            alignment: FractionalOffset.bottomLeft,
                            child:  Container(
                              color: Colors.black,
                              height: 30,
                              width: MediaQuery.of(context).size.width/2,
                              child: InkWell(
                                onTap: (){
                                },
                                child: Row(
                                  children: [
                                    SizedBox(width: 5,),
                                    Text(widget.name,style: GoogleFonts.dosis(color: Colors.white,fontSize: 20),softWrap: true,),
                                  ],
                                ),
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.remove_red_eye_outlined, color: Colors.white,size: 20,),
                                  SizedBox(width: 5,),
                                  Text(widget.viewcount.toString(),style: GoogleFonts.dosis(color: Colors.white,fontSize: 20),),
                                  SizedBox(width: 10,),
                                  Icon(Icons.favorite_border_outlined, color: Colors.white,size: 20,),
                                  Text(widget.likecount.toString(),style: GoogleFonts.dosis(color: Colors.white,fontSize: 20),),
                                  SizedBox(width: 5,),
                                ],
                              ),
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
                    DetailTab(viewcount: widget.viewcount,id: widget.id, character: widget.character, catename: widget.catename, author: widget.author, plot: widget.plot),
                    CommentTab(comicid: widget.id, commentcount: widget.commentcount, likecount: widget.likecount, viewcount: widget.viewcount, comicname: widget.name, imageurl: widget.image)
                  ],
                ),
              ),
        ],),

      ),

    );
  }
}