import 'package:comic_universe/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../ultils/contrains.dart';

class EditPrScreen extends StatefulWidget{
  EditPrScreen({Key? key}) : super (key: key);
  @override
  _EditPrScreenState createState() => _EditPrScreenState();
}
class _EditPrScreenState extends State<EditPrScreen>{
  UserController userController = Get.put(UserController());
  TextEditingController _name =TextEditingController();
  @override
  void initState() {
    _name.text = userController.user['profilename'];
    // TODO: implement initState
    super.initState();
  }
  void dispose(){
    _name.clear();
    super.dispose();

  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, elevation: 0.0,
        title: Text("Chỉnh sửa hồ sơ"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
        child:  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/3,),
              Container(
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  style: GoogleFonts.dosis(),
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
                  userController.updateName(_name.text.trim());
                }, child: Text("Xác nhận",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 18),),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}