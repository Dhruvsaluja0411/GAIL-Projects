import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});
  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 70,
        ),
        const Text(
          'QUIZ APP',
          style: TextStyle(
              fontSize: 38,
              color: Color.fromARGB(255, 234, 184, 34),
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        const SizedBox(
          height: 90,
        ),
        // Opacity(
        //   opacity: 0.8,
        //   child: Image.asset(
        //     'assets/images/logo.png',
        //     width: 270,
        //   ),
        // ),
        Image.asset(
          'assets/images/logo.png',
          width: 270,
        ),
        const Text(
          'Learn Flutter fun way!',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 217, 189, 237)),
        ),
        const SizedBox(
          height: 70,
        ),
        OutlinedButton.icon(
          // onPressed: () {
          //   startQuiz();
          // },
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 244, 242, 235),
            backgroundColor: const Color.fromARGB(255, 39, 100, 213),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          icon: const Icon(Icons.keyboard_arrow_right_rounded),
          label: const Text(
            'Start Quiz!',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
