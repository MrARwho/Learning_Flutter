import 'package:flutter/material.dart';
import 'answer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Question> questions = [
    Question('What is 2 + 2?', 'a'),
    Question('What is the capital of France?', 'c'),
  ];
  final Map<int, bool> answeredCorrectly = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz App')),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final question = questions[index];
          return ListTile(
            title: Text(
              question.questionText,
              style: TextStyle(
                color: answeredCorrectly[index] == true
                    ? Colors.green
                    : answeredCorrectly[index] == false
                        ? Colors.red
                        : Colors.black,
              ),
            ),
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuestionScreen(question: question),
                ),
              );

              if (result != null) {
                setState(() {
                  answeredCorrectly[index] = result;
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(result ? 'Correct!' : 'Incorrect!'),
                    backgroundColor: result ? Colors.green : Colors.red,
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}

class Question {
  final String questionText;
  final String correctAnswer;

  Question(this.questionText, this.correctAnswer);
}

