import 'package:flutter/material.dart';

class AnswerOptionWidget extends StatelessWidget {
  final String optionText;
  final int index;
  final VoidCallback onTap;

  const AnswerOptionWidget(
      {super.key,
      required this.optionText,
      required this.index,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueAccent),
          child: Text(
            optionText,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        ));
  }
}
