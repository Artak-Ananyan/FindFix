import 'dart:convert';

class QuestionsData {
  final bool end;
  final String question;
  final List<Map<String, String>> questionsList;

  QuestionsData({required this.end, required this.question, required this.questionsList});

  factory QuestionsData.fromMap(Map<String, dynamic> map) {
    return QuestionsData(
      end: map['end'] as bool,
      question: map['question'] as String,
      questionsList: (map['questionsList'] as List<dynamic>).map((item) {
        // Check if each item is a Map, and handle the case if it's not
        print(item);
        Map<String, dynamic> myMap = jsonDecode(item.toString());
        return Map<String, String>.from(myMap);
            }).toList(),
    );
  }
}


class QuestionData {
  final bool end;
  final String question;
  final List<Map<String, String>> questionsList;
  final String category;  // New field for categorization
  final int score;        // New field for scoring

  QuestionData({
    required this.end,
    required this.question,
    required this.questionsList,
    this.category = 'General',  // Default category
    this.score = 0,             // Default score
  });

  factory QuestionData.fromJson(Map<String, dynamic> json) {
    var list = json['questionsList'] as List;
    List<Map<String, String>> questionsList = list.map((item) => Map<String, String>.from(item)).toList();
    return QuestionData(
      end: json['end'] as bool,
      question: json['question'] as String,
      questionsList: questionsList,
      category: json['category'] ?? 'General',  // Handle optional category
      score: json['score'] ?? 0,                // Handle optional score
    );
  }
}

