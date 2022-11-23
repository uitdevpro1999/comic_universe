import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategloryScreen extends StatefulWidget{
  CategloryScreen({Key? key}) : super (key: key);
  @override
  _CategloryScreenState createState() => _CategloryScreenState();
}
class _CategloryScreenState extends State<CategloryScreen>{
  String abc = "anime";
  Widget build(BuildContext context){
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Thể loại",style: GoogleFonts.dosis(fontSize: 24,fontWeight: FontWeight.w600),),
                  ],
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
                            image: DecorationImage(image: NetworkImage("https://www.looper.com/img/gallery/25-shows-like-adventure-time-you-should-watch-next/intro-1644627512.webp"),fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Adventure",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 18),),
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
                            image: DecorationImage(image: NetworkImage("https://assets.skybound.com/wp-content/uploads/2022/05/31143238/Creepshow_01-cover.jpg"),fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Horror",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 18),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
    );
  }
}