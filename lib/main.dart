import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'start.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  // ขนาดจอที่ใช้ตอนออกแบบ (ปรับได้ตาม mockup)
  static const double designWidth = 430;
  static const double designHeight = 932;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutBuilder(
        builder: (context, constraints) {
          // หาสเกลที่ทำให้จอ design อยู่ในกรอบจริงโดยไม่บิดสัดส่วน
          final scale = math.min(
            constraints.maxWidth / designWidth,
            constraints.maxHeight / designHeight,
          );

          return Container(
            color: const Color(0xFFF8ECFF), // สีพื้นด้านนอก “มือถือ”
            child: Center(
              child: Transform.scale(
                scale: scale,
                child: const SizedBox(
                  width: designWidth,
                  height: designHeight,
                  child: StartPage(),  // แอปของเรา
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
