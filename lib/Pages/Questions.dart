import 'dart:convert';
import 'package:fixfinder/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';
import '../Network/QuestionsData.dart';
import '../Widgets/QuestionButton.dart';
import 'package:lottie/lottie.dart';
import 'package:fixfinder/Widgets/CoreButton.dart';
import 'LocationAnimation.dart';

class Questions extends StatefulWidget {
  final int id;

  const Questions(this.id, {super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  final TextEditingController importantNotes = TextEditingController();

  late final AnimationController _controller;

  Future<LottieComposition>? _composition;
  int selectedIndex = 1000;
  Question? selectedQuestion;
  List<Option>? questionList = [];

  bool isLoaded = false;

  Future<void> loadQuestionnaire() async {
    try {
      // Load JSON as a string from assets
      String jsonString = await rootBundle.loadString('assets/questions.json');

      // Decode the JSON string into a Map
      Map<String, dynamic> jsonMap = jsonDecode(jsonString);

      // Parse the JSON map
      var questionnaire = Questionnaire.fromJson(jsonMap);

      // Update state with the parsed data
      setState(() {
        selectedQuestion = questionnaire.questions.firstWhere(
              (q) => q.id == widget.id,
          orElse: () => Question(id: 0, question: '', options: [], end: true), // Provide a valid default
        );
        questionList = selectedQuestion?.options ?? [];
        Future.delayed(Duration(seconds: 2));
        // isLoaded = true;
      });
    } catch (e) {
      print("Error loading questionnaire: $e");
    }
  }


  @override
  void initState() {
    super.initState();
    _composition = AssetLottie("assets/briliant.json").load();
    loadQuestionnaire();

    initialize();

  }

  Future<void> initialize() async {
    setState(() {
      isLoaded = false; // Disable loading state
    });

    await loadQuestionnaire();

    // Wait for 2000 milliseconds
    await Future.delayed(const Duration(milliseconds: 2000));

    setState(() {
      isLoaded = true; // Enable loading state after delay
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    void closeKeyboard(BuildContext context) {
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
        FocusManager.instance.primaryFocus!.unfocus();
      }
    }

    final textStyleQuestion = GoogleFonts.merriweather(
      fontSize: 30,
      fontWeight: FontWeight.normal,
      color: Colors.black54,
    );

    return Scaffold(
      body: isLoaded
          ? SingleChildScrollView(
        child: Stack(
          children: [
            Visibility(
              visible: (MediaQuery.of(context).size.width > 150*5),
              child: Stack(
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 4),
                      child: Image.asset("assets/back4.png")),

                  Container(
                      margin: const EdgeInsets.only(top: 4),
                      child: Image.asset("assets/back2.png")),
                  Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Image.asset("assets/back3.png")),


                  Container(
                      margin: const EdgeInsets.only(top: 40),
                      child: Image.asset("assets/back.png")),

                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 100, left: 20, right: 20),
              child: Column(
                children: [
                  Text(
                    widget.id != 0 ? selectedQuestion!.question!.toString() : 'Please tell us a little about your project.',
                    style: textStyleQuestion,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  widget.id != 0
                      ? SizedBox(
                    height: (questionList?.length ?? 0) < 4
                        ? (questionList?.length ?? 0) * 116
                        : ((questionList?.length ?? 0) * 100 >= MediaQuery.of(context).size.height - 340
                        ? MediaQuery.of(context).size.height - 340
                        : (questionList?.length ?? 0) * 100),
                    child: ListView.builder(
                      itemCount: questionList?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin:  EdgeInsets.only(top: 16,
                              left: MediaQuery.of(context).size.width > 150*7 ? MediaQuery.of(context).size.width/3 :0,
                            right: MediaQuery.of(context).size.width > 150*7 ? MediaQuery.of(context).size.width/3 : 0),
                          height: 70,
                          child: QuestionButton(
                            text: questionList?[index].option ?? 'N/A',
                            backgroundColor: const Color(0xFFE4E4E4),
                            lineColor: const Color(0xFFFF0083),
                            textColor: const Color(0xFF4A4A4A),
                            textSize: 18, // Added the required parameter
                            index: index,
                            maxIndex: (questionList?.length ?? 1) - 1,
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
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      margin: EdgeInsets.only(
    left: MediaQuery.of(context).size.width > 150*7 ? MediaQuery.of(context).size.width/3 :0,
    right: MediaQuery.of(context).size.width > 150*7 ? MediaQuery.of(context).size.width/3 : 0),
                      child: TextField(
                        cursorColor: const Color(0xFFFF0083),
                        maxLength: 2600,
                        maxLines: 5,
                        style: const TextStyle(color: Color(0xFFFF0083)),
                        controller: importantNotes,
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFF0083), width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Color(0xFFFF0083)),
                          ),
                          hintText: 'How can a pro help you? The more details the better - it helps pros provide the most accurate quote! (Optional)',
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
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
                          width: MediaQuery.of(context).size.width > 150*8 ?
                          MediaQuery.of(context).size.width/7 :
                          (MediaQuery.of(context).size.width > 150*5 && MediaQuery.of(context).size.width < 150*8) ?
                          MediaQuery.of(context).size.width/3
                              : MediaQuery.of(context).size.width/2.6,
                        child: CoreButton(
                            textSize: 18,
                            text: "Next",
                            onTap: () async {
                              if (selectedIndex != 1000) {
                                MyApp.infoData.questions.add(selectedQuestion!.options[selectedIndex].option);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Questions(
                                      selectedQuestion?.options[selectedIndex].id ?? 0,
                                    ),
                                  ),
                                );
                              }else if(importantNotes.text.isNotEmpty){
                                MyApp.infoData.about = importantNotes.text;
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
                        ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      )
          : FutureBuilder<LottieComposition>(
        future: _composition,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            return Center(child: Lottie(composition: snapshot.data!));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
