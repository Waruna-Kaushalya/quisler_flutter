import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quize_brain.dart';
import 'components.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: QuizePage(),
          ),
        ),
      ),
    );
  }
}

class QuizePage extends StatefulWidget {
  @override
  _QuizePageState createState() => _QuizePageState();
}

class _QuizePageState extends State<QuizePage> {
  List<Icon> scoreKeeper = [];

  bool answerBool = true;

  QuizBrain quizBrainObject = QuizBrain();

  int correctAnswerCount = 0;
  int wrongAnswerCount = 0;

  void answeCheck(bool checkAnswer) {
    int answerCount = correctAnswerCount + wrongAnswerCount;
    int lenghth = quizBrainObject.questionBankLength();

    if (answerCount < lenghth) {
      setState(() {
        if (quizBrainObject.getQuestionAnswer() == checkAnswer) {
          correctAnswerCount++;
        } else {
          wrongAnswerCount++;
        }
        quizBrainObject.nextQuestion();
      });
    } else {
      setState(() {
        Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.")
            .show();
        quizBrainObject.setquestionNumbe();
        wrongAnswerCount = 0;
        correctAnswerCount = 0;
      });
    }
  }

  Expanded buttonFunction({required bool trueFalse, required Color color}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              color,
            ),
          ),
          onPressed: () {
            answeCheck(trueFalse);
          },
          child: Text(
            '$trueFalse',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              quizBrainObject.getQuestionText(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        buttonFunction(
          trueFalse: true,
          color: Colors.green,
        ),
        buttonFunction(
          trueFalse: false,
          color: Colors.red,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            printIcone(
              Colors.green,
              Icons.check,
            ),
            printAnswe(
              'Correct: $correctAnswerCount',
            ),
            SizedBox(
              width: 10,
            ),
            printIcone(
              Colors.red,
              Icons.close,
            ),
            printAnswe(
              'Wrong:$wrongAnswerCount',
            ),
          ],
        ),
      ],
    );
  }
}
