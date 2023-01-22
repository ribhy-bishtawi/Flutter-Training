import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final String yourAnswer;
  final VoidCallback answerQuestion; //Function was here
  Answers(this.yourAnswer, this.answerQuestion);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(yourAnswer),
      style: ElevatedButton.styleFrom(primary: Colors.blue),
      onPressed: answerQuestion,
    );
  }
}
