import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/question_quiz.dart';
import 'package:quiz_app/homePage.dart';
import 'package:quiz_app/question_summary.dart';
import 'package:quiz_app/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswer,required this.restartView});

  final List<String> chosenAnswer;
  final void Function() restartView;

  List<Map<String,Object>> getSummaryData(){
    final List<Map<String,Object>> summary = [];
    for(var i =0; i<chosenAnswer.length; i++){
      summary.add({
        'question_index' : i,
        'question' : question[i].question,
        'currectAnswer' :question[i].answer[0],
        'chosenAnswer' : chosenAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numOfTotalQuestion = summaryData.length;
    final numOfCurrectAnswer = summaryData.where((data){
      return data['currectAnswer'] == data['chosenAnswer'];
    }).length;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(90, 84, 6, 210),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "you answered $numOfCurrectAnswer out of $numOfTotalQuestion questions correctly!",
                  style: GoogleFonts.lato(
                    color: Colors.white60,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,

                  ),
                ),
                const SizedBox(height: 30,),
                QuestionSummary(summaryData),
                const SizedBox(height: 30,),
                TextButton.icon(
                  onPressed: restartView,
                  icon: Icon(Icons.refresh,color: Colors.white),
                  label: Text("restart Quiz",style: TextStyle(color: Colors.white),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
