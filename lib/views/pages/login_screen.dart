import 'package:comic_universe/views/pages/forgotpass_screen.dart';
import 'package:comic_universe/views/widgets/bottom_navigation.dart';
import 'package:comic_universe/views/pages/signup_screen.dart';
import 'package:comic_universe/views/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_toast/motion_toast.dart';

import '../../ultils/contrains.dart';

class LoginScreen extends StatefulWidget{
  LoginScreen({Key? key}): super (key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen>{
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  Widget build(BuildContext context){
    return Scaffold(
       body: SingleChildScrollView(
         child: Container(
           padding: EdgeInsets.fromLTRB(22, 114, 22, 0),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text("Đăng nhập\nTài khoản",style: GoogleFonts.dosis(fontSize: 48,fontWeight: FontWeight.w600),),
               SizedBox(height: 50,),
               TextFormField(
                 controller: _email,
                 decoration:  InputDecoration(
                   icon: Icon(Icons.email),
                   hintText: "Email",
                   hintStyle: GoogleFonts.dosis(fontSize: 16) ,
                   enabledBorder: OutlineInputBorder(
                     borderSide: const BorderSide(width: 3),
                     borderRadius: BorderRadius.circular(15),
                   ),
                     focusedBorder: OutlineInputBorder(
                       borderSide: const BorderSide(width: 3),
                       borderRadius: BorderRadius.circular(15),
                     )
                   ),
                 ),
               SizedBox(height: 5,),
               TextFormField(
                 controller: _pass,
                 decoration:  InputDecoration(
                     icon: Icon(Icons.lock),
                     hintText: "Mật khẩu",
                     hintStyle: GoogleFonts.dosis(fontSize: 16) ,
                     enabledBorder: OutlineInputBorder(
                       borderSide: const BorderSide(width: 3),
                       borderRadius: BorderRadius.circular(15),
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderSide: const BorderSide(width: 3),
                       borderRadius: BorderRadius.circular(15),
                     )
                 ),
               ),
               SizedBox(height: 40,),
               Container(
                 height: 50,
                 width: MediaQuery.of(context).size.width,
                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.black),
                 child: TextButton(
                     onPressed: () async {
                       authController.login(_email.text.trim(),
                           _pass.text.trim());
                     },
                 child: Text("Đăng nhập",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 18),),),
               ),
               SizedBox(height: 20,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   TextButton(onPressed: (){

                     Navigator.pushReplacement(
                       context,
                       MaterialPageRoute(builder: (context) => ForgotScreen()),
                     );
                   }, child: Text("Quên mật khẩu",style: GoogleFonts.dosis(color: Colors.black),)),
                   TextButton(onPressed: (){
                     Navigator.pushReplacement(
                       context,
                       MaterialPageRoute(builder: (context) => SignupScreen()),
                     );
                   }, child: Text("Đăng ký tài khoản",style: GoogleFonts.dosis(color: Colors.black),)),
                 ],),
             ],
           ),
         )
       ),
    );
  }
}