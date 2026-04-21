import 'package:flutter/material.dart';
import 'start.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const QuizApp());
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  bool _isLoading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadAssets();
  }

  Future<void> _loadAssets() async {
    await Future.wait([
      precacheImage(const AssetImage('assets/images/start_bg.gif'), context),
      precacheImage(const AssetImage('assets/images/logo.png'), context),
      precacheImage(const AssetImage('assets/images/story1_bg.gif'), context),
      precacheImage(const AssetImage('assets/images/story123_q1.gif'), context),
      precacheImage(const AssetImage('assets/images/story2_phone.png'), context),
      precacheImage(const AssetImage('assets/images/story4_bg.png'), context),
      precacheImage(const AssetImage('assets/images/story_4_bt.png'), context),
      precacheImage(const AssetImage('assets/images/story5_bg.gif'), context),
      precacheImage(const AssetImage('assets/images/mall1_bg.png'), context),
      precacheImage(const AssetImage('assets/images/mall23_q3.2_q4.2.gif'), context),
      precacheImage(const AssetImage('assets/images/quiz2_bg.png'), context),
      precacheImage(const AssetImage('assets/images/quiz67_bg.gif'), context),
      precacheImage(const AssetImage('assets/images/story8_q8_bg.gif'), context),
    ]);
    if (mounted) {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
      ),
      home: _isLoading
          ? const _LoadingScreen()
          : const StartPage(),
    );
  }
}

// 🔹 หน้า Loading
class _LoadingScreen extends StatelessWidget {
  const _LoadingScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF5ECD7),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: Color(0xFF6DBF7E),
            ),
            SizedBox(height: 16),
            Text(
              'กำลังโหลด...',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}