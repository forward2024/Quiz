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
      questionText: 'Which sentence correctly uses the mixed conditional?',
      options: [
        'If I was you, I would not do that.',
        'If I had known, I would have told you.',
        'If I am rich, I would travel the world.',
        'If I were you, I would travel the world.'
      ],
      correctAnswerIndex: 3,
    ),
    Question(
      questionText: 'What is the correct usage of "fewer" vs. "less"?',
      options: [
        'Use "fewer" with uncountable nouns and "less" with countable nouns.',
        'Use "fewer" with countable nouns and "less" with uncountable nouns.',
        'Both can be used interchangeably.',
        'Use "fewer" only in informal contexts.'
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText:
          'Choose the sentence that uses the correct form of the participle.',
      options: [
        'The broken window needs to be fixed.',
        'The breaking window needs to be fixed.',
        'The broke window needs to be fixed.',
        'The breaks window needs to be fixed.'
      ],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText:
          'Which word correctly completes the sentence: "Despite ___ the rain, we went hiking."?',
      options: ['to be', 'being', 'been', 'be'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'What is the function of a relative pronoun in a sentence?',
      options: [
        'To join two independent clauses.',
        'To introduce a relative clause.',
        'To replace a noun.',
        'To modify a verb.'
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText:
          'Choose the correct indirect speech form of: "She said, \'I will call you tomorrow.\'"',
      options: [
        'She said that she will call me tomorrow.',
        'She said that she would call me the next day.',
        'She said that she calls me tomorrow.',
        'She said that she called me the next day.'
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText:
          'Which sentence correctly uses a compound-complex structure?',
      options: [
        'I went to the store, and I bought some milk.',
        'Although it was raining, I went to the store, and I bought some milk.',
        'I went to the store because I needed milk.',
        'I went to the store; I bought some milk.'
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText:
          'What is the correct form of the verb in the sentence: "He suggests that she ___ earlier."?',
      options: ['to leave', 'leaves', 'leave', 'left'],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'Choose the sentence that correctly uses an infinitive.',
      options: [
        'She enjoys to swim.',
        'She enjoys swimming.',
        'She enjoys swim.',
        'She enjoys swam.'
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText:
          'What is the correct order of adjectives in the phrase: "a ___ dress"? (options: red, long, silk)',
      options: [
        'Silk, red, long dress',
        'Long, red, silk dress',
        'Red, long, silk dress',
        'Red, silk, long dress'
      ],
      correctAnswerIndex: 2,
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
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            correctAnswers: _correctAnswers,
            totalQuestions: _questions.length,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: Text(
          'Питання ${_currentQuestionIndex + 1}/${_questions.length}',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: PageView.builder(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _questions.length,
        itemBuilder: (context, index) {
          return QuestionWidget(
            question: _questions[index],
            onOptionSelected: _answerQuestion,
            questionIndex: index,
            totalQuestions: _questions.length,
          );
        },
      ),
    );
  }
}
