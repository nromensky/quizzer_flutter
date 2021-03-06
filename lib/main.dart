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
  List<Icon> scoreKeeper1 = [];
  List<Icon> scoreKeeper2 = [];
  int resultingScore = 0;
  int resultingPercent = 0;

  void questionValidation(bool userAnswer) {
    if (questionList[questionNumber].questionAnswer == userAnswer) {
      if (scoreKeeper1.length < 15) {
        scoreKeeper1.add(Icon(Icons.done_rounded, color: Colors.lightGreen));
      } else {
        if (scoreKeeper2.length < 15) {
          scoreKeeper2.add(Icon(Icons.done_rounded, color: Colors.lightGreen));
        }
      }
      resultingScore++;
    } else {
      if (scoreKeeper1.length < 15) {
        scoreKeeper1.add(Icon(Icons.close_rounded, color: Colors.redAccent));
      } else {
        if (scoreKeeper2.length < 15) {
          scoreKeeper2.add(Icon(Icons.close_rounded, color: Colors.redAccent));
        }
      }
    }

    if (questionNumber < questionList.length - 1) {
      questionNumber++;
    } else {
      resultingPercent =
          (100 * resultingScore / (scoreKeeper1.length + scoreKeeper2.length))
              .round();
      Alert(message: 'Your score is ${resultingPercent}%').show();
      questionNumber = 0;
      resultingScore = 0;
      scoreKeeper1 = [];
      scoreKeeper2 = [];
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
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: scoreKeeper1,
                        ),
                        Row(
                          children: scoreKeeper2,
                        ),
                      ],
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
