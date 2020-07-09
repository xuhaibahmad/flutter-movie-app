import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProgressView extends StatelessWidget {
  final bool darkMode;

  const ProgressView({Key key, this.darkMode = false}) : super(key: key);

  @override
  Widget build(BuildContext context) => SpinKitPulse(
        color: darkMode ? Colors.white38 : Colors.black38,
        size: 150.0,
      );
}
