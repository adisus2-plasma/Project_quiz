import 'package:flutter/material.dart';
import 'package:project_quiz/page_transitions.dart';
import 'package:project_quiz/quiz_pages/quiz_page_1.dart';

class StoryPage3 extends StatelessWidget {
  const StoryPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [

          // 🔹 GIF Background เต็มจอ
          Positioned.fill(
            child: Image.asset(
              'assets/images/story123_q1.gif',
              fit: BoxFit.cover,
            ),
          ),

          // 🔹 Overlay มืดด้านล่างให้อ่านข้อความง่าย
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black54, // ← ด้านล่างมืดนิดนึง
                  ],
                  stops: [0.0, 0.5, 1.0],
                ),
              ),
            ),
          ),

          // 🔹 เนื้อหา
          Positioned(
            left: 24,
            right: 24,
            bottom: 80,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                // 🔹 ข้อความ
                const Text(
                  'เสียงโทรศัพท์ของคุณขึ้น\nและนี่เป็นเหตุผลที่ทำให้คุณ\nต้องตื่นเช้า',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.6,
                    shadows: [
                      Shadow(
                        color: Colors.black45,
                        blurRadius: 6,
                        offset: Offset(1, 2),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 40),

                // 🔹 ปุ่มถัดไป
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      fadeRoute(QuizPage1(answers: [])),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 14,
                    ),
                  ),
                  child: const Text(
                    'ถัดไป',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}