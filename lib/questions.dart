import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/action_button.dart';
import 'package:quiz_app/data/question_quiz.dart';

class questions extends StatefulWidget {
  const questions({Key? key,required this.userAnswer}) : super(key: key);

  final void Function(String answer) userAnswer;
  @override
  State<questions> createState() => _questionsState();
}

class _questionsState extends State<questions> {
  var currentQuestionIndex = 0;
  void getIndex(String userSelection) {
    widget.userAnswer(userSelection);
      setState(() {
        currentQuestionIndex++;
      });
    }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = question[currentQuestionIndex];
    return Scaffold(
      backgroundColor: const Color.fromARGB(90, 84, 6, 210),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 60, right: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(currentQuestion.question,
                  style: GoogleFonts.lato(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 30,
              ),
              ...currentQuestion.getshuffledList().map(
                (answer) {
                  return AnswerButton(
                      onTap: () {
                        getIndex(answer);
                      },
                      answer: answer);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
