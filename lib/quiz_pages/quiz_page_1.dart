import 'package:flutter/material.dart';
import 'package:project_quiz/page_transitions.dart';
import 'package:project_quiz/story_pages/story_page_4.dart';

class QuizPage1 extends StatelessWidget {
  final List<Map<String, int>> answers;
  const QuizPage1({super.key, required this.answers});

  @override
  Widget build(BuildContext context) {
    final choices = [
      {
        'text': 'กินข้าวเหนียวหมูปิ้ง',
        'scores': {'S': 3, 'L': 1, 'N': 0, 'F': 7, 'B': 2, 'M': 0},
      },
      {
        'text': 'ข้าวกระเพราไข่ดาว',
        'scores': {'S': 2, 'L': 1, 'N': 0, 'F': 7, 'B': 3, 'M': 0},
      },
      {
        'text': 'กล้วยกับโยเกิร์ตก็พอเบาๆ',
        'scores': {'S': 3, 'L': 1, 'N': 0, 'F': 2, 'B': 7, 'M': 0},
      },
      {
        'text': 'ไม่กินหรอกมื้อเช้า',
        'scores': {'S': 1, 'L': 3, 'N': 7, 'F': 2, 'B': 0, 'M': 0},
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
              'assets/images/story123_q1.gif',
              fit: BoxFit.cover,
            ),
          ),

          // 🔹 Overlay มืดนิดนึง
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.25),
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
                    color: Colors.white.withOpacity(0.85), // กล่องขาวโปร่งแสง
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      // 🔹 คำถาม
                      const Text(
                        'มื้อเช้ากินอะไรดี?',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 24),

                      // 🔹 ตัวเลือก
                      ...choices.map((choice) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                final updatedAnswers = [...answers];
                                updatedAnswers.add(
                                  choice['scores'] as Map<String, int>,
                                );
                                Navigator.push(
                                  context,
                                  fadeRoute(
                                    StoryPage4(answers: updatedAnswers),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black87,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 16,
                                ),
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