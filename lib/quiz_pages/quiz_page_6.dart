import 'package:flutter/material.dart';
import 'package:project_quiz/quiz_pages/quiz_page_7.dart';

class QuizPage6 extends StatelessWidget {
  final List<Map<String, int>> answers;

  const QuizPage6({super.key, required this.answers});

  @override
  Widget build(BuildContext context) {
    final choices = [
      {
        'text': 'กินหมาล่าหลัง 20:00 น.',
        'scores': {'S': 7, 'L': 1, 'N': 0, 'F': 2, 'B': 0, 'M': 3},
      },
      {
        'text': 'กินอาหารตามสั่ง เช่น ข้าวหมูทอดกระเทียม ไก่ทอด ช่วง 18:00 - 20:00 น.',
        'scores': {'S': 2, 'L': 7, 'N': 0, 'F': 3, 'B': 1, 'M': 0},
      },
      {
        'text': 'กินอาหารเบา ๆ เช่น ข้าวกับต้มจืด สลัด ช่วง 18:00 - 20:00 น.',
        'scores': {'S': 0, 'L': 1, 'N': 7, 'F': 2, 'B': 0, 'M': 3},
      },
      {
        'text': 'ไม่กินหรอกมื้อเย็นด',
        'scores': {'S': 3, 'L': 0, 'N': 1, 'F': 0, 'B': 7, 'M': 2},
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('6. มื้อเย็นของวันนี้...คุณตอนไหน เเละกินอะไรดีหล่ะ?')),
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
                    builder: (_) => QuizPage7(answers: updatedAnswers), // ส่งต่อ
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
