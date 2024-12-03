class Questionnaire {
  List<Question> questions;

  Questionnaire({required this.questions});

  factory Questionnaire.fromJson(Map<String, dynamic> json) {
    var list = json['questions'] as List;
    List<Question> questionsList = list.map((i) => Question.fromJson(i)).toList();
    return Questionnaire(questions: questionsList);
  }
}

class Question {
  int id;
  String question;
  List<Option> options;
  bool end;

  Question({
    required this.id,
    required this.question,
    required this.options,
    required this.end,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    var list = json['options'] as List;
    List<Option> optionsList = list.map((i) => Option.fromJson(i)).toList();
    return Question(
      id: json['id'],
      question: json['question'],
      options: optionsList,
      end: json['end'],
    );
  }
}

class Option {
  int id;
  String option;

  Option({required this.id, required this.option});

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      id: json['id'],
      option: json['option'],
    );
  }
}
