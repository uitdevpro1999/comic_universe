import 'package:comic_universe/controllers/user_controller.dart';
import 'package:comic_universe/ultils/contrains.dart';
import 'package:comic_universe/views/pages/editprofile_screen.dart';
import 'package:comic_universe/views/pages/manager_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class ContactScreen extends StatefulWidget{
  ContactScreen({Key? key}) : super (key: key);
  @override
  _ContactScreenState createState() => _ContactScreenState();
}
class _ContactScreenState extends State<ContactScreen>{
  final UserController userController = Get.put(UserController());
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Thông tin tác giả",style: GoogleFonts.dosis(fontWeight: FontWeight.w600),),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 50,left: 100,right: 100,bottom: 20),
                      height: 200,
                      width: 200,
                      child:CircleAvatar(
                        backgroundImage: NetworkImage("https://firebasestorage.googleapis.com/v0/b/comic-universe-da8f4.appspot.com/o/310325278_101433072752022_1365601828333965830_n%20(1).jpg?alt=media&token=cdf6cc55-f265-4e1b-9d67-db629f098fe3"),
                      ),
                    ),
                    Text("Nguyễn Quốc Trung",style: GoogleFonts.dosis(fontSize: 24,fontWeight: FontWeight.w600),),
                ],
            ),
            SizedBox(height: 30,),
            SingleChildScrollView(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    Container(
                      height: 50,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.work_outline_rounded),
                              SizedBox(width: 10,),
                              Text("Flutter Developer tại Mfunctions Group",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 18),),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                        height: 50,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.phone_android_outlined),
                                SizedBox(width: 10,),
                                Text("Số điện thoại: 0975182035",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 18),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    Container(
                      height: 50,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.school_outlined),
                              SizedBox(width: 10,),
                              Text("Học vấn: Kỹ thuật phần mềm tại VNUHCM - UIT",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 18),),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.mail_outline_rounded),
                              SizedBox(width: 10,),
                              Text("Email: nqtrungit1999@gmail.com",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 18),),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.facebook_outlined),
                              SizedBox(width: 10,),
                              Text("Facebook: Nguyễn Quốc Trung (Shinjitsu Kudo)",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 18),),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined),
                              SizedBox(width: 10,),
                              Text("Địa chỉ: Mễ Trì Hạ - Mễ Trì - Nam Từ Liêm - Hà Nội",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 18),),
                            ],
                          ),
                        ],
                      ),
                    ),

                  ],
                )
            ),

          ],
        ),
      ),
    );
  }
}