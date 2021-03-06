import 'package:flutter/material.dart';
import 'package:alert/alert.dart';

import 'package:quizzer_flutter/questions.dart';

void main() => runApp(MyQuizzerApp());

class MyQuizzerApp extends StatefulWidget {
  @override
  _MyQuizzerAppState createState() => _MyQuizzerAppState();
}

class _MyQuizzerAppState extends State<MyQuizzerApp> {
  int questionNumber = 0;
  List<Icon> scoreKeeper = [];
  int resultingScore = 0;
  int resultingPercent = 0;

  void questionValidation(bool userAnswer) {
    if (questionList[questionNumber].questionAnswer == userAnswer) {
      scoreKeeper.add(Icon(Icons.done_rounded, color: Colors.lightGreen));
      resultingScore++;
    } else {
      scoreKeeper.add(Icon(Icons.close_rounded, color: Colors.redAccent));
    }

    if (questionNumber < questionList.length - 1) {
      questionNumber++;
    } else {
      resultingPercent = (100 * resultingScore / scoreKeeper.length).round();
      Alert(message: 'Your score is ${resultingPercent}%').show();
      questionNumber = 0;
      resultingScore = 0;
      scoreKeeper = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFFFFFFF),
          appBar: AppBar(
            backgroundColor: Colors.black45,
            title: Text('Quizzer'),
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Center(
                    child: Text(
                  '${questionList[questionNumber].questionText}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 23),
                )),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                  width: double.infinity,
                  color: Colors.green.shade300,
                  child: TextButton(
                    child: Text(
                      'true',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Fascinate',
                          fontSize: 37),
                    ),
                    onPressed: () {
                      setState(() {
                        questionValidation(true);
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                  width: double.infinity,
                  color: Colors.red.shade300,
                  child: TextButton(
                    child: Text(
                      'false',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Fascinate',
                          fontSize: 37),
                    ),
                    onPressed: () {
                      setState(() {
                        questionValidation(false);
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                    child: Row(
                      children: scoreKeeper,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
