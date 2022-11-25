import 'package:comic_universe/views/pages/ranking/ranking_tab1.dart';
import 'package:comic_universe/views/pages/ranking/ranking_tab2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ManagerScreen extends StatefulWidget{
  ManagerScreen({Key? key}) : super (key: key);
  @override
  _ManagerScreenState createState() => _ManagerScreenState();
}
class _ManagerScreenState extends State<ManagerScreen> with SingleTickerProviderStateMixin{
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
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0.0,
        title: Text("Công cụ quản trị"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 30,
              child: TabBar(
                controller: _tabController,
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 2.0 ,color: Colors.red),
                    insets: EdgeInsets.symmetric(horizontal:50.0)
                ),
                labelColor: Colors.red,
                unselectedLabelColor: Colors.black,
                unselectedLabelStyle: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 20),
                labelStyle: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 20),
                tabs: [
                  Tab(
                    text: 'Quản lý truyện',
                  ),
                  Tab(
                    text: 'Quản lý thể loại',
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),// tab bar view here
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