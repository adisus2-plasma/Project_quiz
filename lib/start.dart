import 'package:flutter/material.dart';
import 'story_pages/story_page_1.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 62, 60, 63), // สีพื้นเวลามีขอบด้านข้าง
      body: Center(
        // 🔹 ล็อกสัดส่วนจอให้เหมือนจอมือถือ 9:16
        child: AspectRatio(
          aspectRatio: 9 / 16, // width / height ปรับได้ตามที่ออกแบบ
          child: Stack(
            fit: StackFit.expand,
            children: [
              // 🔹 พื้นหลัง “เต็มกรอบมือถือ” ไม่ได้เต็มจอ desktop
              Image.asset(
                'assets/images/background.jpg',
                fit: BoxFit.cover,
              ),

              // 🔹 เนื้อหาตรงกลาง
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 16),
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
