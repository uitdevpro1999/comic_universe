import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../ultils/contrains.dart';
import '../widgets/bottom_navigation.dart';

class EditPScreen extends StatefulWidget{
  String email;
  String pass;
  EditPScreen({Key? key, required this.email,required this.pass}) : super (key: key);
  @override
  _EditPScreenState createState() => _EditPScreenState();
}
class _EditPScreenState extends State<EditPScreen>{
  TextEditingController _name =TextEditingController();
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
        child:  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text("Chỉnh sửa hồ sơ",style: GoogleFonts.dosis(fontSize: 24,fontWeight: FontWeight.w600),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/3,),
              Container(
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  controller: _name,
                  decoration:  InputDecoration(
                      icon: Icon(Icons.person_add_alt_outlined),
                      hintText: "Họ và Tên",
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
              ),
              SizedBox(height: MediaQuery.of(context).size.height/3,),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width/2,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.black),
                child: TextButton(onPressed: (){
                  authController.register(widget.email, widget.pass, _name.text.trim());
                }, child: Text("Xác nhận",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 18),),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}