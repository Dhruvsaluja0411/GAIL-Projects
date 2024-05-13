import 'package:flutter/material.dart';
class StyledText extends StatelessWidget{
  // const StyledText(String text, {super.key}): outText = text;
  const StyledText(this.outText, {super.key});
  final String outText;

  @override
  Widget build(context){
    return Text(outText, style: const TextStyle(
              color: Color.fromARGB(255, 73, 17, 17),
              fontSize: 28,
              fontWeight: FontWeight.w500, 
            ),);
  }
}