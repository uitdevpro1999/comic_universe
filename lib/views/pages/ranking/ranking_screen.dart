import 'package:comic_universe/views/pages/ranking/ranking_tab1.dart';
import 'package:comic_universe/views/pages/ranking/ranking_tab2.dart';
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
                padding: EdgeInsets.only(bottom: 0),
                child: Image.asset("assets/images/ranking.jpg"),
              ),
              Container(
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
                child: TabBar(
                  controller: _tabController,
                  // give the indicator a decoration (color and border radius)
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                    color: Colors.red,
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  unselectedLabelStyle: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 20),
                  labelStyle: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 20),
                  tabs: [
                    Tab(
                      text: 'Lượt xem',
                    ),
                    Tab(
                      text: 'Lượt thích',
                    ),
                  ],
                ),
              ),
              // tab bar view here
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    TabScreen1(),
                    TabScreen2(),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}