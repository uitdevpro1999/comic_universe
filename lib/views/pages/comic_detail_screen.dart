import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComicDetail extends StatefulWidget{
  ComicDetail({Key? key}) : super (key: key);
  @override
  _ComicDetailState createState() => _ComicDetailState();
}
class _ComicDetailState extends State<ComicDetail>{
  bool _expanded1 = true;
  bool _expanded2 = true;
  bool _expanded3 = true;
  bool _expanded4 = true;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width/2,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage("https://zingaudio.net/wp-content/uploads/2020/10/yeu-than-ky.jpg"),fit: BoxFit.cover),
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        child: Align(
                          alignment: FractionalOffset.bottomLeft,
                          child:  Container(
                            color: Colors.black,
                            height: 30,
                            width: 160,
                            child: InkWell(
                              onTap: (){
                              },
                              child: Text("Võ luyện đỉnh phong",style: GoogleFonts.dosis(color: Colors.white,fontSize: 20),),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Align(
                          alignment: FractionalOffset.bottomRight,
                          child:  Container(
                            color: Colors.black,
                            height: 30,
                            width: 70,
                            child: Row(
                              children: [
                                Icon(Icons.remove_red_eye_outlined, color: Colors.white,size: 20,),
                                SizedBox(width: 5,),
                                Text("500",style: GoogleFonts.dosis(color: Colors.white,fontSize: 20),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        color: Colors.green,
                        child: ExpansionPanelList(
                          animationDuration: Duration(milliseconds: 2000),
                          children: [
                            ExpansionPanel(
                              headerBuilder: (context, isExpanded) {
                                return ListTile(
                                  title: Text("Cốt truyện",style: GoogleFonts.dosis(fontSize: 24,fontWeight: FontWeight.w600),),
                                );
                              },
                              body: Text("Một câu truyện kỳ ảo giữa trời đông, một nàng tiên cá xuất hiện và ....",style: GoogleFonts.dosis(fontSize: 15)),
                              isExpanded: _expanded1,
                              canTapOnHeader: true,
                            ),
                          ],
                          dividerColor: Colors.grey,
                          expansionCallback: (panelIndex, isExpanded) {
                            _expanded1 = !_expanded1;
                            setState(() {
                            });
                          },

                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        color: Colors.green,
                        child: ExpansionPanelList(
                          animationDuration: Duration(milliseconds: 2000),
                          children: [
                            ExpansionPanel(
                              headerBuilder: (context, isExpanded) {
                                return ListTile(
                                  title: Text("Nhân vật",style: GoogleFonts.dosis(fontSize: 24,fontWeight: FontWeight.w600),),
                                );
                              },
                              body: Text("Một câu truyện kỳ ảo giữa trời đông, một nàng tiên cá xuất hiện và ....",style: GoogleFonts.dosis(fontSize: 15)),
                              isExpanded: _expanded2,
                              canTapOnHeader: true,
                            ),
                          ],
                          dividerColor: Colors.grey,
                          expansionCallback: (panelIndex, isExpanded) {
                            _expanded2 = !_expanded2;
                            setState(() {
                            });
                          },

                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        color: Colors.green,
                        child: ExpansionPanelList(
                          animationDuration: Duration(milliseconds: 2000),
                          children: [
                            ExpansionPanel(
                              headerBuilder: (context, isExpanded) {
                                return ListTile(
                                  title: Text("Tác giả",style: GoogleFonts.dosis(fontSize: 24,fontWeight: FontWeight.w600),),
                                );
                              },
                              body: Text("Một câu truyện kỳ ảo giữa trời đông, một nàng tiên cá xuất hiện và ....",style: GoogleFonts.dosis(fontSize: 15)),
                              isExpanded: _expanded3,
                              canTapOnHeader: true,
                            ),
                          ],
                          dividerColor: Colors.grey,
                          expansionCallback: (panelIndex, isExpanded) {
                            _expanded3 = !_expanded3;
                            setState(() {
                            });
                          },

                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
         Positioned(
            child: new Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width/2,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.black),
                child: TextButton(onPressed: (){
                }, child: Text("Đọc truyện",style: GoogleFonts.dosis(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 18),),),
              ),
           )
        ),

        ],

      ),

    );
  }
}