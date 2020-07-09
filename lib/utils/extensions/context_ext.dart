import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

extension ContextExtensions on BuildContext {
  applySystemColors(bool darkMode) {
    final color = darkMode ? Colors.black : Colors.white12;
    FlutterStatusbarcolor.setStatusBarColor(color);
    FlutterStatusbarcolor.setNavigationBarColor(color);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(darkMode);
    FlutterStatusbarcolor.setNavigationBarWhiteForeground(darkMode);
  }
}
