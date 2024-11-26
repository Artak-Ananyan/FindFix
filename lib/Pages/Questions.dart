import 'dart:core';
import 'package:fixfinder/Network/InfoData.dart';
import 'package:fixfinder/Pages/UserAboutAddress.dart';
import 'package:fixfinder/Widgets/CoreButton.dart';
import 'package:fixfinder/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Network/QuestionsData.dart';
import '../Widgets/QuestionButton.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'LocationAnimation.dart';

class Questions extends StatefulWidget {
  final int id;

  const Questions(this.id, {super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {

  final TextEditingController importantNotes = TextEditingController();

  late  Future<LottieComposition> _composition;
  int selectedIndex = 1000;
  QuestionsData? selectedQuestion;
  List<dynamic>? questionList = []; // Made it nullable and defaulted to empty list


  bool isLoaded = false;

  Future<void> fetchDocument() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    DocumentReference docRef = db.collection('QuestionsData').doc(widget.id.toString());

    try {
      DocumentSnapshot doc = await docRef.get();
      if (doc.exists) {
        await Future.delayed(const Duration(seconds: 1));  // Add a 2-second delay
        setState(() {
          selectedQuestion = QuestionsData.fromMap(doc.data() as Map<String, dynamic>);
          questionList = selectedQuestion?.questionsList ?? [];
          Future.delayed(const Duration(milliseconds: 100000));
          isLoaded = true;
        });
      } else {
        print("No such document!");
      }
    } catch (e) {
      print("Error fetching document: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _composition = AssetLottie("assets/briliant.json").load();

    if(widget.id!=0) {
      fetchDocument();
    }else{
      isLoaded = true;
    }
  }


  @override
  Widget build(BuildContext context) {

    void closeKeyboard(BuildContext context) async {
      FocusScopeNode currentFocus = FocusScope.of(context);

      if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
        FocusManager.instance.primaryFocus!.unfocus();
      }
    }


    final textStyle = GoogleFonts.lato(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      textStyle: Theme.of(context).textTheme.displayLarge,
    );

    final textStyleQuestion = GoogleFonts.merriweather(
      fontSize:  30,
      fontWeight: FontWeight.normal,
      textStyle: Theme.of(context).textTheme.displayLarge,
      color: Colors.black54,
    );


    return Scaffold(
      body: isLoaded ? Visibility(
        visible: MediaQuery.of(context).size.height>360,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child:  kIsWeb ? Stack(
              children: [
                Visibility(
                  visible: (MediaQuery.of(context).size.width > 150*8),
                  child: Container(
                    child: Stack(
                      children: [
                        Container(
                            child: Image.asset("assets/back4.png")),

                        Container(
                            child: Image.asset("assets/back3.png")),


                      ],
                    ),
                  ),
                ),

                Container(
                    margin: const EdgeInsets.only(top: 100, left: 20, right:  20),
                    child: Column(
                      children: [
                        Text(
                          selectedQuestion?.question.toString() ?? 'Please tell us a little about your project.',
                          style: textStyleQuestion,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        widget.id != 0 ?
                          SizedBox(
                            height: (questionList?.length ?? 0) < 4
                                ? (questionList?.length ?? 0) * 116
                                : ((questionList?.length ?? 0) * 100 >= MediaQuery.of(context).size.height - 340
                                ? MediaQuery.of(context).size.height - 340
                                : (questionList?.length ?? 0) * 100),

                            child: ListView.builder(
                              itemCount: questionList?.length ?? 0,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin:  EdgeInsets.only(top:16,
                                      left:  MediaQuery.of(context).size.width > 150*8 ?
                                      MediaQuery.of(context).size.width/3 :
                                      (MediaQuery.of(context).size.width > 150*5 && MediaQuery.of(context).size.width < 150*8) ?
                                      MediaQuery.of(context).size.width/4
                                          : MediaQuery.of(context).size.width/30,
                                      right:   MediaQuery.of(context).size.width > 150*8 ?
                                      MediaQuery.of(context).size.width/3 :
                                      (MediaQuery.of(context).size.width > 150*5 && MediaQuery.of(context).size.width < 150*8) ?
                                      MediaQuery.of(context).size.width/4
                                          : MediaQuery.of(context).size.width/30),
                                  height: 70,
                                  child: QuestionButton(
                                    text: questionList?[index].values.first ?? 'N/A',
                                    backgroundColor: const Color(0xFFE4E4E4),
                                    lineColor: const Color(0xFFFF0083),
                                    textColor: const Color(0xFF4A4A4A),
                                    index: index,
                                    textSize: MediaQuery.of(context).size.width > 150*8 ? MediaQuery.of(context).size.width/70 :
                                    (MediaQuery.of(context).size.width > 150*5 && MediaQuery.of(context).size.width < 150*8) ? MediaQuery.of(context).size.width/50
                                      : MediaQuery.of(context).size.width/28,
                                    maxIndex: questionList!.length - 1,
                                    selected: selectedIndex == index,
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                    },
                                  ),
                                );
                              },
                            ),
                          )
                        : Padding(
                          padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width > 1380 ?MediaQuery.of(context).size.width/3 : MediaQuery.of(context).size.width/10 , right: MediaQuery.of(context).size.width > 1380 ?MediaQuery.of(context).size.width/3 : MediaQuery.of(context).size.width/10),
                          child: TextField(
                            cursorColor: const Color(0xFFFF0083),
                            maxLength: 2600,
                            maxLines : 5, // add this
                            style: const TextStyle(color: Color(0xFFFF0083)),
                            controller: importantNotes,
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFFF0083), width: 2.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(4)),
                                borderSide: BorderSide(width: 2,color: Color(0xFFFF0083)),
                              ),

                              hintText: 'How can a pro help you? The more details the better - it helps pros provide the most accurate quote! (Optional)',
                              hintStyle: TextStyle(
                                color: Colors.grey, fontSize: 16,),
                            ),
                          ),
                        ),
                        kIsWeb ? Container(
                          margin: const EdgeInsets.only(top: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 58,
                                width: MediaQuery.of(context).size.width > 150*8 ?
                                MediaQuery.of(context).size.width/7 :
                                (MediaQuery.of(context).size.width > 150*5 && MediaQuery.of(context).size.width < 150*8) ?
                                MediaQuery.of(context).size.width/3
                                    : MediaQuery.of(context).size.width/2.6,
                                child: CoreButton(
                                    textSize: 18,
                                    text: "Previous",
                                    onTap: () async {
                                      closeKeyboard(context);
                                      await Future.delayed(const Duration(milliseconds: 100)); // Optional: ensure keyboard close animation completes
                                      Navigator.pop(context);
                                    },
                                    lineColor: const Color(0xFFFF0083),
                                    backgroundColor: Colors.white,
                                    textColor: const Color(0xFFFF0083)
                                ),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                  height: 58,
                                  width:  MediaQuery.of(context).size.width > 150*8 ?
                                  MediaQuery.of(context).size.width/7 :
                                  (MediaQuery.of(context).size.width > 150*5 && MediaQuery.of(context).size.width < 150*8) ?
                                  MediaQuery.of(context).size.width/3
                                      : MediaQuery.of(context).size.width/2.6,
                                  child: CoreButton(
                                      textSize: 18,
                                      text: "Next",
                                      onTap: () {
                                        if (selectedIndex != 1000) {
                                          MyApp.infoData.questions.add(selectedQuestion!.questionsList[selectedIndex].values.toString());
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Questions(int.parse(selectedQuestion!.questionsList[selectedIndex].keys.first)),
                                              )
                                          );
                                        }else if(importantNotes.text.isNotEmpty){
                                          MyApp.infoData.about = importantNotes.text;
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => const UserAboutAddress(),
                                              )
                                          );
                                        }
                                      },
                                      lineColor: const Color(0xFFFF0083),
                                      backgroundColor: const Color(0xFFFF0083),
                                      textColor: Colors.white
                                  )
                              )
                            ],
                          ),
                        ) :Container(
                          margin: const EdgeInsets.only(top: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 58,
                                width: MediaQuery.of(context).size.width / 2 - 30,
                                child: CoreButton(
                                    textSize: 18,
                                    text: "Previous",
                                    onTap: () async {
                                      closeKeyboard(context);
                                      MyApp.infoData.questions.removeAt(MyApp.infoData.questions.length);
                                      await Future.delayed(const Duration(milliseconds: 100)); // Optional: ensure keyboard close animation completes
                                      Navigator.pop(context);
                                    },
                                    lineColor: const Color(0xFFFF0083),
                                    backgroundColor: Colors.white,
                                    textColor: const Color(0xFFFF0083)
                                ),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                  height: 58,
                                  width: MediaQuery.of(context).size.width / 2 - 30,
                                  child: CoreButton(
                                      textSize: 18,
                                      text: "Next",
                                      onTap: () {
                                        if (selectedIndex != 1000) {

                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Questions(int.parse(selectedQuestion!.questionsList[selectedIndex].keys.first)),
                                              )
                                          );
                                        }else if(importantNotes.text.isNotEmpty){
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => const LocationAnimation(),
                                              )
                                          );
                                        }
                                      },
                                      lineColor: const Color(0xFFFF0083),
                                      backgroundColor: const Color(0xFFFF0083),
                                      textColor: Colors.white
                                  )
                              )
                            ],
                          ),
                        )
                      ],
                    )
                ),
              ],
            ):  Container(
                margin: const EdgeInsets.only(top: 100, left: 20, right: 20),
                child: Column(
                  children: [
                    Text(
                      selectedQuestion?.question.toString() ?? 'Please tell us a little about your project.',
                      style: textStyleQuestion,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    widget.id != 0 ?
                    SizedBox(
                      height: (questionList?.length ?? 0) < 4
                          ? (questionList?.length ?? 0) * 116
                          : ((questionList?.length ?? 0) * 100 >= MediaQuery.of(context).size.height - 340
                          ? MediaQuery.of(context).size.height - 340
                          : (questionList?.length ?? 0) * 100),

                      child: ListView.builder(
                        itemCount: questionList?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.only(top:16),
                            height: 70,
                            child: QuestionButton(
                              text: questionList?[index].values.first ?? 'N/A',
                              backgroundColor: Colors.grey.withOpacity(0.08),
                              lineColor: const Color(0xFFFF0083),
                              textColor: const Color(0xFF4A4A4A),
                              index: index,
                              textSize: 18,
                              maxIndex: questionList!.length - 1,
                              selected: selectedIndex == index,
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                            ),
                          );
                        },
                      ),
                    )
                        : Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.only(bottom: 10),
                      height: MediaQuery.of(context).size.width/1.8,
                      width: MediaQuery.of(context).size.width,
                      child: TextField(
                        cursorColor: const Color(0xFFFF0083),
                        maxLength: 2600,
                        maxLines : 5, // add this
                        style: const TextStyle(color: Color(0xFFFF0083)),
                        controller: importantNotes,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFF0083), width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(width: 2,color: Color(0xFFFF0083)),
                          ),

                          hintText: 'How can a pro help you? The more details the better - it helps pros provide the most accurate quote! (Optional)',
                          hintStyle: TextStyle(
                            color: Colors.grey, fontSize: 16,),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 58,
                            width: MediaQuery.of(context).size.width / 2 - 30,
                            child: CoreButton(
                                textSize: 18,
                                text: "Previous",
                                onTap: () async {
                                  closeKeyboard(context);
                                  await Future.delayed(const Duration(milliseconds: 100)); // Optional: ensure keyboard close animation completes
                                  Navigator.pop(context);
                                },
                                lineColor: const Color(0xFFFF0083),
                                backgroundColor: Colors.white,
                                textColor: const Color(0xFFFF0083)
                            ),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                              height: 58,
                              width: MediaQuery.of(context).size.width / 2 - 30,
                              child: CoreButton(
                                  textSize: 18,
                                  text: "Next",
                                  onTap: () {
                                    if (selectedIndex != 1000) {

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Questions(int.parse(selectedQuestion!.questionsList[selectedIndex].keys.first)),
                                          )
                                      );
                                    }else if(importantNotes.text.isNotEmpty){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const LocationAnimation(),
                                          )
                                      );
                                    }
                                  },
                                  lineColor: const Color(0xFFFF0083),
                                  backgroundColor: const Color(0xFFFF0083),
                                  textColor: Colors.white
                              )
                          )
                        ],
                      ),
                    )
                  ],
                )
            ),
          ),
        ),
      ) :  FutureBuilder<LottieComposition>(
        future: _composition,
        builder: (context, snapshot) {
          var composition = snapshot.data;
          if (composition != null) {
            return Center(child: Lottie(composition: composition));
          } else {
            return const Center(child: CircularProgressIndicator(color: Color(0xFFFF0083),));
          }
        },
      )
    );
  }
}
