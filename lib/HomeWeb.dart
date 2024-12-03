// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class HomeWeb extends StatefulWidget {
//   const HomeWeb({super.key});
//
//   @override
//   State<HomeWeb> createState() => _HomeWebState();
// }
//
// class _HomeWebState extends State<HomeWeb> {
//
//   TextEditingController idController = TextEditingController();
//   TextEditingController questionText = TextEditingController();
//   TextEditingController question1 = TextEditingController();
//   TextEditingController question2 = TextEditingController();
//   TextEditingController question3 = TextEditingController();
//   TextEditingController question4 = TextEditingController();
//   TextEditingController question5 = TextEditingController();
//   TextEditingController question6 = TextEditingController();
//   TextEditingController question7 = TextEditingController();
//   TextEditingController question8 = TextEditingController();
//   TextEditingController question9 = TextEditingController();
//   var txt = "";
//
//
//   @override
//   void initState() {
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     var questionList = [];
//
//     void addDocument() async {
//
//       var l = questionList.length;
//       if(question1.value.text.isNotEmpty) questionList.add("{\"$l\":" + "\""+question1.value.text+ "\"}");
//       l = questionList.length;
//       if(question2.value.text.isNotEmpty) questionList.add("{\"$l\":" + "\""+question2.value.text+ "\"}");
//       l = questionList.length;
//       if(question3.value.text.isNotEmpty) questionList.add("{\"$l\":" + "\""+question3.value.text+ "\"}");
//       l = questionList.length;
//       if(question4.value.text.isNotEmpty) questionList.add("{\"$l\":" + "\""+question4.value.text+ "\"}");
//       l = questionList.length;
//       if(question5.value.text.isNotEmpty) questionList.add("{\"$l\":" + "\""+question5.value.text+ "\"}");
//       l = questionList.length;
//       if(question6.value.text.isNotEmpty) questionList.add("{\"$l\":" + "\""+question6.value.text+ "\"}");
//       l = questionList.length;
//       if(question7.value.text.isNotEmpty) questionList.add("{\"$l\":" + "\""+question7.value.text+ "\"}");
//       l = questionList.length;
//       if(question8.value.text.isNotEmpty) questionList.add("{\"$l\":" + "\""+question8.value.text+ "\"}");
//       l = questionList.length;
//       if(question9.value.text.isNotEmpty) questionList.add("{\"$l\":" + "\""+question9.value.text+ "\"}");
//
//       print(questionList.toString());
//       try {
//         FirebaseFirestore db = FirebaseFirestore.instance;
//         DocumentReference docRef = db.collection('QuestionsData').doc('${idController.value.text}');
//         await docRef.set({
//           'question': questionText.value.text,
//           'questionsList': questionList,
//           'end': false
//         });
//         print('Document added successfully!');
//         setState(() {
//           txt = 'Document added successfully!';
//         });
//         questionList.clear();
//       } catch (e) {
//         print('Error adding document: $e');
//         setState(() {
//           txt = 'Error adding document:';
//         });
//
//       }
//     }
//
//
//     return Container(
//       child: Center(
//           child: Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             color: Colors.black54,
//
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(txt, style: TextStyle(color: Colors.white, fontSize: 40),),
//
//               SizedBox(
//                 width: 400,
//                 child: Material(
//                   elevation: 10.0,
//                   borderRadius: BorderRadius.circular(30),
//                   child: TextFormField(
//                     controller: idController,
//                     decoration: InputDecoration(
//                       hintText: 'ID',
//                       hintStyle: const TextStyle(
//                           fontSize: 15.0,
//                           color: Color(0xffA9A9A9),
//                           fontWeight: FontWeight.w500),
//                       contentPadding: const EdgeInsets.all(15),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//
//               SizedBox(
//                 width: 400,
//                 child: Material(
//                   elevation: 10.0,
//                   borderRadius: BorderRadius.circular(30),
//                   child: TextFormField(
//                     controller: questionText,
//                     decoration: InputDecoration(
//                       hintText: 'QuestionText',
//                       hintStyle: const TextStyle(
//                           fontSize: 15.0,
//                           color: Color(0xffA9A9A9),
//                           fontWeight: FontWeight.w500),
//                       contentPadding: const EdgeInsets.all(15),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 40,),
//
//
//
//               SizedBox(
//                 width: 400,
//                 child: Material(
//                   elevation: 10.0,
//                   borderRadius: BorderRadius.circular(30),
//                   child: TextFormField(
//                     controller: question1,
//                     decoration: InputDecoration(
//                       hintText: 'QuestionText',
//                       hintStyle: const TextStyle(
//                           fontSize: 15.0,
//                           color: Color(0xffA9A9A9),
//                           fontWeight: FontWeight.w500),
//                       contentPadding: const EdgeInsets.all(15),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: 400,
//                 child: Material(
//                   elevation: 10.0,
//                   borderRadius: BorderRadius.circular(30),
//                   child: TextFormField(
//                     controller: question2,
//                     decoration: InputDecoration(
//                       hintText: 'QuestionText',
//                       hintStyle: const TextStyle(
//                           fontSize: 15.0,
//                           color: Color(0xffA9A9A9),
//                           fontWeight: FontWeight.w500),
//                       contentPadding: const EdgeInsets.all(15),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: 400,
//                 child: Material(
//                   elevation: 10.0,
//                   borderRadius: BorderRadius.circular(30),
//                   child: TextFormField(
//                     controller: question3,
//                     decoration: InputDecoration(
//                       hintText: 'QuestionText',
//                       hintStyle: const TextStyle(
//                           fontSize: 15.0,
//                           color: Color(0xffA9A9A9),
//                           fontWeight: FontWeight.w500),
//                       contentPadding: const EdgeInsets.all(15),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: 400,
//                 child: Material(
//                   elevation: 10.0,
//                   borderRadius: BorderRadius.circular(30),
//                   child: TextFormField(
//                     controller: question4,
//                     decoration: InputDecoration(
//                       hintText: 'QuestionText',
//                       hintStyle: const TextStyle(
//                           fontSize: 15.0,
//                           color: Color(0xffA9A9A9),
//                           fontWeight: FontWeight.w500),
//                       contentPadding: const EdgeInsets.all(15),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: 400,
//                 child: Material(
//                   elevation: 10.0,
//                   borderRadius: BorderRadius.circular(30),
//                   child: TextFormField(
//                     controller: question5,
//                     decoration: InputDecoration(
//                       hintText: 'QuestionText',
//                       hintStyle: const TextStyle(
//                           fontSize: 15.0,
//                           color: Color(0xffA9A9A9),
//                           fontWeight: FontWeight.w500),
//                       contentPadding: const EdgeInsets.all(15),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: 400,
//                 child: Material(
//                   elevation: 10.0,
//                   borderRadius: BorderRadius.circular(30),
//                   child: TextFormField(
//                     controller: question6,
//                     decoration: InputDecoration(
//                       hintText: 'QuestionText',
//                       hintStyle: const TextStyle(
//                           fontSize: 15.0,
//                           color: Color(0xffA9A9A9),
//                           fontWeight: FontWeight.w500),
//                       contentPadding: const EdgeInsets.all(15),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: 400,
//                 child: Material(
//                   elevation: 10.0,
//                   borderRadius: BorderRadius.circular(30),
//                   child: TextFormField(
//                     controller: question7,
//                     decoration: InputDecoration(
//                       hintText: 'QuestionText',
//                       hintStyle: const TextStyle(
//                           fontSize: 15.0,
//                           color: Color(0xffA9A9A9),
//                           fontWeight: FontWeight.w500),
//                       contentPadding: const EdgeInsets.all(15),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: 400,
//                 child: Material(
//                   elevation: 10.0,
//                   borderRadius: BorderRadius.circular(30),
//                   child: TextFormField(
//                     controller: question8,
//                     decoration: InputDecoration(
//                       hintText: 'QuestionText',
//                       hintStyle: const TextStyle(
//                           fontSize: 15.0,
//                           color: Color(0xffA9A9A9),
//                           fontWeight: FontWeight.w500),
//                       contentPadding: const EdgeInsets.all(15),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: 400,
//                 child: Material(
//                   elevation: 10.0,
//                   borderRadius: BorderRadius.circular(30),
//                   child: TextFormField(
//                     controller: question9,
//                     decoration: InputDecoration(
//                       hintText: 'QuestionText',
//                       hintStyle: const TextStyle(
//                           fontSize: 15.0,
//                           color: Color(0xffA9A9A9),
//                           fontWeight: FontWeight.w500),
//                       contentPadding: const EdgeInsets.all(15),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//
//               InkWell(
//                 onTap: (){
//                   addDocument();
//                 },
//                 child: Container(
//                   margin: EdgeInsets.only(top: 10),
//                   height: 50,
//                   width: 300,
//                   decoration: BoxDecoration(
//                       color: Colors.orange,
//                     borderRadius: BorderRadius.circular(40)
//                   ),
//                   child: Center(child: Text("Save")),
//                 ),
//               ),
//
//             ],
//           ),
//           ),
//       ),
//     );
//   }
// }

import 'package:fixfinder/Widgets/Category.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWeb extends StatefulWidget {
  const HomeWeb({super.key});

  @override
  State<HomeWeb> createState() => _HomeWebState();
}

class _HomeWebState extends State<HomeWeb> {

  @override
  Widget build(BuildContext context) {
    final textStyleQuestion = GoogleFonts.merriweather(
      fontSize:  30,
      fontWeight: FontWeight.normal,
      textStyle: Theme.of(context).textTheme.displayLarge,
      color: Color(0XFFFF0083),
    );
    return Container(
      color: Color(0xFFF7F7F7),
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 20, top: 60, right: 20),
      child: SingleChildScrollView(
        child: Stack(
          children: [

            Visibility(
              visible: (MediaQuery.of(context).size.width > 150*5),
              child: Stack(
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 1),
                      child: Image.asset("assets/back4.png")),

                  Container(
                      margin: const EdgeInsets.only(top: 1),
                      child: Image.asset("assets/back2.png")),
                  Container(
                      margin: const EdgeInsets.only(top: 50),
                      child: Image.asset("assets/back3.png")),


                  Container(
                      margin: const EdgeInsets.only(top: 360),
                      child: Image.asset("assets/back.png")),

                ],
              ),
            ),



            if(MediaQuery.of(context).size.width > 150*8)
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 40, bottom: 60),
                  child: Text(
                    'FixFinder: Where Home Projects Find Their Perfect Pro',
                    style: textStyleQuestion,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Category(1, "Roof Repair", "assets/home.png", 231, 150, 18, price: 594,),
                      Category(50, "Fence Repair", "assets/fence.png",  231, 150, 18, price: 380,),
                      Category(106, "Decks & Porches", "assets/decks.png",  231, 150, 18, price: 1890,),
                      Category(380, "Home Painting", "assets/painting.png",  231, 150, 18),
                      Category(413, "Gutter Services", "assets/gutter.png",  231, 150, 18, price: 575,),
                      Category(117, "Plumbing", "assets/krant.png", 231, 150, 18, price: 210,),
                      ]
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Category(37, "Appliance Repair", "assets/loundry.png",  231, 150, 18, price: 264,),
                    Category(155, "AC Service", "assets/ac.png",  231, 150, 18),
                    Category(330, "Home Cleaning", "assets/armcheer.png",  231, 150, 18, price: 85,),
                    Category(91, "Cleaning", "assets/shower.png",  231, 150, 18),
                    Category(39, "Pest Control", "assets/spider.png",  231, 150, 18, price: 186,),
                    Category(349, "Electrician", "assets/drel.png",  231, 150, 18),

                  ],
                ),
              ],
            ) else if( MediaQuery.of(context).size.width > 150*5 && MediaQuery.of(context).size.width < 150*8)  const Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Category(1, "Roof Repair", "assets/home.png", 231, 150, 18),
                      Category(50, "Fence Repair", "assets/fence.png",  231, 150, 18),
                      Category(106, "Decks & Porches", "assets/decks.png",  231, 150, 18),
                      Category(380, "Home Painting", "assets/painting.png",  231, 150, 18),
                    ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Category(413, "Gutter Services", "assets/gutter.png",  231, 150, 18),
                    Category(117, "Plumbing", "assets/krant.png", 231, 150, 18),
                    Category(37, "Appliance Repair", "assets/loundry.png",  231, 150, 18),
                    Category(155, "AC Service", "assets/ac.png",  231, 150, 18),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Category(330, "Home Cleaning", "assets/armcheer.png",  231, 150, 18),
                    Category(91, "Cleaning", "assets/shower.png",  231, 150, 18),
                    Category(39, "Pest Control", "assets/spider.png",  231, 150, 18),
                    Category(349, "Electrician", "assets/drel.png",  231, 150, 18),
                  ],
                ),
              ],
            )else const Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Category(1, "Roof Repair", "assets/home.png", 231, 150, 18),
                      Category(50, "Fence Repair", "assets/fence.png",  231, 150, 18),
                    ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Category(106, "Decks & Porches", "assets/decks.png",  231, 150, 18),
                    Category(380, "Home Painting", "assets/painting.png",  231, 150, 18),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Category(413, "Gutter Services", "assets/gutter.png",  231, 150, 18),
                    Category(117, "Plumbing", "assets/krant.png", 231, 150, 18),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Category(37, "Appliance Repair", "assets/loundry.png",  231, 150, 18),
                    Category(155, "AC Service", "assets/ac.png",  231, 150, 18),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Category(330, "Home Cleaning", "assets/armcheer.png",  231, 150, 18),
                    Category(91, "Cleaning", "assets/shower.png",  231, 150, 18),

                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Category(39, "Pest Control", "assets/spider.png",  231, 150, 18),
                    Category(349, "Electrician", "assets/drel.png",  231, 150, 18),

                  ],
                ),

              ],
            )  ,
          ],
        )
      ),
    );
  }
}

