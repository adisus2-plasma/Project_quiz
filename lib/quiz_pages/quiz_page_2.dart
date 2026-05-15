import 'package:flutter/material.dart';
import '../page_transitions.dart';
import '../story_pages/story_page_mall_1.dart';
import '../story_pages/story_page_cafe_1.dart';
import '../story_pages/story_page_themepark_1.dart';

class QuizPage2 extends StatelessWidget {
  final List<Map<String, int>> answers;
  const QuizPage2({super.key, required this.answers});

  @override
  Widget build(BuildContext context) {
    final choices = [
      {
        'text': 'ห้าง',
        'next': (BuildContext context, List<Map<String, int>> answers) =>
            StoryPageMall1(answers: answers),
      },
      {
        'text': 'คาเฟ่',
        'next': (BuildContext context, List<Map<String, int>> answers) =>
            StoryPageCafe1(answers: answers),
      },
      {
        'text': 'สวนสนุก',
        'next': (BuildContext context, List<Map<String, int>> answers) =>
            StoryPageThemePark1(answers: answers),
      },
    ];

    return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: ButtonTheme(
        minWidth: 40,
        height: 40,
        child: IconButton(
          padding: const EdgeInsets.all(1),
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xECEFCA), size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    ),
    extendBodyBehindAppBar: true,
    body: Stack(
      fit: StackFit.expand,
      children: [

        // 🔹 Background
        Positioned.fill(
          child: Image.asset(
            'assets/images/quiz2_bg.png',
            fit: BoxFit.cover,
          ),
        ),

        // 🔹 เนื้อหา + ปุ่ม
        Column(
          children: [
            const Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                children: choices.map((choice) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          print('✅ ผู้ใช้เลือก: ${choice['text']}');
                          final Function nextPage = choice['next'] as Function;
                          Navigator.push(
                            context,
                            fadeRoute(nextPage(context, answers)),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2C2C2C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          choice['text'] as String,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ],
    ),
  );
  }
}