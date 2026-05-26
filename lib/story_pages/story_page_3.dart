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

          // 🔹 เนื้อหา
          SafeArea(
            child: Column(
              children: [
                const Spacer(flex: 3),

                // 🔹 ข้อความตรงกลาง
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'เสียงโทรศัพท์ของคุณขึ้น\nและนี่เป็นเหตุผล\nที่ทำให้คุณต้องตื่นเช้า',
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
                ),

                const Spacer(flex: 1),

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
                      horizontal: 50,  // ← ควบคุมความกว้างปุ่ม
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

                const Spacer(flex: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}