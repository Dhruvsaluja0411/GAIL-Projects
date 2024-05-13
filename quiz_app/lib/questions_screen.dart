import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
class Questions extends StatefulWidget {
  const Questions({super.key,required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;
  @override
  State<Questions> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<Questions> {
  int currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer){
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }
  @override
  Widget build(context) {
    
    final currentQuestion = questions[currentQuestionIndex];
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Text(
            currentQuestion.text,
            style: GoogleFonts.poppins(
                fontSize: 20, color: const Color.fromARGB(255, 247, 246, 242),
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          ...currentQuestion.getShuffledAnswers().map((answer){
            return AnswerButton(answerText: answer, onTap: (){
              answerQuestion(answer);
            },);
          }),
          // AnswerButton(answerText: currentQuestion.answers[0], onTap: () {}),
          // AnswerButton(answerText: currentQuestion.answers[1], onTap: () {}),
          // AnswerButton(answerText: currentQuestion.answers[2], onTap: () {}),
          // AnswerButton(answerText: currentQuestion.answers[3], onTap: () {}),
        ],
      ),
    );
  }
}
