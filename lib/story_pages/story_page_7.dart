import 'package:flutter/material.dart';
import 'package:project_quiz/page_transitions.dart';
import 'package:project_quiz/quiz_pages/quiz_page_6.dart';

class StoryPage7 extends StatelessWidget {
  final List<Map<String, int>> answers;
  const StoryPage7({super.key, required this.answers});
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
              'assets/images/food_quiz_only.webp',
              fit: BoxFit.cover,
            ),
          ),

          // 🔹 เนื้อหา
          // 🔹 เนื้อหา
          SafeArea(
            child: Column(
              children: [

                const Spacer(flex: 1,), // ← ด้านบน

                // 🔹 ข้อความตรงกลาง
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'คุณสะดุ้งตื่น\nและเหลือบไปมองนาฬิกา\nเป็นเวลา 6 โมง',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const Spacer(), // ← ด้านล่าง (ดันปุ่มลงไป)

                // 🔹 ปุ่มถัดไป
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          fadeRoute(
                            QuizPage6(
                              answers: answers,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
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
                  ),
                ),

                const SizedBox(height: 48),
              ],
            ),
          ),
        ],
      ),
    );
  }
}