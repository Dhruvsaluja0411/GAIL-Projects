import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultsScreen extends StatelessWidget{
  const ResultsScreen({super.key,required this.chosenAnswers,required this.restartQuiz});
  final List<String> chosenAnswers;
  final void Function() restartQuiz;
  List<Map<String,Object>> getSummaryData(){
    List<Map<String,Object>> summary = [];
    for( var i = 0;i<chosenAnswers.length;i++)
    {
    summary.add({
      'question_index':i,
      'question':questions[i].text,
      'correct_answer':questions[i].answers[0],
      'user_answer':chosenAnswers[i],
    });
    }
    return summary;
  }
  @override
  Widget build(context)
  {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where(
      (data) {
        return data['user_answer'] == data['correct_answer'];
      }
    ).length;

    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('you answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
          style: GoogleFonts.poppins(color: const Color.fromARGB(255, 229, 216, 216),fontSize: 20),
          textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40,),
          QuestionSummary(summaryData: summaryData),
          const SizedBox(height: 20,),
          OutlinedButton.icon(
          // onPressed: () {
          //   startQuiz();
          // },
          onPressed: restartQuiz,
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 244, 242, 235),
            backgroundColor: const Color.fromARGB(255, 39, 100, 213),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          icon: const Icon(Icons.restart_alt_rounded),
          label: const Text(
            'Restart Quiz!',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
        ),
        ],
      ),
    );
  }
}