import 'package:flutter/material.dart';
import '../models/question.dart';
import '../widgets/question_widget.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int _currentQuestionIndex = 0;
  int _correctAnswers = 0;

  final List<Question> _questions = [
    Question(
      questionText: 'Що означає слово "ubiquitous"?',
      options: ['Rare', 'Everywhere', 'Expensive', 'Invisible'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'Який правильний переклад фрази "Break a leg"?',
      options: ['Good luck', 'Be careful', 'Take a break', 'Run quickly'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText:
          'Which tense is used in the sentence "She has been studying for three hours"?',
      options: [
        'Present Perfect',
        'Past Simple',
        'Future Continuous',
        'Present Continuous'
      ],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'What is the comparative form of "good"?',
      options: ['Gooder', 'More good', 'Better', 'Best'],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'Which word is a synonym for "happy"?',
      options: ['Sad', 'Elated', 'Angry', 'Tired'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'What is the past tense of "go"?',
      options: ['Goed', 'Went', 'Gone', 'Going'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText:
          'Choose the correct article: "__ apple a day keeps the doctor away."',
      options: ['A', 'An', 'The', 'No article needed'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'What does the phrasal verb "look up" mean?',
      options: [
        'To search for information',
        'To admire',
        'To increase',
        'To visit'
      ],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'Which sentence is in the passive voice?',
      options: [
        'The chef cooks the meal.',
        'The meal was cooked by the chef.',
        'The chef is cooking the meal.',
        'The meal cooks itself.'
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'What is the correct plural form of "child"?',
      options: ['Childs', 'Children', 'Childes', 'Chilren'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText:
          'Which preposition correctly completes the sentence: "She is interested ___ learning languages."?',
      options: ['On', 'In', 'At', 'By'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'What is the opposite of "increase"?',
      options: ['Grow', 'Expand', 'Decrease', 'Enhance'],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText:
          'Choose the correct form: "If I ___ you, I would apologize."',
      options: ['Am', 'Was', 'Were', 'Be'],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'Which word is an antonym of "ancient"?',
      options: ['Old', 'Modern', 'Historic', 'Antique'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'What is the noun form of the verb "decide"?',
      options: ['Decision', 'Decider', 'Decisive', 'Deciding'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'Choose the correctly spelled word:',
      options: ['Accommodate', 'Acommodate', 'Accomodate', 'Acomadate'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'Which modal verb expresses ability?',
      options: ['Must', 'Can', 'Should', 'Might'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText:
          'Identify the adverb in the sentence: "She quickly finished her homework."',
      options: ['She', 'Quickly', 'Finished', 'Homework'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText:
          'What is the correct form of the verb in present continuous tense for "They ___ to the park."?',
      options: ['Go', 'Going', 'Are going', 'Went'],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'Which sentence uses the correct subject-verb agreement?',
      options: [
        'The list of items are on the table.',
        'The list of items is on the table.',
        'The lists of items is on the table.',
        'The lists of items are on the table.'
      ],
      correctAnswerIndex: 1,
    ),
  ];

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  void _answerQuestion(int selectedIndex) {
    if (_questions[_currentQuestionIndex].correctAnswerIndex == selectedIndex) {
      _correctAnswers++;
    }

    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => ResultScreen(
                    correctAnswers: _correctAnswers,
                    totalQuestions: _questions.length,
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Quiz'),
        ),
        body: PageView.builder(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _questions.length,
          itemBuilder: (context, index) {
            return QuestionWidget(
              question: _questions[index],
              onOptionSelected: _answerQuestion,
            );
          },
        ));
  }
}
