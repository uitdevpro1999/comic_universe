import 'package:comic_universe/controllers/categories_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
class AddCate extends StatefulWidget{
  AddCate({Key? key}) : super (key: key);
  _AddCateState createState() => _AddCateState();
}
class _AddCateState extends State<AddCate>{
  TextEditingController _name = TextEditingController();
  @override
  Widget build(BuildContext context){
    CategoryController categoryController = Get.put((CategoryController()));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, elevation: 0.0,
          title: Text("Thêm thể loại"),
          centerTitle: true,
        ),
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GetBuilder<CategoryController>(
                init: CategoryController(),
                  builder: (controller) {
                       if (controller.image?.value?.path==null){
                         return Container(
                           margin: const EdgeInsets.only(top: 50,left: 100,right: 100,bottom: 20),
                           height: 200,
                           width: 200,
                           child:CircleAvatar(
                             backgroundImage: NetworkImage("https://i.pinimg.com/736x/de/59/4e/de594ec09881da3fa66d98384a3c72ff.jpg"),
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
                                       categoryController.pickImage();
                                     },
                                   ),
                                 )
                             ),
                           ),
                         );
                       }
                       return Container(
                         margin: const EdgeInsets.only(top: 50,left: 100,right: 100,bottom: 20),
                         height: 200,
                         width: 200,
                         child:CircleAvatar(
                           backgroundImage: FileImage(categoryController.image?.value as File),
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
                                     categoryController.pickImage();
                                   },
                                 ),
                               )
                           ),
                         ),
                       );
                  }
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  style: GoogleFonts.dosis(),
                  controller: _name,
                  decoration:  InputDecoration(
                      icon: Icon(Icons.category_outlined),
                      hintText: "Tên thể loại",
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
              SizedBox(height: MediaQuery.of(context).size.height/6,),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width/2,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.black),
                child: TextButton(onPressed: (){
                  categoryController.createCate(categoryController.image?.value, _name.text.trim());
                }, child: Text("Xác nhận",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 18),),),
              ),
            ],
          ),
        ),
      )
    );
  }
}