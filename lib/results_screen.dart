import 'package:flutter/material.dart';
import 'package:prac02/data/questions.dart';
import 'package:prac02/question_summery.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chooseAnswer});

  final List<String> chooseAnswer;

  List<Map<String, Object>> getSummeryData() {
    final List<Map<String, Object>> summery = [];

    for (var i = 0; i < chooseAnswer.length; i++) {
      summery.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correctAnswer': questions[i].answers[0],
          'user_answer': chooseAnswer[i]
        },
      );
    }
    return summery;
  }

  @override
  Widget build(BuildContext context) {
    final summeryData = getSummeryData();
    final numTotalQuestions = questions.length;
    ;
    final numCorrectQuestions = summeryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
        width: double.infinity,
        child: Container(
            margin: const EdgeInsets.all(40),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                  'You answerd $numCorrectQuestions out of $numTotalQuestions questions correctly'),
              const SizedBox(
                height: 30,
              ),
              QuestionsSummary(summeryData),
              const SizedBox(
                height: 30,
              ),
              TextButton(onPressed: () {}, child: const Text('Restart Quiz!'))
            ])));
  }
}
