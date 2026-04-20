import 'package:flutter/material.dart';
import 'package:project_quiz/quiz_pages/quiz_page_2.dart';

class StoryPage4 extends StatelessWidget {
  final List<Map<String, int>> answers;
  const StoryPage4({super.key, required this.answers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [

          // 🔹 Background ลายตาราง
          Positioned.fill(
            child: Image.asset(
              'assets/images/story4_bg.png',
              fit: BoxFit.cover,
            ),
          ),

          // 🔹 เนื้อหา
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  const SizedBox(height: 200),

                  // 🔹 Notification LINE (กดได้)
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => QuizPage2(answers: answers),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/images/story4_bt.png',
                      width: double.infinity,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // 🔹 ลูกศรขึ้น + ข้อความ
                  const Column(
                    children: [
                      Icon(
                        Icons.keyboard_double_arrow_up,
                        color: Color(0xFF6B3A2A),
                        size: 28,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'แตะเพื่ออ่านข้อความ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6B3A2A),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}