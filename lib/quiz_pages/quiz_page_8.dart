import 'package:flutter/material.dart';
import '../result_page.dart';

class QuizPage8 extends StatelessWidget {
  final List<Map<String, int>> answers;

  const QuizPage8({super.key, required this.answers});

  @override
  Widget build(BuildContext context) {
    final choices = [
      {
        'text': 'ขนมกรุบกรอบ',
        'scores': {'S': 1, 'L': 3, 'N': 2, 'F': 0, 'B': 0, 'M': 7},
      },
      {
        'text': 'ขนมหวาน',
        'scores': {'S': 0, 'L': 7, 'N': 1, 'F': 2, 'B': 0, 'M': 3},
      },
      {
        'text': 'บะหมี่กึ่งสำเร็จรูป',
        'scores': {'S': 3, 'L': 0, 'N': 0, 'F': 2, 'B': 1, 'M': 7},
      },
      {
        'text': 'ไม่กินดึก',
        'scores': {'S': 2, 'L': 0, 'N': 0, 'F': 7, 'B': 1, 'M': 2},
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('8. คุณรู้สึกหิวขึ้นมา...คุณจะทำยังไง?')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: choices.map((choice) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ElevatedButton(
              onPressed: () {
                final choiceText = choice['text'] as String;
                print('✅ ผู้ใช้เลือก: "$choiceText"');

                // เพิ่มคะแนนของข้อนี้ไปในรายการ answers
                final updatedAnswers = [...answers, choice['scores'] as Map<String, int>];

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ResultPage(answers: updatedAnswers),
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
