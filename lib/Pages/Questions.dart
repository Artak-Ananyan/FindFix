import 'dart:core';

import 'package:fixfinder/Widgets/CoreButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Network/QuestionsData.dart';
import '../Widgets/QuestionButton.dart';

class Questions extends StatefulWidget {
  final String question;
  final int id;

  const Questions(this.question, this.id, {super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  int selectedIndex = 1000;
  late QuestionsData selectedQuestion;

  QuestionsData questionsData1 = new QuestionsData(
      id: 1,
      question: "Decks & Porches",
      questionsList: [
        "Build or replace deck/porch",
        "Repair deck/porch",
        "Clean or seal deck/porch"
      ],
      textQuestion: "Question text - How can we help?",
      end: false);

  QuestionsData questionsData2 = new QuestionsData(
      id: 2,
      question: "Build or replace deck/porch",
      questionsList: ["Build or replace a deck", "Repair an existing deck"],
      textQuestion: "What best describes the project?",
      end: false);

  QuestionsData questionsData3 = new QuestionsData(
      id: 3,
      question: "Build or replace a deck",
      questionsList: ["Under 100 sq ft", "100-300 sq ft", "Larger than 300 sq ft"],
      textQuestion: "What size deck, approximately, would you like to build?",
      end: true);

  QuestionsData questionsData4 = new QuestionsData(
      id: 4,
      question: "Repair an existing deck",
      questionsList: ["Rotted decking or stairs", "Broken deck/stairs/railings", "Waterproofing/re-staining", "Other"],
      textQuestion: "How can we help with your deck?",
      end: true);

  QuestionsData questionsData5 = new QuestionsData(
      id: 5,
      question: "Repair deck/porch",
      questionsList: [ "Rotted decking or stairs", "Broken deck/stairs/railings", "Waterproofing/re-staining", "Other"],
      textQuestion: "How can we help with your deck?",
      end: false);

  QuestionsData questionsData6 = new QuestionsData(
      id: 6,
      question: "Rotted decking or stairs",
      questionsList: [  "Wood", "Composite/synthetic materials", "Not sure/other"],
      textQuestion: "What material is your deck?",
      end: false);

  QuestionsData questionsData7 = new QuestionsData(
      id: 7,
      question: "Broken deck/stairs/railings",
      questionsList: [  "Wood", "Composite/synthetic materials", "Not sure/other"],
      textQuestion: "What material is your deck?",
      end: false);

  QuestionsData questionsData8 = new QuestionsData(
      id: 8,
      question: "Waterproofing/re-staining",
      questionsList: [  "Wood", "Composite/synthetic materials", "Not sure/other"],
      textQuestion: "What material is your deck?",
      end: false);

  QuestionsData questionsData9 = new QuestionsData(
      id: 9,
      question: "Other",
      questionsList: [  "Wood", "Composite/synthetic materials", "Not sure/other"],
      textQuestion: "What material is your deck?",
      end: false);

  QuestionsData questionsData10 = new QuestionsData(
      id: 10,
      question: "Wood",
      questionsList: [ "Yes", "No"],
      textQuestion: "Is this request covered by an insurance claim?",
      end: false);

  QuestionsData questionsData11 = new QuestionsData(
      id: 11,
      question: "Composite/synthetic materials",
      questionsList: [ "Yes", "No"],
      textQuestion: "Is this request covered by an insurance claim?",
      end: false);

  QuestionsData questionsData12 = new QuestionsData(
      id: 12,
      question: "Yes",
      questionsList: [ "Within 2 weeks", "More than 2 weeks", "Not sure - still planning/budgeting"],
      textQuestion: "When do you need this work done?",
      end: true);

  QuestionsData questionsData13 = new QuestionsData(
      id: 13,
      question: "No",
      questionsList: [ "Within 2 weeks", "More than 2 weeks", "Not sure - still planning/budgeting"],
      textQuestion: "When do you need this work done?",
      end: false);

  QuestionsData questionsData14 = new QuestionsData(
      id: 14,
      question: "Clean or seal deck/porch",
      questionsList: ["Home", "Business"],
      textQuestion: "What kind of location is this?",
      end: false);

  QuestionsData questionsData15 = new QuestionsData(
      id: 15,
      question: "Home",
      questionsList: ["Within 2 weeks", "More than 2 weeks", "Not sure - still planning/budgeting"],
      textQuestion: "When do you need this work done?",
      end: false);

  QuestionsData questionsData16 = new QuestionsData(
      id: 16,
      question: "Business",
      questionsList: ["Within 2 weeks", "More than 2 weeks", "Not sure - still planning/budgeting"],
      textQuestion: "When do you need this work done?",
      end: false);


  var questionList = [];


  QuestionsData questionsDataRoof1 = new QuestionsData(
    id: 1,
    question : "Roof Repair",
    questionsList: ["Install or repair roof", "Install or replace gutters", "Siding", "Clean roof/gutters", "Other"],
      textQuestion: "What do you need help with?",
    end: false);




  QuestionsData questionsDataRoof2 = new QuestionsData(
      id: 2,
    question : "Install or repair roof",
    questionsList: ["Completely replace roof", "Repair existing roof", "Install roof on new construction"],
    textQuestion: "What type of project is this?",
    end: false);

  QuestionsData questionsDataRoof3 = new QuestionsData(
    id: 3,
    question : "Completely replace roof",
    questionsList: ["Asphalt shingle", "Metal", "Wood or composite shingle", "Tile", "Flat/foam/single ply", "Natural slate"],
    textQuestion: "What roofing material do you want?",
    end: false,
  );


  QuestionsData questionsDataRoof4 = new QuestionsData(
      id: 4,
      question : "Asphalt shingle",
      questionsList: ["1 story", "2+ stories"],
      textQuestion: "How tall is your house/building?",
      end: false);


  QuestionsData questionsDataRoof5 = new QuestionsData(
      id: 5,
      question : "Metal",
      questionsList: ["1 story", "2+ stories"],
      textQuestion: "How tall is your house/building?",
      end: false);

  QuestionsData questionsDataRoof6 = new QuestionsData(
      id: 6,
      question : "Wood or composite shingle",
      questionsList: ["1 story", "2+ stories"],
      textQuestion: "How tall is your house/building?",
      end: false);

  QuestionsData questionsDataRoof7 = new QuestionsData(
      id: 7,
      question :  "Tile",
      questionsList: ["1 story", "2+ stories"],
      textQuestion: "How tall is your house/building?",
      end: false);

  QuestionsData questionsDataRoof8 = new QuestionsData(
      id: 8,
      question :  "Flat/foam/single ply",
      questionsList: ["1 story", "2+ stories"],
      textQuestion: "How tall is your house/building?",
      end: false);

  QuestionsData questionsDataRoof9 = new QuestionsData(
      id: 9,
      question : "Natural slate",
      questionsList: ["1 story", "2+ stories"],
      textQuestion: "How tall is your house/building?",
      end: false);

  QuestionsData questionsDataRoof10 = new QuestionsData(
      id: 10,
      question : "1 story",
      questionsList: ["Urgent (1-2 days)", "Within 2 weeks", "More than 2 weeks","Not sure - still planning/budgeting"],
      textQuestion: "When do you need this work done?",
      end: false);

  QuestionsData questionsDataRoof11 = new QuestionsData(
      id: 11,
      question : "2+ stories ",
  questionsList: ["Urgent (1-2 days)", "Within 2 weeks", "More than 2 weeks","Not sure - still planning/budgeting"],
  textQuestion: "When do you need this work done?",
  end: false);



  QuestionsData questionsDataRoof12 = new QuestionsData(
      id: 12,
    question : "Repair existing roof",
  questionsList: ["Asphalt shingle", "Metal",
    "Wood or composite shingle", "Tile", "Flat/foam/single ply",
    "Natural slate" ],
    textQuestion: "What roofing material do you want?",
    end: false);


  QuestionsData questionsDataRoof13 = new QuestionsData(
      id: 13,
      question : "Completely replace roof",
      questionsList: ["Asphalt shingle", "Metal",
      "Wood or composite shingle", "Tile", "Flat/foam/single ply",
      "Natural slate" ],
      textQuestion: "What roofing material do you want?",
      end: false);


  QuestionsData questionsDataRoof14 = new QuestionsData(
      id: 14,
    question : "Asphalt shingle",
    questionsList: ["1 story", "2+ stories"],
    textQuestion: "How tall is your house/building?",
    end: false);


  QuestionsData questionsDataRoof15 = new QuestionsData(
      id: 15,
    question : "Metal",
    questionsList: ["1 story", "2+ stories"],
    textQuestion: "How tall is your house/building?",
    end: false);


  QuestionsData questionsDataRoof16 = new QuestionsData(
      id: 16,
    question : "Wood or composite shingle",
    questionsList: ["1 story", "2+ stories"],
    textQuestion: "How tall is your house/building?",
    end: false);

  QuestionsData questionsDataRoof17 = new QuestionsData(
      id: 17,
    question : "Tile",
    questionsList: ["1 story", "2+ stories"],
    textQuestion: "How tall is your house/building?",
    end: false);

  QuestionsData questionsDataRoof18 = new QuestionsData(
      id: 18,
    question : "Flat/foam/single ply",
    questionsList: ["1 story", "2+ stories"],
    textQuestion: "How tall is your house/building?",
    end: false);

  QuestionsData questionsDataRoof19 = new QuestionsData(
      id: 19,
    question : "Natural slate",
    questionsList: ["1 story", "2+ stories"],
    textQuestion: "How tall is your house/building?",
    end: false);

  QuestionsData questionsDataRoof20 = new QuestionsData(
      id: 20,
      question : "1 story ",
  questionsList: ["Urgent (1-2 days)", "Within 2 weeks", "More than 2 weeks","Not sure - still planning/budgeting"],
  textQuestion: "When do you need this work done?",
  end: true);

  QuestionsData questionsDataRoof21 = new QuestionsData(
      id: 21,
      question : " 2+ stories ",
  questionsList: ["Urgent (1-2 days)", "Within 2 weeks", "More than 2 weeks","Not sure - still planning/budgeting"],
  textQuestion: "When do you need this work done?",
  end: true);





  QuestionsData questionsDataRoof22 = new QuestionsData(
    id: 22,
    question : "Install roof on new construction",
  questionsList: ["Asphalt shingle", "Metal",
    "Wood or composite shingle", "Tile", "Flat/foam/single ply",
    "Natural slate" ],
    textQuestion: "What roofing material do you want?",
    end: false,
  );


  QuestionsData questionsDataRoof23 = new QuestionsData(
      id: 23,
      question : "Completely replace roof",
      questionsList: ["Asphalt shingle", "Metal",
      "Wood or composite shingle", "Tile", "Flat/foam/single ply",
      "Natural slate" ],
      textQuestion: "What roofing material do you want?",
      end: false);


  QuestionsData questionsDataRoof24 = new QuestionsData(
      id: 24,
      question : "Asphalt shingle",
      questionsList: ["1 story", "2+ stories"],
      textQuestion: "How tall is your house/building?",
      end: false);


  QuestionsData questionsDataRoof25 = new QuestionsData(
      id: 25,
      question : "Metal",
      questionsList: ["1 story", "2+ stories"],
      textQuestion: "How tall is your house/building?",
      end: false);

  QuestionsData questionsDataRoof26 = new QuestionsData(
      id: 26,
      question : "Wood or composite shingle",
      questionsList: ["1 story", "2+ stories"],
      textQuestion: "How tall is your house/building?",
      end: false);


  QuestionsData questionsDataRoof27 = new QuestionsData(
      id: 27,
      question : " Tile",
      questionsList: ["1 story", "2+ stories"],
      textQuestion: "How tall is your house/building?",
      end: false);


  QuestionsData questionsDataRoof28 = new QuestionsData(
      id: 28,
      question : "Flat/foam/single ply",
      questionsList: ["1 story", "2+ stories"],
      textQuestion: "How tall is your house/building?",
      end: false);


  QuestionsData questionsDataRoof29 = new QuestionsData(
      id: 29,
      question : "Natural slate ",
      questionsList: ["1 story", "2+ stories"],
      textQuestion: "How tall is your house/building?",
      end: false);

  QuestionsData questionsDataRoof30 = new QuestionsData(
      id: 30,
      question : "1 story ",
  questionsList: ["Urgent (1-2 days)", "Within 2 weeks", "More than 2 weeks","Not sure - still planning/budgeting"],
  textQuestion: "When do you need this work done?",
  end: true);

  QuestionsData questionsDataRoof31 = new QuestionsData(
      id: 31,
      question : "2+ stories ",
  questionsList: ["Urgent (1-2 days)", "Within 2 weeks", "More than 2 weeks","Not sure - still planning/budgeting"],
  textQuestion: "When do you need this work done?",
  end: true);


  QuestionsData questionsDataRoof32 = new QuestionsData(
      id: 32,
    question : "Install or replace gutters",
  questionsList: ["Replace existing gutters","Repair existing gutters","Install new gutters where there are none"],
    textQuestion: "What do you need help with?",
    end: false);




  QuestionsData questionsDataRoof33 = new QuestionsData(
      id: 33,
      question : "Replace existing gutters",
  questionsList: ["Aluminum,Steel","PVC", "Copper","Wood","Don't Know"],
      textQuestion: "What best describes this gutter project?",
      end: false);



  QuestionsData questionsDataRoof34 = new QuestionsData(
    id: 34,
    question : "Aluminum",
  questionsList: ["Two or More Stories","One Story"],
    textQuestion: "Select the type of gutter material you want:",
    end: false,
  );


  QuestionsData questionsDataRoof35 = new QuestionsData(
      id: 35,
    question : "Steel",
  questionsList: ["Two or More Stories","One Story"],
    textQuestion: "Select the type of gutter material you want:",
    end: false);


  QuestionsData questionsDataRoof36 = new QuestionsData(
      id: 36,
    question : "PVC",
  questionsList: ["Two or More Stories","One Story"],
    textQuestion: "Select the type of gutter material you want:",
    end: false);

  QuestionsData questionsDataRoof37 = new QuestionsData(
      id: 37,
  question : "Copper",
  questionsList: ["Two or More Stories","One Story"],
  textQuestion: "Select the type of gutter material you want:",
  end: false);


  QuestionsData questionsDataRoof38 = new QuestionsData(
      id: 38,
  question : "Wood",
  questionsList: ["Two or More Stories","One Story"],
  textQuestion: "Select the type of gutter material you want:",
  end: false);


  QuestionsData questionsDataRoof39 = new QuestionsData(
      id: 39,
  question : "Don't Know",
  questionsList: ["Two or More Stories","One Story"],
  textQuestion: "Select the type of gutter material you want:",
  end: false);



  QuestionsData questionsDataRoof40 = new QuestionsData(
    id: 40,
  question : "Two or More Stories",
  questionsList: ["Urgent (1-2 days)", "Within 2 weeks", "More than 2 weeks","Not sure - still planning/budgeting"],
  textQuestion: "When would you like this request to be completed?",
  end: true,
  );

  QuestionsData questionsDataRoof41 = new QuestionsData(
      id: 41,
  question : "One Story",
    questionsList: ["Urgent (1-2 days)", "Within 2 weeks", "More than 2 weeks","Not sure - still planning/budgeting"],
  textQuestion: "When would you like this request to be completed?",
  end: true);




  QuestionsData questionsDataRoof42 = new QuestionsData(
      id: 42,
      question : "Siding",
  questionsList: ["Exterior trim","Install or replace stone veneer siding","Powerwashing","Repair asbestos siding","Install or repair siding"],
      textQuestion: "What siding work do you need help with?",
      end: false);



  QuestionsData questionsDataRoof43 = new QuestionsData(
      id: 43,
      question : "Exterior trim",
  questionsList: ["Install or replace","Repair"],
      textQuestion: "What type of work do you need help with?",
      end: false);



  QuestionsData questionsDataRoof44 = new QuestionsData(
      id: 44,
      question : "Install or replace",
  questionsList: ["Install or completely replace exterior trim","Repair or partially replace exterior trim"],
      textQuestion: "What is the nature of this project?",
      end: false);



  QuestionsData questionsDataRoof45 = new QuestionsData(
    id: 45,
    question : "Install or completely replace exterior trim",
    questionsList: ["Within 2 weeks","More than 2 weeks","Not sure - still planning/budgeting"],
    textQuestion: "When do you need this work done?",
    end: true,
  );





  QuestionsData questionsDataRoof46 = new QuestionsData(
      id: 46,
    question : "Repair or partially replace exterior trim",
    questionsList: ["Within 2 weeks","More than 2 weeks","Not sure - still planning/budgeting"],
    textQuestion: "When do you need this work done?",
    end: true);



  QuestionsData questionsDataRoof47 = new QuestionsData(
      id: 47,
    question : "Repair",
  questionsList: ["Leak through window", "wall or into basement",
    "Trim is loose or hanging out of position","Trim is twisted", "warped", "cracked or split",
   "Trim is soft", "rotten", "blistering or peeling","Other"],
    textQuestion: "What is the visible damage? (Check all that apply)",
    end: false);


  QuestionsData questionsDataRoof48 = new QuestionsData(
    id: 48,
    question : "Leak through window, wall or into basement",
    questionsList: ["Wood","Vinyl","Aluminum","Steel","Other"],
    textQuestion: "What kind of trim do you have?",
    end: false,
  );


  QuestionsData questionsDataRoof49 = new QuestionsData(
    id: 49,
    question : "Trim is loose or hanging out of position",
    questionsList: ["Wood","Vinyl","Aluminum","Steel","Other"],
    textQuestion: "What kind of trim do you have?",
    end: false,
  );


  QuestionsData questionsDataRoof50 = new QuestionsData(
    id: 50,
    question : "Trim is twisted, warped, cracked or split",
    questionsList: ["Wood","Vinyl","Aluminum","Steel","Other"],
    textQuestion: "What kind of trim do you have?",
    end: false,
  );



  QuestionsData questionsDataRoof51 = new QuestionsData(
    id: 51,
    question : " Trim is soft, rotten, blistering or peeling",
    questionsList: ["Wood","Vinyl","Aluminum","Steel","Other"],
    textQuestion: "What kind of trim do you have?",
    end: false,
  );


  QuestionsData questionsDataRoof52 = new QuestionsData(
    id: 52,
    question : "Other",
    questionsList: ["Wood","Vinyl","Aluminum","Steel","Other"],
    textQuestion: "What kind of trim do you have?",
    end: false,
  );



  QuestionsData questionsDataRoof53 = new QuestionsData(
      id: 53,
    question : "Wood",
  questionsList: ["Vinyl","Wood","Stucco","Fiber cement","Other"],
    textQuestion: "What type of siding do you have?",
    end: false);


  QuestionsData questionsDataRoof54 = new QuestionsData(
      id: 54,
    question : "Vinyl",
  questionsList: ["Vinyl","Wood","Stucco","Fiber cement","Other"],
    textQuestion: "What type of siding do you have?",
    end: false);

  QuestionsData questionsDataRoof55 = new QuestionsData(
      id: 55,
    question : "Aluminum",
  questionsList: ["Vinyl","Wood","Stucco","Fiber cement","Other"],
    textQuestion: "What type of siding do you have?",
    end: false);


  QuestionsData questionsDataRoof56 = new QuestionsData(
    id: 56,
    question : "Steel",
  questionsList: ["Vinyl","Wood","Stucco","Fiber cement","Other"],
    textQuestion: "What type of siding do you have?",
    end: false, );

  QuestionsData questionsDataRoof57 = new QuestionsData(
    id: 57,
    question : "Other",
  questionsList:["Vinyl","Wood","Stucco","Fiber cement","Other"],
    textQuestion: "What type of siding do you have?",
    end: false, );

  QuestionsData questionsDataRoof58 = new QuestionsData(
      id: 58,
    question : "Vinyl",
  questionsList: ["Within 2 weeks","More than 2 weeks","Not sure - still planning/budgeting"],
    textQuestion: "Please tell us a little about your project.",
    end: true);

  QuestionsData questionsDataRoof59 = new QuestionsData(
      id: 59,
    question : "Wood",
  questionsList: ["Within 2 weeks","More than 2 weeks","Not sure - still planning/budgeting"],
    textQuestion: "Please tell us a little about your project.",
    end: true);

  QuestionsData questionsDataRoof60 = new QuestionsData(
      id: 60,
    question : "Stucco",
  questionsList: ["Within 2 weeks","More than 2 weeks","Not sure - still planning/budgeting"],
    textQuestion: "Please tell us a little about your project.",
    end: true);




  QuestionsData questionsDataRoof61 = new QuestionsData(
    id: 61,
    question : "Fiber cement",
  questionsList: ["Within 2 weeks","More than 2 weeks","Not sure - still planning/budgeting"],
    textQuestion: "Please tell us a little about your project.",
    end: true,
  );
  QuestionsData questionsDataRoof62 = new QuestionsData(
    id: 62,
    question : "Other",
  questionsList: ["Within 2 weeks","More than 2 weeks","Not sure - still planning/budgeting"],
    textQuestion: "Please tell us a little about your project.",
    end:true,
  );




  QuestionsData questionsDataRoof63 = new QuestionsData(
      id: 63,
      question : "Clean roof/gutters",
      questionsList: ["Clean Gutters and Downspouts","Clean a Roof"],
      textQuestion: "What work do you need done?",
      end: false);


  QuestionsData questionsDataRoof64 = new QuestionsData(
      id: 64,
    question : "Clean Gutters and Downspouts",
  questionsList: ["Water isn't draining","Water overflows","Gutters are clogged","Regular maintenance","Other"],
  textQuestion: "Why do you need your gutters cleaned? (Check all that apply)",
    end: false);



  QuestionsData questionsDataRoof65 = new QuestionsData(
      id: 65,
    question : "Water isn't draining",
  questionsList: ["Two or more stories","One story"],
    textQuestion: "How tall is your house/building?",
    end: false);




  QuestionsData questionsDataRoof66 = new QuestionsData(
      id: 66,
    question : "Water overflows",
  questionsList: ["Two or more stories","One story"],
    textQuestion: "How tall is your house/building?",
    end: false);


  QuestionsData questionsDataRoof67 = new QuestionsData(
      id: 67,
    question : "Gutters are clogged",
  questionsList: ["Two or more stories","One story"],
    textQuestion: "How tall is your house/building?",
    end: false);


  QuestionsData questionsDataRoof68 = new QuestionsData(
      id: 68,
    question : "Regular maintenance",
  questionsList: ["Two or more stories","One story"],
    textQuestion: "How tall is your house/building?",
    end: false);

  QuestionsData questionsDataRoof69 = new QuestionsData(
      id: 69,
    question : "Other",
  questionsList: ["Two or more stories","One story"],
    textQuestion: "How tall is your house/building?",
    end: false);


  QuestionsData questionsDataRoof70 = new QuestionsData(
      id: 70,
      question : "Two or more stories",
  questionsList: ["Urgent (1-2 days)","Within 2 weeks","More than 2 weeks","Not sure - still planning/budgeting"],
  textQuestion: "When do you need this work done?",
  end: true);


  QuestionsData questionsDataRoof71 = new QuestionsData(
      id: 71,
      question : "One story",
    questionsList: ["Urgent (1-2 days)","Within 2 weeks","More than 2 weeks","Not sure - still planning/budgeting"],
  textQuestion: "When do you need this work done?",
  end: true);



  QuestionsData questionsDataRoof72 = new QuestionsData(
      id: 72,
    question : "Clean a Roof",
  questionsList: ["Home","Business"],
    textQuestion: "What kind of location is this?",
    end: false);


  QuestionsData questionsDataRoof73 = new QuestionsData(
      id: 73,
    question : "Home",
  questionsList: ["Within 2 weeks","More than 2 weeks","Not sure - still planning/budgeting"],
    textQuestion: "When do you need this work done?",
    end: true);


  QuestionsData questionsDataRoof74 = new QuestionsData(
      id: 74,
    question : "Business",
      questionsList: ["Within 2 weeks","More than 2 weeks","Not sure - still planning/budgeting"],
    textQuestion: "When do you need this work done?",
    end: true);



  QuestionsData questionsDataRoof75 = new QuestionsData(
      id: 75,
    question : "Other",
  questionsList: ["Install or replace gutter covers and accessories","Painting a roof","Apply a sealant for a roof","Roof inspection,Install heating cable for a roof"],
    textQuestion: "What do you need help with?",
    end: false);




  QuestionsData questionsDataRoof76 = new QuestionsData(
      id: 76,
    question : "Install or replace gutter covers and accessories",
    questionsList: ["Home","Business"],
    textQuestion: "What kind of location is this?",
    end: false);





  QuestionsData questionsDataRoof77 = new QuestionsData(
      id: 77,
    question : "Home",
  questionsList: ["Leaves and debris building up in the gutter/downspout",
    "Gutter system easily clogs","Water doesn't drain from the house","Other"],
    textQuestion: "What problems are you experiencing? (Check all that apply)",
    end: false);


  QuestionsData questionsDataRoof78 = new QuestionsData(
      id: 78,
    question : "Business",
  questionsList: ["Leaves and debris building up in the gutter/downspout",
    "Gutter system easily clogs","Water doesn't drain from the house,Other"],
    textQuestion: "What problems are you experiencing? (Check all that apply)",
    end: false);




  QuestionsData questionsDataRoof79 = new QuestionsData(
    id: 79,
    question : "Leaves and debris building up in the gutter/downspout",
  questionsList: ["Two or more stories","One story"],
    textQuestion: "How tall is your house/building?",
    end: false,
  );


  QuestionsData questionsDataRoof80 = new QuestionsData(
    id: 80,
    question : "Water doesn't drain from the house,Other",
  questionsList: ["Two or more stories","One story"],
    textQuestion: "How tall is your house/building?",
    end: false,
  );

  QuestionsData questionsDataRoof81 = new QuestionsData(
    id: 81,
    question : "Water doesn't drain from the house,Other",
   questionsList: ["Two or more stories","One story"],
    textQuestion: "How tall is your house/building?",
    end: false,
  );



  QuestionsData questionsDataRoof82 = new QuestionsData(
      id: 82,
      question : "Two or more stories",
  questionsList: ["Within 2 weeks","More than 2 weeks","Not sure - still planning/budgeting"],
      textQuestion: "When do you need this work done?",
      end: true);


  QuestionsData questionsDataRoof83 = new QuestionsData(
      id: 83,
      question : "One story",
   questionsList: ["Within 2 weeks","More than 2 weeks","Not sure - still planning/budgeting"],
      textQuestion: "When do you need this work done?",
      end: true);






  QuestionsData getQuestionData(String questionKey, int id) {
    for (var q in questionList) {
      if (q.question == questionKey && q.id > id) {
        return q;
      }
    }
    return QuestionsData(
      id: 0,
      question: "Not Found",
      questionsList: [],
      textQuestion: "Please tell us a little about your project.",
      end: true,
    );
  }
  @override
  void initState() {
      questionList.add(questionsData1);
      questionList.add(questionsData2);
      questionList.add(questionsData3);
      questionList.add(questionsData4);
      questionList.add(questionsData5);
      questionList.add(questionsData6);
      questionList.add(questionsData7);
      questionList.add(questionsData8);
      questionList.add(questionsData9);
      questionList.add(questionsData10);
      questionList.add(questionsData11);
      questionList.add(questionsData12);
      questionList.add(questionsData13);
      questionList.add(questionsData14);
      questionList.add(questionsData15);
      questionList.add(questionsData16);
      questionList.add(questionsDataRoof1);
      questionList.add(questionsDataRoof2);
      questionList.add(questionsDataRoof3);
      questionList.add(questionsDataRoof4);
      questionList.add(questionsDataRoof5);
      questionList.add(questionsDataRoof6);
      questionList.add(questionsDataRoof7);
      questionList.add(questionsDataRoof8);
      questionList.add(questionsDataRoof9);
      questionList.add(questionsDataRoof10);
      questionList.add(questionsDataRoof11);
      questionList.add(questionsDataRoof12);
      questionList.add(questionsDataRoof13);
      questionList.add(questionsDataRoof14);
      questionList.add(questionsDataRoof15);
      questionList.add(questionsDataRoof16);
      questionList.add(questionsDataRoof17);
      questionList.add(questionsDataRoof18);
      questionList.add(questionsDataRoof19);
      questionList.add(questionsDataRoof20);
      questionList.add(questionsDataRoof21);
      questionList.add(questionsDataRoof22);
      questionList.add(questionsDataRoof23);
      questionList.add(questionsDataRoof24);
      questionList.add(questionsDataRoof25);
      questionList.add(questionsDataRoof26);
      questionList.add(questionsDataRoof27);
      questionList.add(questionsDataRoof28);
      questionList.add(questionsDataRoof29);
      questionList.add(questionsDataRoof30);
      questionList.add(questionsDataRoof31);
      questionList.add(questionsDataRoof32);
      questionList.add(questionsDataRoof33);
      questionList.add(questionsDataRoof34);
      questionList.add(questionsDataRoof35);
      questionList.add(questionsDataRoof36);
      questionList.add(questionsDataRoof37);
      questionList.add(questionsDataRoof38);
      questionList.add(questionsDataRoof39);
      questionList.add(questionsDataRoof40);
      questionList.add(questionsDataRoof41);
      questionList.add(questionsDataRoof42);
      questionList.add(questionsDataRoof43);
      questionList.add(questionsDataRoof44);
      questionList.add(questionsDataRoof45);
      questionList.add(questionsDataRoof46);
      questionList.add(questionsDataRoof47);
      questionList.add(questionsDataRoof48);
      questionList.add(questionsDataRoof49);
      questionList.add(questionsDataRoof50);
      questionList.add(questionsDataRoof51);
      questionList.add(questionsDataRoof52);
      questionList.add(questionsDataRoof53);
      questionList.add(questionsDataRoof54);
      questionList.add(questionsDataRoof55);
      questionList.add(questionsDataRoof56);
      questionList.add(questionsDataRoof57);
      questionList.add(questionsDataRoof58);
      questionList.add(questionsDataRoof59);
      questionList.add(questionsDataRoof60);
      questionList.add(questionsDataRoof61);
      questionList.add(questionsDataRoof62);
      questionList.add(questionsDataRoof63);
      questionList.add(questionsDataRoof64);
      questionList.add(questionsDataRoof65);
      questionList.add(questionsDataRoof66);
      questionList.add(questionsDataRoof67);
      questionList.add(questionsDataRoof68);
      questionList.add(questionsDataRoof69);
      questionList.add(questionsDataRoof70);
      questionList.add(questionsDataRoof71);
      questionList.add(questionsDataRoof72);
      questionList.add(questionsDataRoof73);
      questionList.add(questionsDataRoof74);
      questionList.add(questionsDataRoof75);
      questionList.add(questionsDataRoof76);
      questionList.add(questionsDataRoof77);
      questionList.add(questionsDataRoof78);
      questionList.add(questionsDataRoof79);
      questionList.add(questionsDataRoof80);
      questionList.add(questionsDataRoof81);
      questionList.add(questionsDataRoof82);
      questionList.add(questionsDataRoof83);

      setState(() {
        selectedQuestion = getQuestionData(widget.question, 0);
      });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {





    final textStyle = GoogleFonts.robotoMono(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      textStyle: Theme.of(context).textTheme.displayLarge,
    );

    final textStyleQuestion = GoogleFonts.robotoMono(
      fontSize: MediaQuery.of(context).size.width/18,
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
            height: MediaQuery.of(context).size.width +
                (selectedQuestion.questionsList!.length * 40),
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    selectedQuestion.textQuestion.toString(),
                    style: textStyleQuestion,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  selectedQuestion.end == false ?
                  Container(
                    height: (selectedQuestion.questionsList!.length * 70),
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: selectedQuestion.questionsList!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 60,
                          child: QuestionButton(
                            text:
                            selectedQuestion.questionsList![index].toString(),
                            backgroundColor: Colors.white,
                            lineColor: Colors.greenAccent,
                            textColor: Colors.black,
                            index: index,
                            textSize: 14,
                            maxIndex: selectedQuestion.questionsList!.length - 1,
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
                  ) : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border(
                          top:BorderSide(color: Colors.green, width: 1),
                          left:BorderSide(color: Colors.green, width: 1),
                          right:BorderSide(color: Colors.green, width: 1),
                          bottom:BorderSide(color: Colors.green, width: 1),
                      )
                    ),
                    padding: EdgeInsets.only(left: 40, right: 40,),
                    margin: EdgeInsets.only(bottom: 20),
                    height: MediaQuery.of(context).size.width/1.8,
                    width: MediaQuery.of(context).size.width,
                    child: TextField(

                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 58,
                          width: MediaQuery.of(context).size.width / 2 - 30,
                          child: CoreButton(
                              textSize: 18,
                              text: "Previous",
                              onTap: () {
                                Navigator.pop(context);
                              },
                              lineColor: Colors.green,
                              backgroundColor: Colors.white,
                              textColor: Colors.green)),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
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
                                      builder: (context) => Questions(selectedQuestion.questionsList![selectedIndex], selectedQuestion.id)),
                                );
                              }
                            },
                            lineColor: Colors.green,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                          ))
                    ],
                  )
                ],
              ),
            ),
          ))),
    );
  }
}
