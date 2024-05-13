import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {

  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';
  // Widget? activeScreen; // need to use ? so that initialisation can be done it means it can hold NULL values
  // @override
  // void initState() {
  //   super.initState();
  //   activeScreen = StartScreen(switchScreen);
  // }

  void switchScreen(){
    setState(() {
      // activeScreen = const Questions();
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswers(String answer){
    selectedAnswers.add(answer);
    if (selectedAnswers.length==questions.length)
    {
      setState(() {
        activeScreen = 'result-screen';
        // selectedAnswers.clear();
        // selectedAnswers = [];
      });
    }

  }

  void restartQuiz(){
    
    
      setState(() {
      // activeScreen = const Questions();
      activeScreen = 'question-screen';
      selectedAnswers.clear();
    });
    

  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if(activeScreen=='question-screen'){
      screenWidget = Questions(onSelectAnswer: chooseAnswers);
    }
    if(activeScreen == 'result-screen')
    {
      screenWidget = ResultsScreen(chosenAnswers: selectedAnswers,restartQuiz: restartQuiz,);
      
    }
    return MaterialApp(
        home: Scaffold(
            body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 66, 4, 114),
            Color.fromARGB(255, 84, 12, 139),
            Color.fromARGB(255, 32, 75, 192),
            Color.fromARGB(255, 75, 184, 239),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        // child: activeScreen,
        child : screenWidget,
        // activeScreen == 'start-screen'? StartScreen(switchScreen) : Questions(onSelectAnswer: chooseAnswers),
      ),
    )));
  }
}
