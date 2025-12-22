import 'package:flutter/material.dart';
import 'package:project_quiz/story_pages/story_page_7.dart';

class QuizPage5 extends StatelessWidget {
  final List<Map<String, int>> answers;

  const QuizPage5({super.key, required this.answers});

  @override
  Widget build(BuildContext context) {
    final choices = [
      {
        'text': '1',
        'scores': {'S': 0, 'L': 0, 'N': 0, 'F': 0, 'B': 0, 'M': 0},
      },
      {
        'text': '2',
        'scores': {'S': 0, 'L': 0, 'N': 0, 'F': 0, 'B': 0, 'M': 0},
      },
      {
        'text': '3',
        'scores': {'S': 0, 'L': 0, 'N': 0, 'F': 0, 'B': 0, 'M': 0},
      },
      {
        'text': '4',
        'scores': {'S': 0, 'L': 0, 'N': 0, 'F': 0, 'B': 0, 'M': 0},
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('คำถาม 5')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: choices.map((choice) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ElevatedButton(
              onPressed: () {
                final choiceText = choice['text'] as String;
                print('✅ ผู้ใช้เลือก: "$choiceText"');
                
                final updatedAnswers = [...answers]; // clone ก่อน
                updatedAnswers.add(choice['scores'] as Map<String, int>); // เพิ่มคะแนนของข้อ 3

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => StoryPage7(answers: updatedAnswers), // ส่งต่อ
                  ),
                );
              },
              child: Text(choice['text'] as String),
            ),
          );
        }).toList(),
      ),
    );
  }
}
