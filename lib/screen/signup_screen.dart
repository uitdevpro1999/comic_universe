import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget{
  SignupScreen({Key? key}): super (key: key);
  @override
  _SignupScreenState createState() => _SignupScreenState();
}
class _SignupScreenState extends State<SignupScreen>{
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
                  child: TextButton(onPressed: (){}, child: Text("Đăng ký",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 18),),),
                ),
              ],
            ),
          )
      ),
    );
  }
}