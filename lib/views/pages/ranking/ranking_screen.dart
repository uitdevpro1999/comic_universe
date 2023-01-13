
import 'package:comic_universe/views/pages/ranking/ranking_tab_like.dart';
import 'package:comic_universe/views/pages/ranking/ranking_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RankingScreen extends StatefulWidget{
  RankingScreen({Key? key}) : super (key: key);
  @override
  _RankingScreenState createState() => _RankingScreenState();
}
class _RankingScreenState extends State<RankingScreen> with SingleTickerProviderStateMixin{
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.width/2,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/rank.jpg"),fit: BoxFit.cover),
                  color: Colors.blue,
                ),
                child:
                    Positioned(
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child:  Column(
                          children: [
                            Container(
                              height: 130,
                              width: 130,
                              child: Image.asset("assets/images/king.png"),
                            ),
                            Container(
                              color: Colors.black,
                              height: 30,
                              width: 120,
                              child: Text("Bảng Xếp Hạng",style: GoogleFonts.dosis(color: Colors.white,fontSize: 20),),
                            ),
                          ],
                        ),
                        ),
                      ),
                    ),
              Container(
                height: 30,
                child: TabBar(
                  controller: _tabController,
                  indicator: const UnderlineTabIndicator(
                      borderSide: BorderSide(width: 2.0 ,color: Colors.red),
                      insets: EdgeInsets.symmetric(horizontal:60.0)
                  ),
                  labelColor: Colors.red,
                  unselectedLabelColor: Colors.black,
                  unselectedLabelStyle: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 20),
                  labelStyle: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 20),
                  tabs: const [
                    Tab(
                      text:'Lượt xem',
                    ),
                    Tab(
                      text: 'Lượt thích',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),// tab bar view here
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    RankingView(),
                    RankingLike(),
                  ],
                ),
              ),
      ],
    ),
        ),
    );
  }
}