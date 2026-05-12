import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gal/gal.dart';
import 'package:project_quiz/start.dart';

class ResultPage extends StatefulWidget {
  final List<Map<String, int>> answers;

  const ResultPage({super.key, required this.answers});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey _imageKey = GlobalKey();
  late final AnimationController _controller;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2200),
      vsync: this,
    );
    _slide = Tween<Offset>(
      begin: const Offset(0, -1.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _topType() {
    final scores = <String, int>{
      'S': 0,
      'L': 0,
      'N': 0,
      'F': 0,
      'B': 0,
      'M': 0,
    };
    for (final ans in widget.answers) {
      ans.forEach((k, v) {
        scores[k] = (scores[k] ?? 0) + v;
      });
    }
    return scores.entries.reduce((a, b) => a.value > b.value ? a : b).key;
  }

  String _imagePath(String type) {
    switch (type) {
      case 'S':
        return 'assets/images/results/sugar_seeker.png';
      case 'L':
        return 'assets/images/results/late_night_muncher.png';
      case 'N':
        return 'assets/images/results/skip_meal.png';
      case 'F':
        return 'assets/images/results/fried_fatty.png';
      case 'B':
        return 'assets/images/results/balanced_eater.png';
      case 'M':
        return 'assets/images/results/mindless_eater.png';
      default:
        return 'assets/images/results/sugar_seeker.png';
    }
  }

  Future<void> _saveImage() async {
    final messenger = ScaffoldMessenger.of(context);
    try {
      final boundary = _imageKey.currentContext!.findRenderObject()
          as RenderRepaintBoundary;
      final image = await boundary.toImage(pixelRatio: 3.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      final bytes = byteData!.buffer.asUint8List();

      final hasAccess = await Gal.hasAccess();
      if (!hasAccess) {
        final granted = await Gal.requestAccess();
        if (!granted) {
          messenger.showSnackBar(
            const SnackBar(content: Text('ไม่ได้รับอนุญาตเข้าถึงคลังรูป')),
          );
          return;
        }
      }

      await Gal.putImageBytes(bytes, name: 'food_type_receipt');
      messenger.showSnackBar(
        const SnackBar(content: Text('บันทึกรูปลงคลังรูปแล้ว')),
      );
    } catch (e) {
      messenger.showSnackBar(
        SnackBar(content: Text('บันทึกรูปไม่สำเร็จ: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final type = _topType();
    final imagePath = _imagePath(type);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/results/result_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          top: false,
          child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.zero,
                child: SlideTransition(
                  position: _slide,
                  child: RepaintBoundary(
                    key: _imageKey,
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.fitWidth,
                      width: double.infinity,
                      alignment: Alignment.topCenter,
                      errorBuilder: (context, error, stack) => Container(
                        height: 400,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          'ยังไม่มีรูปสำหรับตัวละคร "$type"\n($imagePath)',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _PillButton(label: 'บันทึกรูป', onTap: _saveImage),
                  _PillButton(
                    label: 'เล่นอีกครั้ง',
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => StartPage()),
                        (route) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }
}

class _PillButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _PillButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFB6E4A5),
        foregroundColor: Colors.black87,
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        elevation: 0,
      ),
      child: Text(label, style: const TextStyle(fontSize: 16)),
    );
  }
}
