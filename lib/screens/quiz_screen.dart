import 'package:flutter/material.dart';
import 'package:quiz_app1/models/quiz_model.dart';
import 'package:quiz_app1/services/quiz_service.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final QuizService _quizService = QuizService();
  List<Question> _questions = [];
  int _currentQuestionIndex = 0;
  int _score = 0;

  @override
  void initState() {
    super.initState();
    _questions = _quizService.getQuestions();
  }

  void _answerQuestion(int selectedIndex) {
    if (_questions[_currentQuestionIndex].correctAnswerIndex == selectedIndex) {
      _score++;
    }
    setState(() {
      _currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_currentQuestionIndex >= _questions.length) {
      return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Quiz App')),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Quiz Completed!',
                style: TextStyle(fontSize: 24),
              ),
              Text(
                'Your Score: $_score',
                style: TextStyle(fontSize: 24),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _currentQuestionIndex = 0;
                    _score = 0;
                  });
                },
                child: Text('Restart Quiz'),
              ),
            ],
          ),
        ),
      );
    }

    Question currentQuestion = _questions[_currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Quiz App')),
      ),
      body: 
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  currentQuestion.question,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
              ),
              SizedBox(height: 20),
              ...currentQuestion.options.asMap().entries.map((entry) {
                int idx = entry.key;
                String option = entry.value;
                return ElevatedButton(
                  onPressed: () => _answerQuestion(idx),
                  child: Text(option),
                );
              }).toList(),
            ],
          ),
        )
        );
  }
}
