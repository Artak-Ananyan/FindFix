import 'package:fixfinder/Pages/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/CoreButton.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {

    final textStyleQuestion = GoogleFonts.merriweather(
      fontSize:  30,
      fontWeight: FontWeight.normal,
      textStyle: Theme.of(context).textTheme.displayLarge,
      color: Color(0XFFFF0083),
    );

    final style2 = GoogleFonts.merriweather(

      fontSize: 16,
      fontWeight: FontWeight.w700,
      textStyle: Theme.of(context).textTheme.displayLarge,
      color: const Color(0xFF4A4A4A),
    );
    return Scaffold(
        backgroundColor: Color(0xFFF7F7F7),
        body: Container(
          child: Stack(
            children:[

              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.width/1.2),
               child: Image.asset(height: MediaQuery.of(context).size.width, width: MediaQuery.of(context).size.width, "assets/back_spl.png", fit: BoxFit.cover,),

            ),
              Align(
                alignment: FractionalOffset.topCenter,
               child: Container(
                   margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/10),
                   child: Image.asset(height:100, width:100, "assets/icon.png")),

            ),
    Align(
    alignment: FractionalOffset.center,
            child:  Container(
                margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height/2),
                child: Text("Welcome to Fixfinder!", style: textStyleQuestion,),
              )),
              Align(
                alignment: FractionalOffset.center,
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20,bottom: MediaQuery.of(context).size.height/6),
                  child: Text("Discover the fastest way to resolve your everyday issues with Fixfinder. Whether it’s home repairs or tech glitches, we connect you with the right professionals to get the job done quickly and efficiently. Join our community and start simplifying your life today!",
                    style: style2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),


              Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 40),
                  child: SizedBox(
                      height: 58,
                      width: MediaQuery.of(context).size.width / 2 - 30,
                      child: CoreButton(
                          textSize: 18,
                          text: "Start",
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                                  (Route<dynamic> route) => false,
                            );

                          },
                          lineColor: const Color(0xFFFF0083),
                          backgroundColor: const Color(0xFFFF0083),
                          textColor: Colors.white
                      )
                  ),
                ),
              )



            ]
          ),

        ));
  }
}
