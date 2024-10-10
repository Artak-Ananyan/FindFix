
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Questions.dart';

class Category extends StatefulWidget {
  Category(String this.categoryName, this.imagePath, this.height, this.width, this.textSize, {super.key});

  final String categoryName;
  final String imagePath;
  final double height;
  final double width;
  final double textSize;

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.robotoMono(
      fontSize: widget.textSize,
      fontWeight: FontWeight.bold,
      textStyle: Theme.of(context).textTheme.displayLarge,
    );
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      onTap: (){
    Navigator.push(context,MaterialPageRoute(builder: (context) => Questions()),);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: Color(0xFFFCFFF6),
          border: Border.all(
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(widget.imagePath, width: widget.width-70, height:  widget.height-70,),
            SizedBox(height: 4,),
            Text(widget.categoryName, style: textStyle, textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}
