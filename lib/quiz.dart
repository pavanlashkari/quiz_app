import 'package:flutter/material.dart';

class quiz extends StatelessWidget{
  const quiz(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/quiz-logo.png', height: 300,
            color: Color.fromARGB(169, 255, 255, 255),),
          const SizedBox(
            height: 40,
          ),
          const Text("learn flutter the fun way",
              style: TextStyle(fontSize: 20, color: Colors.white)),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
              onPressed: startQuiz,
              icon: const Icon(Icons.arrow_circle_right),
              label: const Text("start",
                  style: TextStyle(color: Colors.white)))
        ],
      ),
    );
  }
}