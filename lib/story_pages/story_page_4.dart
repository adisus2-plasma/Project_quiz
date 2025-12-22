import 'package:flutter/material.dart';
import 'story_page_5.dart';

void main() => runApp(StoryPage4(answers: [],));

class StoryPage4 extends StatelessWidget {
  final List<Map<String, int>> answers;
  const StoryPage4({super.key, required this.answers});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StoryScreen(answers: answers),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StoryScreen extends StatelessWidget {
  final List<Map<String, int>> answers;
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
                  'เช้าวันหยุดสุดสัปดาห์เสียง\nนาฬิกาปลุกดังขึ้น',
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
                        builder: (_) => StoryPage5(answers: answers),
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
