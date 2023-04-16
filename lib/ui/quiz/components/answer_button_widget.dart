import 'package:flutter/material.dart';

class AnswerButtonWidget extends StatelessWidget {
  final String answerText;
  final bool isSelected;
  final VoidCallback onPressed;

  const AnswerButtonWidget({
    super.key,
    required this.answerText,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : null,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          answerText,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
