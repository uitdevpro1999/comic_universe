import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabScreen2 extends StatefulWidget{
  TabScreen2({Key? key})  : super (key: key);
  @override
  _TabScreen2State createState() => _TabScreen2State();
}
class _TabScreen2State extends State<TabScreen2>{
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child:
            ListView(
              shrinkWrap: true,
              children: [
                Container(
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
                          image: DecorationImage(image: NetworkImage("https://hoathinh3d.com/wp-content/uploads/2021/12/kiem-vuc-phong-van-1015.jpg"),fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Kiếm Vực Phong Vân",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 18),),
                          SizedBox(height: 10,),
                          Text("Lượt thích: 800",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 16),),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
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
                          image: DecorationImage(image: NetworkImage("https://hoathinh3d.com/wp-content/uploads/2021/12/kiem-vuc-phong-van-1015.jpg"),fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Kiếm Vực Phong Vân",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 18),),
                          SizedBox(height: 10,),
                          Text("Lượt thích: 800",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 16),),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
      ),
    );
  }
}