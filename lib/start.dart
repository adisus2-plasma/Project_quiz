import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'story_pages/story_page_1.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ซ่อน status bar ให้เต็มจอสุดๆ
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: Colors.transparent, // ← สำคัญมาก!
      body: Stack(
        fit: StackFit.expand,
        children: [

          // 🔹 GIF เต็มจอสุดขอบ
          Positioned.fill(
            child: Image.asset(
              'assets/images/start_bg.webp',
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [


                  // 🔹 โลโก้
                  Image.asset(
                    'assets/images/logo.png',
                    width: 280,
                  ),

                  // 🔹 Subtitle
                  const Text(
                    'รู้จักตัวตนของคุณผ่านจานโปรด',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const Spacer(flex: 3),

                  // 🔹 Quote box
                  Container(
                    padding: const EdgeInsets.all(16),
                    //กรอบ
                    // decoration: BoxDecoration(
                    //   color: Colors.white.withOpacity(0.75),
                    //   border: Border.all(color: Colors.black26),
                    //   borderRadius: BorderRadius.circular(8),
                    // ),
                    child: const Text(
                      '"กินยังไง ก็เป็นยังงั้น! มาค้นหาตัวตนที่ซ่อนอยู่ในอาหารมื้อโปรดของคุณ '
                      'แค่ตอบคำถามเรื่องกินๆ แล้วเราจะบอกว่าคุณมีตัวตนแบบไหนกันแน่! "',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black87,
                        height: 1.6,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // 🔹 ปุ่ม START
                  SizedBox(
                    width: 180,
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6DBF7E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 0,
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
                        'START',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),

                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}