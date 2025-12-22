import 'package:flutter/material.dart';
import 'package:project_quiz/story_pages/story_page_9.dart';

class QuizPage7 extends StatelessWidget {
  final List<Map<String, int>> answers;

  const QuizPage7({super.key, required this.answers});

  @override
  Widget build(BuildContext context) {
    final choices = [
      {
        'text': 'กินไปด้วย เล่นมือถือไปด้วย',
        'scores': {'S': 0, 'L': 3, 'N': 2, 'F': 0, 'B': 1, 'M': 7},
      },
      {
        'text': 'กินช้า ไม่ต้องรีบ',
        'scores': {'S': 0, 'L': 7, 'N': 3, 'F': 0, 'B': 1, 'M': 2},
      },
      {
        'text': 'กินเร็ว กลืนไว',
        'scores': {'S': 0, 'L': 0, 'N': 2, 'F': 1, 'B': 7, 'M': 3},
      },
      {
        'text': 'กินตามอารมณ์',
        'scores': {'S': 1, 'L': 3, 'N': 0, 'F': 2, 'B': 7, 'M': 0},
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('7. ระหว่างคุณกินข้าว...คุณคิดว่าคุณเป็นคนเเบบไหน?')),
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
                    builder: (_) => StoryPage9(answers: updatedAnswers), // ส่งต่อ
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
