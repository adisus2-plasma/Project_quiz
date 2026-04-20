import 'package:flutter/material.dart';
import 'package:project_quiz/story_pages/story_page_6.dart';

class QuizPage5 extends StatelessWidget {
  final List<Map<String, int>> answers;
  const QuizPage5({super.key, required this.answers});

  @override
  Widget build(BuildContext context) {
    final choices = [
      {
        'text': 'ซื้อ',
        'scores': {'S': 0, 'L': 0, 'N': 0, 'F': 0, 'B': 0, 'M': 0},
      },
      {
        'text': 'ไม่ซื้อดีกว่า',
        'scores': {'S': 0, 'L': 0, 'N': 0, 'F': 0, 'B': 0, 'M': 0},
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
              'assets/images/story5_bg.gif',
              fit: BoxFit.cover,
            ),
          ),

          // 🔹 Overlay
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.10),
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
                        'คุณสนใจจะซื้อกลับไปไหม?',
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        StoryPage6(answers: updatedAnswers),
                                  ),
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