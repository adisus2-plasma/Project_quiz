import 'package:flutter/material.dart';
import 'package:project_quiz/story_pages/story_page_4.dart';

class QuizPage1 extends StatelessWidget {
  final List<Map<String, int>> answers;
  const QuizPage1({super.key, required this.answers});

  @override
  Widget build(BuildContext context) {
    final choices = [
      {
        'text': 'ข้าวเหนียวหมูปิ้ง',
        'scores': {'S': 2, 'L': 1, 'N': 0, 'F': 3, 'B': 7, 'M': 0},
      },
      {
        'text': 'ข้าวกะเพราไข่ดาว',
        'scores': {'S': 0, 'L': 2, 'N': 7, 'F': 0, 'B': 1, 'M': 3},
      },
      {
        'text': 'กล้วยกับโยเกิร์ตก็พอเบา ๆ',
        'scores': {'S': 7, 'L': 3, 'N': 2, 'F': 0, 'B': 0, 'M': 1},
      },
      {
        'text': 'ไม่กินหรอกมื้อเช้า',
        'scores': {'S': 7, 'L': 2, 'N': 1, 'F': 0, 'B': 3, 'M': 0},
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('1. มื้อเช้ากินอะไรดี?')),
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
                    builder: (_) => StoryPage4(answers: updatedAnswers), // ส่งต่อ
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
