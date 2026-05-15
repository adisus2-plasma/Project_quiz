import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'page_transitions.dart';
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
              'assets/images/start_bg.gif',
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

                  // 🔹 ดันลงมาให้อยู่ใต้โลโก้ FOOD MY TYPE
                  const Spacer(flex: 8),

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

                  const Spacer(flex: 2),

                  const SizedBox(height: 24),

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
                          fadeRoute(StoryPage1()),
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

                  const Spacer(flex: 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}