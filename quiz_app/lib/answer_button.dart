import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          // fixedSize: Size.fromWidth(380),
          side: const BorderSide(color: Colors.white),
          padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
          backgroundColor: const Color.fromARGB(255, 32, 12, 123),
          foregroundColor: const Color.fromARGB(255, 244, 239, 239),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(answerText,
        textAlign: TextAlign.center,));
  }
}
