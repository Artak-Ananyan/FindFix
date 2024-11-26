
import 'package:fixfinder/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Pages/Questions.dart';

class Category extends StatefulWidget {
  const Category(this.id, this.categoryName, this.imagePath, this.height, this.width, this.textSize, {super.key});

  final String categoryName;
  final String imagePath;
  final double height;
  final double width;
  final double textSize;
  final int id;


  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

  @override
  Widget build(BuildContext context) {

    final textStyle = GoogleFonts.lato(
      fontSize: widget.textSize,
      fontWeight: FontWeight.bold,
      color: Colors.black.withOpacity(0.6),
      textStyle: Theme.of(context).textTheme.displayLarge,
    );

    final textStyle2 = GoogleFonts.lato(
      fontSize: widget.textSize/1.3,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      textStyle: Theme.of(context).textTheme.displayLarge,
    );

    final textStyle3 = GoogleFonts.lato(
      fontSize: widget.textSize/1.7,
      fontWeight: FontWeight.bold,
      color: Colors.black26,
      textStyle: Theme.of(context).textTheme.displayLarge,
    );
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      onTap: (){
        MyApp.infoData.category = widget.categoryName;
        Navigator.push(context,MaterialPageRoute(builder: (context) => Questions(widget.id)),);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),

          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black26.withOpacity(0.04),
              spreadRadius: 3,
              blurRadius: 3,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Column(
            children: [
              Image.asset(widget.imagePath, width: 106, height:  106,),
              const SizedBox(height: 10,),
              Text(widget.categoryName, style: textStyle, textAlign: TextAlign.center,),
              const SizedBox(height: 10,),
              Container(
                width: widget.width,
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF0083),
                  borderRadius: BorderRadius.circular(6),
                    boxShadow: const [
                BoxShadow(
                color:  Color(0x5EFF0083),
                spreadRadius: 1,
                blurRadius: 29,
                offset: Offset(0, 10), // changes position of shadow
              )]
                ),
                height:  40,
                child: Center(
                  child: Text("START", style: textStyle2),
                ),
                ),
              Text("From 500\$", style: textStyle3, textAlign: TextAlign.center,),

            ],
          ),
        ),
      ),
    );
  }
}
