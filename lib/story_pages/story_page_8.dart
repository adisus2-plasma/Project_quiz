import 'package:flutter/material.dart';
import 'package:project_quiz/page_transitions.dart';
import 'package:project_quiz/quiz_pages/quiz_page_8.dart';

class StoryPage8 extends StatelessWidget {
  final List<Map<String, int>> answers;
  const StoryPage8({super.key, required this.answers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [

          // 🔹 Background
          Positioned.fill(
            child: Image.asset(
              'assets/images/story8_q8_bg.gif',
              fit: BoxFit.cover,
            ),
          ),

          // 🔹 เนื้อหา
          SafeArea(
            child: Column(
              children: [

                const Spacer(flex: 3),

                // 🔹 หมอกฟุ้งวงรี + text
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 320,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.9),
                            blurRadius: 40,
                            spreadRadius: 30,
                          ),
                          BoxShadow(
                            color: Colors.white.withOpacity(0.6),
                            blurRadius: 80,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'หลังจากคุณอาบน้ำเสร็จ\nและนั่งทำงานแล้วเหลือบไป\nเห็นนาฬิกาเป็นเวลา 5 ทุ่ม',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),

                const Spacer(flex: 1),

                // 🔹 ปุ่มถัดไป
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      fadeRoute(QuizPage8(answers: answers)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 14,
                    ),
                    elevation: 0,
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