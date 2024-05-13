import 'dart:math';
import 'package:flutter/material.dart';
import 'package:first_app/styled_text.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget{
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
var currentdice = 2;

void rollDice() { 
  setState(() {
    currentdice = randomizer.nextInt(6)+1;
  // print("changing image");
  });
  
}

  @override
  Widget build(context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const StyledText('FirstAPP'),
            Image.asset(
              'assets/images/dice-$currentdice.png',
              width: 200,
            ),
            const SizedBox(height: 20,),
            // const StyledText('Hello World!'),
            TextButton(
              onPressed: rollDice,
              style: TextButton.styleFrom(
                // padding: const EdgeInsets.only(
                //   top: 40,
                // ),
                foregroundColor: const Color.fromARGB(255, 127, 13, 35),
                textStyle: const TextStyle(fontSize: 28),
              ),
              child: const Text('Roll Dice!'),
            )
          ],
        );
  }
}