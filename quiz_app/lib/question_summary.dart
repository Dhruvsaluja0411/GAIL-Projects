import 'package:flutter/material.dart';
import 'package:quiz_app/question_nums.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 200,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                children: [
                  // Text(((data['question-index'] as int)+1 as String)),
                  // Text(((data['question_index'] as int) + 1).toString()),
                  
                  QuestionIcon(isCorrectAnswer: (data['user_answer']==data['correct_answer']), questionIndex: data['question_index'] as int),
            
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['question'] as String,
                        style: const TextStyle(color: Colors.white,fontSize: 15),
                        textAlign: TextAlign.justify,),
                        
                        const SizedBox(height: 5,),
                        Text(data['user_answer'] as String,
                        style: const TextStyle(color: Color.fromARGB(255, 24, 177, 197),),),
                        Text(data['correct_answer'] as String,
                        style: const TextStyle(color: Color.fromARGB(255, 19, 242, 112),)),
                       const SizedBox(height: 15,),
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
