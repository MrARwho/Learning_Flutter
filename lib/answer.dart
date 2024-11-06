import 'package:flutter/material.dart';
import 'questions.dart';

class QuestionScreen extends StatelessWidget {
  final Question question;
  final Map<String, String> options = {
    'a': '4',
    'b': '5',
    'c': 'Paris',
    'd': 'Berlin',
  };

  QuestionScreen({required this.question});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Answer the Question')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: options.entries.map((option) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                final isCorrect = option.key == question.correctAnswer;
                Navigator.pop(context, isCorrect);
              },
              child: Text('${option.key.toUpperCase()}: ${option.value}'),
            ),
          );
        }).toList(),
      ),
    );
  }
}