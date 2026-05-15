import 'package:flutter/material.dart';

Route<T> fadeRoute<T>(Widget page, {Duration duration = const Duration(milliseconds: 350)}) {
  return PageRouteBuilder<T>(
    transitionDuration: duration,
    reverseTransitionDuration: duration,
    pageBuilder: (_, __, ___) => page,
    transitionsBuilder: (_, animation, __, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
