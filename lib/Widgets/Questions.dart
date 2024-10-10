import 'package:fixfinder/Widgets/CoreButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Network/QuestionsData.dart';
import 'QuestionButton.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

var questions = QuestionsData(id: 1, question:  "3123213");

var list = [questions, questions, questions];
int selectedIndex = 1000;

class _QuestionsState extends State<Questions> {


  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.robotoMono(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      textStyle: Theme.of(context).textTheme.displayLarge,
    );

    final textStyleQuestion = GoogleFonts.robotoMono(
      fontSize: 27,
      fontWeight: FontWeight.bold,
      textStyle: Theme.of(context).textTheme.displayLarge,
    );
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: Center(
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 20),
                padding: EdgeInsets.only(left: 10, right: 10, top: 20),
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
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text( "How can we help?", style: textStyleQuestion, textAlign: TextAlign.center,),
                  SizedBox(height: 20,),
                  Container(
                    height: MediaQuery.of(context).size.width/1.8,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 60,
                          child: QuestionButton(
                              text: list[index].question.toString(),
                              backgroundColor: Colors.white,
                              lineColor: Colors.greenAccent,
                              textColor: Colors.black,
                              index: index,
                              textSize: 14,
                              maxIndex: list.length-1,
                              selected: selectedIndex == index,
                              onTap: (){
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 58,
                          width: MediaQuery.of(context).size.width/2-30,
                          child: CoreButton(textSize: 14, text: "Tap Me", onTap: () {}, lineColor: Color(0xFF5CF801), backgroundColor: Colors.white, textColor:  Color(0xFF5CF801))),
                      SizedBox(width: 10,),
                      Container(
                          height: 58,
                          width: MediaQuery.of(context).size.width/2-30,
                          child: CoreButton(textSize: 14, text: "Tap Me", onTap: () {}, lineColor:  Color(0xFF5CF801), backgroundColor: Color(0xFF5CF801), textColor:  Colors.white,))
                    ],
                  )
                ],
              ),
            ),
          ))),
    );
  }
}
