import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget{
  ProfileScreen({Key? key}) : super (key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen>{
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50,left: 100,right: 100,bottom: 20),
              height: 200,
              width: 200,
              child: CircleAvatar(
                backgroundImage: NetworkImage("https://i.pinimg.com/736x/4a/f4/75/4af47542f3930fa8509dc5d84e5ccb9e.jpg"),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black,
                  ),
                  height: 35,
                  width: 35,
                  margin: EdgeInsets.only(top: 160,left: 120),
                  child: Center(
                    child: IconButton(
                      icon: Icon(Icons.border_color_outlined,color: Colors.white,size: 20,),
                      onPressed: (){},
                    ),
                  )
                ),
              ),
            ),
            Text("Nguyễn Văn A",style: GoogleFonts.dosis(fontSize: 24,fontWeight: FontWeight.w600),),
            SizedBox(height: 30,),
            SingleChildScrollView(
                child: ListView(
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
                              Icon(Icons.person_outline),
                              SizedBox(width: 10,),
                              Text("Chỉnh sửa thông tin",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 18),),
                            ],
                          ),
                          Icon(Icons.navigate_next_outlined),
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
                              Icon(Icons.explore_outlined),
                              SizedBox(width: 10,),
                              Text("Chính sách bảo mật",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 18),),
                            ],
                          ),
                          Icon(Icons.navigate_next_outlined),
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
                              Icon(Icons.speaker_notes_outlined),
                              SizedBox(width: 10,),
                              Text("Đóng góp ý kiến",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 18),),
                            ],
                          ),
                          Icon(Icons.navigate_next_outlined),
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
                              Icon(Icons.info_outlined),
                              SizedBox(width: 10,),
                              Text("Thông tin về chúng tôi",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 18),),
                            ],
                          ),
                          Icon(Icons.navigate_next_outlined),
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
                              Icon(Icons.logout_outlined,color: Colors.redAccent,),
                              SizedBox(width: 10,),
                              Text("Đăng xuất",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.redAccent),),
                            ],
                          ),
                          Icon(Icons.navigate_next_outlined,color: Colors.redAccent,),
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