import 'package:flutter/material.dart';
import 'package:project_quiz/story_pages/story_page_mall_2.dart';
import 'package:project_quiz/story_pages/story_page_cafe_3.dart';
import 'package:project_quiz/story_pages/story_page_themepark_3.dart';

class QuizPage3 extends StatelessWidget {
  final List<Map<String, int>> answers;
  final String lastPage;
  const QuizPage3({super.key, required this.answers, required this.lastPage});

  @override
  Widget build(BuildContext context) {
    final choices = [
      {
        'text': 'ก๋วยเตี๋ยว',
        'scores': {'S': 7, 'L': 1, 'N': 0, 'F': 0, 'B': 2, 'M': 3},
      },
      {
        'text': 'ส้มตำข้าวเหนียว เเละไก่ย่าง',
        'scores': {'S': 0, 'L': 3, 'N': 2, 'F': 7, 'B': 1, 'M': 0},
      },
      {
        'text': 'สลัดโรล',
        'scores': {'S': 1, 'L': 3, 'N': 2, 'F': 0, 'B': 0, 'M': 7},
      },
      {
        'text': 'ไม่กินดีกว่ากลางวัน',
        'scores': {'S': 1, 'L': 7, 'N': 3, 'F': 0, 'B': 2, 'M': 0},
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('3. มื้อเที้ยงวันนี้คุณจะสั่งอะไร?')),
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

                Widget nextPage;

                if (lastPage == 'StoryPageMall1') {
                  nextPage = StoryPageMall2(answers: updatedAnswers);
                  print('✅ ไปยัง StoryPageMall2');
                } else if (lastPage == 'StoryPageCafe2') {
                  nextPage = StoryPageCafe3(answers: updatedAnswers);
                  print('✅ ไปยัง StoryPageCafe3');
                } else if (lastPage == 'StoryPageThemePark2') {
                  nextPage = StoryPageThemePark3(answers: updatedAnswers);
                  print('✅ ไปยัง StoryPageThemePark3');
                } else {
                  throw Exception('Unknown last page: $lastPage');
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => nextPage),
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
