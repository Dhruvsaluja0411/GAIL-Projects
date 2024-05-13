import 'package:flutter/material.dart';

class QuestionIcon extends StatelessWidget
{
  const QuestionIcon({super.key, required this.isCorrectAnswer, required this.questionIndex});
  final int questionIndex;
  final bool isCorrectAnswer;
  
  @override
  Widget build(context)
  {
    final questionNumber = questionIndex + 1; 
    
       return Container(
        
          height: 30,
          width: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isCorrectAnswer? const Color.fromARGB(255, 134, 251, 111):const Color.fromARGB(255, 248, 71, 71),
            borderRadius: BorderRadius.circular(100),
           ),
           child: Text(
            questionNumber.toString(),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),

           ),
        );
      
  }
}