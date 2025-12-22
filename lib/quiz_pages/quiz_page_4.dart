import 'package:flutter/material.dart';
import 'package:project_quiz/story_pages/story_page_6.dart';

class QuizPage4 extends StatelessWidget {
  final List<Map<String, int>> answers;

  const QuizPage4({super.key, required this.answers});

  @override
  Widget build(BuildContext context) {
    final choices = [
      {
        'text': 'น้ำอัดลม',
        'scores': {'S': 1, 'L': 2, 'N': 3, 'F': 7, 'B': 0, 'M': 0},
      },
      {
        'text': 'น้ำหวาน เช่น โกโก้',
        'scores': {'S': 7, 'L': 0, 'N': 1, 'F': 0, 'B': 3, 'M': 2},
      },
      {
        'text': 'กาเเฟ / ชา',
        'scores': {'S': 2, 'L': 0, 'N': 1, 'F': 0, 'B': 7, 'M': 3},
      },
      {
        'text': 'น้ำเปล่า',
        'scores': {'S': 0, 'L': 3, 'N': 2, 'F': 1, 'B': 7, 'M': 0}
      }
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('4. ตอนนี้คุณหิวน้ำมาก...คุณจะสั่งอะไรดี?')),
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
                    builder: (_) => StoryPage6(answers: updatedAnswers), // ส่งต่อ
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
