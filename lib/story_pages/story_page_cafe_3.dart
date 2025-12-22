import 'package:flutter/material.dart';
import '../story_pages/story_page_cafe_4.dart'; // ✅ นำเข้า StoryPageCafe4

void main() => runApp(StoryPageCafe3(answers: []));

class StoryPageCafe3 extends StatelessWidget {
  final List<Map<String, int>> answers;
  const StoryPageCafe3({super.key, required this.answers}); // ชื่อ class ต้องตรงกับที่เรียกใช้

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StoryScreen(answers: answers), // ✅ ส่งต่อไปยัง StoryScreen
      debugShowCheckedModeBanner: false,
    );
  }
}

class StoryScreen extends StatelessWidget {
  final List<Map<String, int>> answers; // ✅ รับ parameter
  const StoryScreen({super.key, required this.answers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'เช้าวันหยุดสุดสัปดาห์เสียง\nนาฬิกาปลุกดังขึ้น(คาเฟ่3)',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => StoryPageCafe4(answers: answers), // ✅ ส่งต่อ
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 14,
                    ),
                  ),
                  child: const Text(
                    'ถัดไป',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
