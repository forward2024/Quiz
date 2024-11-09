import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'history_screen.dart';
import 'home_screen.dart';

class ResultScreen extends StatefulWidget {
  final int correctAnswers;
  final int totalQuestions;

  const ResultScreen({
    super.key,
    required this.correctAnswers,
    required this.totalQuestions,
  });

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
    double percentage = (widget.correctAnswers / widget.totalQuestions) * 100;

    String resultMessage;
    if (percentage >= 80) {
      resultMessage = 'Відмінний результат!';
    } else if (percentage >= 50) {
      resultMessage = 'Непогано, але можна краще.';
    } else {
      resultMessage = 'Спробуйте ще раз!';
    }

    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: const Text('Результат'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 50),
            Icon(
              percentage >= 80 ? Icons.emoji_events : Icons.sentiment_satisfied,
              color: Colors.deepPurple,
              size: 100,
            ),
            const SizedBox(height: 20),
            Text(
              resultMessage,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            Text(
              'Ви відповіли правильно на ${widget.correctAnswers} з ${widget.totalQuestions} питань!',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HistoryScreen(),
                  ),
                );
              },
              child: const Text('Переглянути історію результатів'),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.deepPurple),
                textStyle: const TextStyle(fontSize: 20),
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 24.0),
              ),
              child: const Text(
                'Повернутися до головного меню',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
