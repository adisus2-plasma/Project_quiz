import 'package:flutter/material.dart';
import 'package:project_quiz/story_pages/story_page_1.dart';

class ResultPage extends StatelessWidget {
  final List<Map<String, int>> answers; // เก็บคะแนนของแต่ละข้อที่มีการเก็บ

  const ResultPage({super.key, required this.answers});

  String getResult(Map<String, int> finalScores) {
    final topType = finalScores.entries.reduce((a, b) => a.value > b.value ? a : b).key;

    switch (topType) {
      case 'S':
        return 'S (Sugar Seeker) – ชอบอาหาร/เครื่องดื่มหวานจัด 😎';
      case 'L':
        return 'L (LateNight Muncher) – ชอบกินดึกหรือกินหลังเที่ยงคืน🧠';
      case 'N':
        return 'N (NoBreakfast / SkipMeal) – ข้ามมือบ่อย โดยเฉพาะไม่กินมื้อเช้า 💪';
      case 'F':
        return 'F (HighFat/HighSalt) – ชอบอาหารมันจัด เค็มจัด 🌍';
      case 'B':
        return 'B (Balanced Eater) – เลือกอาหารสมดุล/สุขภาพ 🎨';
      case 'M':
        return 'M (Mindless Eater) – กินเพลิน / กินเร็ว / กินตามอารมณ์ / กินไปทำกิจกรรมอื่นไป 🌑';
      default:
        return 'ไม่สามารถประมวลผลผลลัพธ์ได้';
    }
  }

  @override
  Widget build(BuildContext context) {
    // รวมคะแนนจากคำตอบที่เก็บไว้
    final Map<String, int> finalScores = {
      'S': 0,
      'L': 0,
      'N': 0,
      'F': 0,
      'B': 0,
      'M': 0,
    };

    print('🧮 มีคำตอบที่เก็บคะแนนทั้งหมด ${answers.length} ข้อ');

    for (int i = 0; i < answers.length; i++) {
      final score = answers[i];

      // DEBUG: พ่น log รายละเอียดเต็ม
      print('📥 ข้อที่ ${i + 1} รายละเอียดคะแนน: $score');

      // ✅ รวมทุกคะแนน
      score.forEach((key, value) {
        finalScores[key] = (finalScores[key] ?? 0) + value;
      });
}

    // DEBUG: log รวมคะแนน
      print('📊 คะแนนรวมของแต่ละประเภท: $finalScores');

    final resultText = getResult(finalScores);

    return Scaffold(
      appBar: AppBar(title: const Text('ผลลัพธ์ของคุณ')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              resultText,
              style: const TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                print("เริ้มเล่นใหม่ \n");
                // กลับไปหน้าแรกและ reset เกม
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) => StoryPage1(),
                  ),
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
              child: const Text('เริ่มเล่นใหม่', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
