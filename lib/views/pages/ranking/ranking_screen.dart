
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RankingScreen extends StatefulWidget{
  RankingScreen({Key? key}) : super (key: key);
  @override
  _RankingScreenState createState() => _RankingScreenState();
}
class _RankingScreenState extends State<RankingScreen> with SingleTickerProviderStateMixin{
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
                              Text("Lượt xem: 7000",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 16),),
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
                              Text("Lượt xem: 7000",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 16),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
      ],
    ),
        ),
    );
  }
}