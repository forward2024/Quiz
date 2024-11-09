import 'package:flutter/material.dart';
import '../models/question.dart';
import 'answer_option_widget.dart';

class QuestionWidget extends StatelessWidget {
  final Question question;
  final Function(int) onOptionSelected;

  const QuestionWidget(
      {super.key, required this.question, required this.onOptionSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question.questionText,
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 20),
        ...List.generate(
          question.options.length,
          (index) => AnswerOptionWidget(
            optionText: question.options[index],
            index: index,
            onTap: () => onOptionSelected(index),
          ),
        ),
      ],
    );
  }
}
