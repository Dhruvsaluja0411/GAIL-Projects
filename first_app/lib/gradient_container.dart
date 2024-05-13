import 'package:first_app/dice_roller.dart';
import 'package:flutter/material.dart';


var gradientRadius = 1.35;

class GradientContainer extends StatelessWidget {
// const GradientContainer({super.key, required this.outColors});
// we can take different two colors as well and pass them in [] below
const GradientContainer(this.outColors, {super.key});

// const GradientContainer.blue({super.key}): color1= Colors.deepPurple, color2= Colors.amber;
// final Color color1,color2;

  final List<Color> outColors;
  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          radius: gradientRadius,
          colors: outColors,
        ),
      ),
      child: const Center(
        // child: StyledText('Hello World!'),
        child: DiceRoller(),
      ),
    );
  }
}
