import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/resultScreenWidgets/question_index.dart';

class QuestionSummary extends StatelessWidget {
  QuestionSummary(this.summaryData, {super.key});
  List<Map<String, Object>> summaryData = [];
  @override
  Widget build(context) {

    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            final isCorrectAnswer = data['currectAnswer'] == data['chosenAnswer'];
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                QuestionIndex(
                    isCorrectAnswer: isCorrectAnswer,
                    questionIndex: data['question_index'] as int),
                // Text(((data['question_index'] as int) + 1).toString())),
                SizedBox(width: 20,),
                Expanded(
                  child: Column(
                    children: [
                      Text(data['question'].toString(),
                          style: GoogleFonts.lato(
                              color: Color.fromARGB(90, 247, 250, 249),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(data['chosenAnswer'].toString(),
                          style: GoogleFonts.lato(
                            color: Color.fromARGB(90, 24, 231, 191),
                          )),
                      Text(data['currectAnswer'].toString(),
                          style: GoogleFonts.lato(
                              color: Color.fromARGB(90, 222, 68, 127),
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
