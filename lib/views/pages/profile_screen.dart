import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:comic_universe/controllers/user_controller.dart';
import 'package:comic_universe/ultils/contrains.dart';
import 'package:comic_universe/views/pages/contact_us.dart';
import 'package:comic_universe/views/pages/editprofile_screen.dart';
import 'package:comic_universe/views/pages/manager_screen.dart';
import 'package:comic_universe/views/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class ProfileScreen extends StatefulWidget{
  ProfileScreen({Key? key}) : super (key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen>{
  final UserController userController = Get.put(UserController());
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             GetBuilder<UserController>(
                init: UserController(),
                builder: (controller){
                  if(controller.user.isEmpty){
                    return CircularProgressIndicator();
                  }
                  return Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(top: 50,left: 100,right: 100,bottom: 20),
                         height: 200,
                         width: 200,
                        child:CircleAvatar(
                              backgroundImage: NetworkImage(controller.user['imageurl']),
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
                                            onPressed: (){
                                            userController.pickImage();
                           },
                         ),
                         )
                       ),
                      ),
                      ),
                      Text(controller.user['profilename'],style: GoogleFonts.dosis(fontSize: 24,fontWeight: FontWeight.w600),),

                    ],);
                },
              ),
            SizedBox(height: 30,),
            SingleChildScrollView(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 5, right: 5,top:10),
                  children: [
                    InkWell(
                    onTap: (){
                      Get.to(EditPrScreen());
                    },
                    child: Container(
                      height: 50,
                      child: Center(
                        child:  Row(
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
                      )
                    ),
                    ),
                    InkWell(
                      onTap: (){
                        var toast = CustomToast(msg: "Chúng tôi luôn bảo mật thông tin của bạn mọi lúc, mọi nơi ^_^");
                        toast.showSuccessToast();
                      },
                      child: Container(
                        height: 50,
                        child: Center(
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
                      ),
                    ),
                    InkWell(
                       onTap: (){
                         var toast = CustomToast(msg: "Vui lòng gửi email đến nqtrung1999@gmail.com");
                         toast.showSuccessToast();
                       },
                      child: Container(
                        height: 50,
                        child: Center(
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
                      ),
                    ),
                   InkWell(
                     onTap: (){
                       Get.to(ContactScreen());
                     },
                     child:  Container(
                       height: 50,
                       child: Center(
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
                     ),
                   ),
                   userController.user['role'] == "admin" ?
                   Container(
                       height: 50,
                       child: InkWell(
                         onTap: (){
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => ManagerScreen()),
                           );
                         },
                         child: Center(
                           child: Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Row(
                                 children: [
                                   Icon(Icons.manage_accounts_outlined),
                                   SizedBox(width: 10,),
                                   Text("Công cụ quản trị",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 18),),
                                 ],
                               ),
                               Icon(Icons.navigate_next_outlined),
                             ],
                           ),
                         ),
                       )
                   )
                    :
                      Container(),
                    Container(
                      height: 50,
                      child: InkWell(
                        onTap: () async {
                          authController.signOut();
                        },
                        child: Center(
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