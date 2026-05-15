import 'package:flutter/material.dart';
import '../page_transitions.dart';
import '../result_page.dart';

class QuizPage8 extends StatelessWidget {
  final List<Map<String, int>> answers;
  const QuizPage8({super.key, required this.answers});

  @override
  Widget build(BuildContext context) {
    final choices = [
      {
        'text': 'ขนมกรุบกรอบ',
        'scores': {'S': 2, 'L': 1, 'N': 0, 'F': 2, 'B': 0, 'M': 1},
      },
      {
        'text': 'ขนมหวาน',
        'scores': {'S': 3, 'L': 1, 'N': 0, 'F': 1, 'B': 0, 'M': 2},
      },
      {
        'text': 'บะหมี่กึ่งสำเร็จรูป',
        'scores': {'S': 0, 'L': 7, 'N': 2, 'F': 7, 'B': 0, 'M': 0},
      },
      {
        'text': 'ไม่กินดึก',
        'scores': {'S': 3, 'L': 0, 'N': 2, 'F': 0, 'B': 7, 'M': 2},
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
              'assets/images/story8_q8_bg.gif',
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      // 🔹 คำถาม
                      const Text(
                        'คุณรู้สึกหิวขึ้นมา...\nคุณจะทำยังไง?',
                        style: TextStyle(
                          fontSize: 20,
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
                            height: 56,
                            child: ElevatedButton(
                              onPressed: () {
                                final choiceText = choice['text'] as String;
                                print('✅ ผู้ใช้เลือก: "$choiceText"');
                                final updatedAnswers = [
                                  ...answers,
                                  choice['scores'] as Map<String, int>,
                                ];
                                Navigator.push(
                                  context,
                                  fadeRoute(
                                    ResultPage(answers: updatedAnswers),
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