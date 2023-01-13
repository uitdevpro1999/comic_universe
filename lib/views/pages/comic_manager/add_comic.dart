import 'dart:io';
import 'package:comic_universe/controllers/categories_controller.dart';
import 'package:comic_universe/controllers/comic_controller.dart';
import 'package:comic_universe/models/category_model.dart';
import 'package:comic_universe/models/comic_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
class AddComic extends StatefulWidget{
  AddComic({Key? key}): super (key: key);
  _AddComicState createState() => _AddComicState();
}
 class _AddComicState extends State<AddComic>{
  CategoryController categoryController = Get.put(CategoryController());
  ComicController comicController = Get.put(ComicController());
  TextEditingController textEditingController = TextEditingController();
  CategoriesModel? selectedValue;
  TextEditingController plot = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController characters = TextEditingController();
  TextEditingController author = TextEditingController();
  @override
  void initState() {
    categoryController.getListCate();
    super.initState();
  }
   Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent, elevation: 0.0,
          title: Text("Thêm truyện"),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GetBuilder<ComicController>(
                    init: ComicController(),
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
                                      comicController.pickImage();
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
                          backgroundImage: FileImage(comicController.image?.value as File),
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
                                    comicController.pickImage();
                                  },
                                ),
                              )
                          ),
                        ),
                      );
                    }
                ),
               Obx((){
                 return  DropdownButtonHideUnderline(
                   child: DropdownButton2(
                     isExpanded: true,
                     hint: Text(
                       'Chọn thể loại',
                       style: TextStyle(
                         fontSize: 14,
                         color: Theme.of(context).hintColor,
                       ),
                     ),
                     items: categoryController.listCate
                         .map((item) => DropdownMenuItem<CategoriesModel>(
                       value: item,
                       child: Text(
                         item.catename,
                         style: const TextStyle(
                           fontSize: 14,
                         ),
                       ),
                     ))
                         .toList(),
                     value: selectedValue,
                     onChanged: (value) {
                       setState(() {
                         selectedValue = value as CategoriesModel;
                       });
                     },
                     buttonHeight: 40,
                     buttonWidth: 200,
                     itemHeight: 40,
                     dropdownMaxHeight: 200,
                     searchController: textEditingController,
                     searchInnerWidget: Padding(
                       padding: const EdgeInsets.only(
                         top: 8,
                         bottom: 4,
                         right: 8,
                         left: 8,
                       ),
                       child: TextFormField(
                         controller: textEditingController,
                         decoration: InputDecoration(
                           isDense: true,
                           contentPadding: const EdgeInsets.symmetric(
                             horizontal: 10,
                             vertical: 8,
                           ),
                           hintText: 'Search for an item...',
                           hintStyle: const TextStyle(fontSize: 12),
                           border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(8),
                           ),
                         ),
                       ),
                     ),
                     searchMatchFn: (item, searchValue) {
                       return (item.value.catename.toString().contains(searchValue));
                     },
                     //This to clear the search value when you close the menu
                     onMenuStateChange: (isOpen) {
                       if (!isOpen) {
                         textEditingController.clear();
                       }
                     },
                   ),
                 );
               }
               ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    style: GoogleFonts.dosis(),
                    controller: name,
                    decoration:  InputDecoration(
                        icon: Icon(Icons.edit_outlined),
                        hintText: "Tên Truyện",
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
                SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    style: GoogleFonts.dosis(),
                    controller: author,
                    decoration:  InputDecoration(
                        icon: Icon(Icons.person_outline),
                        hintText: "Tác giả",
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
                SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    style: GoogleFonts.dosis(),
                    controller: characters,
                    decoration:  InputDecoration(
                        icon: Icon(Icons.person_add_alt_outlined),
                        hintText: "Nhân vật",
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
                SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    style: GoogleFonts.dosis(),
                    controller: plot,
                    decoration:  InputDecoration(
                        icon: Icon(Icons.book_online_outlined),
                        hintText: "Cốt truyện",
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
                SizedBox(height: MediaQuery.of(context).size.height/15,),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width/2,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.black),
                  child: TextButton(onPressed: (){
                    print(selectedValue?.id);
                    comicController.createComic(comicController.image?.value, name.text.trim(), selectedValue!, plot.text.trim(), characters.text.trim(), author.text.trim());
                  }, child: Text("Xác nhận",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 18),),),
                ),
                SizedBox(height: 10,),
              ],
            ),
          ),
        )
    );
  }
 }