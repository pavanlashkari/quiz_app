import 'package:flutter/material.dart';

class QuestionIndex extends StatelessWidget{
  QuestionIndex({super.key,
  required this.isCorrectAnswer,
  required this.questionIndex
  });
  final bool isCorrectAnswer;
  final int questionIndex;

  @override
  Widget build(context){
    final questionnumber = questionIndex+1;
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAnswer
            ?Color.fromARGB(90, 62, 227, 250)
            :Color.fromARGB(90, 250, 71, 207),
        borderRadius: BorderRadius.circular(100)
      ),
      child: Text(
        questionnumber.toString(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(90, 3, 6, 61),
        ),
      ),
    );
  }
}