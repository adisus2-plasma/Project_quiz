import 'package:flutter/material.dart';
import 'package:project_quiz/story_pages/story_page_3.dart';

void main() => runApp(StoryPage2());

class StoryPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StoryScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StoryScreen extends StatefulWidget {
  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // เริ่มจากล่างสุด
      end: const Offset(0, 0.5),          // ไปหยุดที่ตำแหน่งเดิม
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SlideTransition(
              position: _slideAnimation,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: Image.asset(
                  'assets/images/story2_phone.png', // ต้องตรงกับชื่อไฟล์ที่คุณอัปโหลด
                  width: MediaQuery.of(context).size.width * 1,
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => StoryPage3()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFC83D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
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
    );
  }
}
