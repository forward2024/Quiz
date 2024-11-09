// question_widget.dart

import 'package:flutter/material.dart';
import '../models/question.dart';
import 'answer_option_widget.dart';

class QuestionWidget extends StatelessWidget {
  final Question question;
  final Function(int) onOptionSelected;
  final int questionIndex;
  final int totalQuestions;

  const QuestionWidget({
    super.key,
    required this.question,
    required this.onOptionSelected,
    required this.questionIndex,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        // Вирівнювання по центру
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LinearProgressIndicator(
            value: (questionIndex + 1) / totalQuestions,
            backgroundColor: Colors.grey[300],
            color: Colors.deepPurple,
          ),
          const SizedBox(height: 20),
          Text(
            'Питання ${questionIndex + 1}',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            question.questionText,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          // Відображення варіантів відповіді
          Column(
            children: List.generate(
              question.options.length,
              (index) => AnswerOptionWidget(
                optionText: question.options[index],
                index: index,
                onTap: () => onOptionSelected(index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
