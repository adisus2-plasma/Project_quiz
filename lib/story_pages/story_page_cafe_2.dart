import 'package:flutter/material.dart';
import '../page_transitions.dart';
import '../quiz_pages/quiz_page_4.dart';

class StoryPageCafe2 extends StatelessWidget {
  final List<Map<String, int>> answers;
  const StoryPageCafe2({super.key, required this.answers});

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
              'assets/images/cafe2_bg.gif',
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
                        'เมื่อเข้ามาในร้าน\nคุณเริ่มรู้สึกกระหายน้ำ\nจากการเที่ยวกับเพื่อน',
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
                      fadeRoute(QuizPage4(answers: answers)),
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