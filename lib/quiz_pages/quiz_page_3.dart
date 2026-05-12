import 'package:flutter/material.dart';
import 'package:project_quiz/story_pages/story_page_mall_2.dart';
import 'package:project_quiz/story_pages/story_page_cafe_2.dart';
import 'package:project_quiz/story_pages/story_page_themepark_2.dart';

class QuizPage3 extends StatelessWidget {
  final List<Map<String, int>> answers;
  final String lastPage;
  const QuizPage3({super.key, required this.answers, required this.lastPage});

  @override
  Widget build(BuildContext context) {
    final choices = [
      {
        'text': 'ก๋วยเตี๋ยว',
        'scores': {'S': 3, 'L': 1, 'N': 0, 'F': 0, 'B': 2, 'M': 3},
      },
      {
        'text': 'ส้มตำ/ข้าวเหนียวไก่ย่าง',
        'scores': {'S': 1, 'L': 2, 'N': 0, 'F': 7, 'B': 1, 'M': 0},
      },
      {
        'text': 'สลัดโรล',
        'scores': {'S': 3, 'L': 2, 'N': 1, 'F': 0, 'B': 0, 'M': 7},
      },
      {
        'text': 'ไม่กินดีกว่ากลางวันนี้',
        'scores': {'S': 2, 'L': 0, 'N': 7, 'F': 0, 'B': 2, 'M': 0},
      },
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [

          // 🔹 GIF Background
          Positioned.fill(
            child: Image.asset(
              'assets/images/food_quiz_only.webp',
              fit: BoxFit.cover,
            ),
          ),

          // 🔹 Overlay มืดนิดนึง
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.15),
            ),
          ),

          // 🔹 เนื้อหา
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.85),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // 🔹 คำถาม
                      const Text(
                        'มื้อเที่ยงวันนี้คุณจะสั่งอะไร?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),

                      const SizedBox(height: 24),

                      // 🔹 ตัวเลือก
                      ...choices.map((choice) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton(
                              onPressed: () {
                                final choiceText = choice['text'] as String;
                                print('✅ ผู้ใช้เลือก: "$choiceText"');
                                final updatedAnswers = [...answers];
                                updatedAnswers.add(
                                  choice['scores'] as Map<String, int>,
                                );

                                Widget nextPage;
                                if (lastPage == 'StoryPageMall1') {
                                  nextPage = StoryPageMall2(answers: updatedAnswers);
                                } else if (lastPage == 'StoryPageCafe1') {
                                  nextPage = StoryPageCafe2(answers: updatedAnswers);
                                } else if (lastPage == 'StoryPageThemePark1') {
                                  nextPage = StoryPageThemePark2(answers: updatedAnswers);
                                } else {
                                  throw Exception('Unknown last page: $lastPage');
                                }

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => nextPage),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF2C2C2C),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 0,
                              ),
                              child: Text(
                                choice['text'] as String,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}