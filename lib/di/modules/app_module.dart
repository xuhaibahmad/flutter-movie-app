import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:injectable/injectable.dart';

@module
@lazySingleton
abstract class AppModule {
  @Named("dark_mode")
  bool get darkModeEnabled {
    final brightness = SchedulerBinding.instance.window.platformBrightness;
    final darkModeOn = brightness == Brightness.dark;
    return darkModeOn;
  }
}
