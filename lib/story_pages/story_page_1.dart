import 'package:flutter/material.dart';
import '../page_transitions.dart';
import 'story_page_2.dart';

class StoryPage1 extends StatelessWidget {
  const StoryPage1({super.key});

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
                    'เช้าวันหยุดสุดสัปดาห์\nเสียงนาฬิกาปลุกดังขึ้น',
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
                      fadeRoute(StoryPage2()),
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