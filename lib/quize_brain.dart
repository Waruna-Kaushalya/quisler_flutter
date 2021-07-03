import 'questions_model.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Questions> _questionsBank = [
    Questions("Question 1", false),
    Questions("Question 2", true),
    Questions("Question 3", true),
    Questions("Question 4", false),
    Questions("Question 5", true),
    Questions("Question 6", true),
  ];

  String getQuestionText() {
    return _questionsBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionsBank[_questionNumber].questionAnswer;
  }

  void setquestionNumbe() {
    _questionNumber = 0;
  }

  void nextQuestion() {
    if (_questionNumber < _questionsBank.length - 1) {
      _questionNumber++;
    }
  }

  int questionBankLength() {
    return _questionsBank.length;
  }

  int questionNumber() {
    return _questionNumber;
  }
}
