import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'history_screen.dart';
import 'quiz_screen.dart';

class ResultScreen extends StatefulWidget {
  final int correctAnswers;
  final int totalQuestions;

  const ResultScreen(
      {super.key, required this.correctAnswers, required this.totalQuestions});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void initState() {
    super.initState();
    _saveResult();
  }

  void _saveResult() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> history = prefs.getStringList('quiz_history') ?? [];
    history.add('${widget.correctAnswers}/${widget.totalQuestions}');
    prefs.setStringList('quiz_history', history);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Результат'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Ви відповіли правильно на ${widget.correctAnswers} з ${widget.totalQuestions} питань!',
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HistoryScreen()),
                );
              },
              child: const Text('Переглянути історію результатів'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizScreen()),
                );
              },
              child: const Text('Пройти ще раз'),
            ),
          ],
        ),
      ),
    );
  }
}
