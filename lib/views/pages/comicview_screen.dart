import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:google_fonts/google_fonts.dart';
class View extends StatefulWidget {
  String name;
  String chapterurl;
  View({Key? key, required this.name, required this.chapterurl}): super (key: key);
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.name),
      ),
      body: Container(
          child: const PDF(swipeHorizontal: true).cachedFromUrl(
            widget.chapterurl,
            maxAgeCacheObject:Duration(hours: 5), //duration of cache
            placeholder: (progress) => Center(child: Text('Đang tải $progress %',style: GoogleFonts.dosis(fontSize: 24),)),
            errorWidget: (error) => Center(child: Text(error.toString())),
          )
      )
    );
  }
}
