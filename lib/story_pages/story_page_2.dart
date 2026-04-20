import 'package:flutter/material.dart';
import 'package:project_quiz/story_pages/story_page_3.dart';

class StoryPage2 extends StatefulWidget {
  const StoryPage2({super.key});

  @override
  State<StoryPage2> createState() => _StoryPage2State();
}

class _StoryPage2State extends State<StoryPage2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // ใช้ double แทน Offset — ควบคุมได้ง่ายกว่า
    _slideAnimation = Tween<double>(
      begin: 2.0, // เริ่มซ่อนใต้จอ
      end: 0.2,   // ขึ้นมาเต็มที่
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [

          // 🔹 GIF Background
          Positioned.fill(
            child: Image.asset(
              'assets/images/story123_q1.gif',
              fit: BoxFit.cover,
            ),
          ),

          // 🔹 รูปมือถือ + ปุ่ม เลื่อนขึ้นพร้อมกัน
// 🔹 รูปมือถือ + ปุ่มทับ
          AnimatedBuilder(
            animation: _slideAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, screenHeight * _slideAnimation.value),
                child: child,
              );
            },
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [

                  // 🔹 รูปมือถือ
                  Image.asset(
                    'assets/images/story2_phone.png',
                    width: screenWidth * 0.85,
                  ),

                  // 🔹 ปุ่มหยุด ทับอยู่บนรูปมือถือด้านล่าง
                  Positioned(
                    bottom: 300, // ← ขยับขึ้นลงได้ตามใจ
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => StoryPage3()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFC83D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 14,
                        ),
                      ),
                      child: const Text(
                        'หยุด',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
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