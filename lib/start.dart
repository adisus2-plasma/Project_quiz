import 'package:flutter/material.dart';
import 'story_pages/story_page_1.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔹 ภาพพื้นหลังเต็มจอ
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.jpg', // เปลี่ยนตาม path ของคุณ
              fit: BoxFit.cover,
            ),
          ),
          // 🔹 ชั้นบนสุดเป็นเนื้อหา
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'เกมทายนิสัยการกิน',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: Colors.black45,
                        offset: Offset(2, 2),
                      )
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    backgroundColor: Colors.black.withOpacity(0.7),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => StoryPage1(),
                      ),
                    );
                  },
                  child: const Text(
                    'เริ่มเกม',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
