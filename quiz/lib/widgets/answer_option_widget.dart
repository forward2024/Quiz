import 'package:flutter/material.dart';

class AnswerOptionWidget extends StatelessWidget {
  final String optionText;
  final int index;
  final VoidCallback onTap;

  const AnswerOptionWidget({
    super.key,
    required this.optionText,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: ListTile(
        onTap: onTap,
        title: Text(
          optionText,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
