import 'package:comic_universe/controllers/categories_controller.dart';
import 'package:comic_universe/views/pages/category_manager/add_category.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
class CateManager extends StatefulWidget{
  CateManager({Key? key})  : super (key: key);
  @override
  _CateManagerState createState() => _CateManagerState();
}
class _CateManagerState extends State<CateManager>{
  final CategoryController categoryController = Get.put(CategoryController());
  @override
  void initState() {
    super.initState();
    categoryController.getListCate();
  }
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              if(categoryController.listCate.isEmpty){
                return Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height/2,),
                    Row(
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width/3.6,),
                        Text("Chưa có thể loại nào",style: GoogleFonts.dosis(fontSize: 24,fontWeight: FontWeight.w600),),
                      ],
                    )
                  ],
                );
              }
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: categoryController.listCate.length,
                  itemBuilder: (context, index){
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      margin: EdgeInsets.only(left: 5,bottom: 5),
                      height: 75,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height,
                            width: 118,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage(categoryController.listCate[index].imageurl),fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(categoryController.listCate[index].catename,style: GoogleFonts.dosis(fontWeight: FontWeight.w600,fontSize: 18),),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
              );
            }
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.to(AddCate());
        },
        child: Icon(Icons.edit_outlined),
      ),
    );
  }
}