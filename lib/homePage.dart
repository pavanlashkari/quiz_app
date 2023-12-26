import 'package:flutter/material.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/resultsScreen.dart';

import 'data/question_quiz.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List<String> selectedAnswer = [];
  Widget? activeScreen;
  @override
  void initState() {
    super.initState();
    activeScreen = quiz(switchScreen);
  }
  void switchScreen(){
    setState(() {
      activeScreen = questions(userAnswer: chooseAnswer);
    });
  }
  void chooseAnswer(String answer){
    selectedAnswer.add(answer);
    if(selectedAnswer.length == question.length){
      setState(() {
        activeScreen = ResultScreen( chosenAnswer: selectedAnswer,restartView: restartQuiz,);
      });
    }
  }
  void restartQuiz(){
    setState(() {
      selectedAnswer =[];
      activeScreen = questions(userAnswer: chooseAnswer);
    });
  }
  @override
  Widget build(context) {
    if(activeScreen == ResultScreen){
      activeScreen = ResultScreen(chosenAnswer: selectedAnswer, restartView: restartQuiz);
    }
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.deepPurple.shade800,
            Colors.deepPurple.shade700,
            Colors.deepPurple.shade600,
            Colors.deepPurple.shade500,
            Colors.deepPurple.shade400,
            Colors.deepPurple.shade300,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: activeScreen,
      )
    );
  }
}
