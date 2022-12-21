import 'package:comic_universe/ultils/contrains.dart';
import 'package:comic_universe/views/pages/editname_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget{
  SignupScreen({Key? key}): super (key: key);
  @override
  _SignupScreenState createState() => _SignupScreenState();
}
class _SignupScreenState extends State<SignupScreen>{
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
                Text("Đăng ký\nTài khoản",style: GoogleFonts.dosis(fontSize: 48,fontWeight: FontWeight.w600),),
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
                  obscureText: true,
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
                  child: TextButton(onPressed: ()async{

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => EditPScreen(email: _email.text.trim(),pass: _pass.text.trim(),)),
                    );
                  }, child: Text("Tiếp tục",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 18),),),
                ),
              ],
            ),
          )
      ),
    );
  }
}