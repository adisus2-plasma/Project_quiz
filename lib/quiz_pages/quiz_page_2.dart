import 'package:flutter/material.dart';
import '../story_pages/story_page_mall_1.dart';
import '../story_pages/story_page_cafe_1.dart';
import '../story_pages/story_page_themepark_1.dart';

class QuizPage2 extends StatelessWidget {
  final List<Map<String, int>> answers;
  const QuizPage2({super.key, required this.answers});

  @override
  Widget build(BuildContext context) {
    final choices = [
      {
        'text': 'ห้าง',
        'next': (BuildContext context, List<Map<String, int>> answers) => 
            StoryPageMall1(answers: answers),
      },
      {
        'text': 'คาเฟ่',
        'next': (BuildContext context, List<Map<String, int>> answers) => 
            StoryPageCafe1(answers: answers),
      },
      {
        'text': 'สวนสนุก',
        'next': (BuildContext context, List<Map<String, int>> answers) => 
            StoryPageThemePark1(answers: answers),
      },
    ];

    return Scaffold(
      appBar: AppBar(title: Text('2. คุณคิดว่าเพื่อนจะชวนไปที่ไหน?')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: choices.map((choice) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ElevatedButton(
              onPressed: () {
                // เพิ่ม log ถ้าต้องการ
                print('✅ ผู้ใช้เลือก: ${choice['text']}');

                // ไปยังหน้าที่กำหนด
                final Function nextPage = choice['next'] as Function;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => nextPage(context, answers),
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
