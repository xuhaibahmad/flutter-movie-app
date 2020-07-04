import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProgressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SpinKitPulse(
        color: Colors.black38,
        size: 150.0,
      );
}
