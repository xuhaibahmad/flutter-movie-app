import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppTheme {
  bool darkMode;

  AppTheme._(this.darkMode);

  @factoryMethod
  static AppTheme create(@Named("dark_mode") bool dark) => AppTheme._(dark);

  ThemeMode get themeMode => darkMode ? ThemeMode.dark : ThemeMode.light;

  Color get transparent => Colors.transparent;
  Color get amber => Color(0xFFFFC107);
  Color get pink => Color(0xFFFE6D8E);
  Color get backgroundLightColor => Colors.white;
  Color get backgroundDarkColor => Colors.black;
  Color get offsetItemTint => darkMode ? Color(0x80000000) : Color(0x4DFFFFFF);
  Color get textColor => darkMode ? Color(0xFF8D8D8D) : Color(0xFF434670);
  Color get textColorDark => darkMode ? Color(0xFFFEFEFE) : Color(0xFF12153D);
  Color get textColor30 => darkMode ? Color(0xFF595959) : Color(0x4D12153D);
  Color get textColorLight => darkMode ? Color(0xFF595959) : Color(0x2612153D);

  ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: backgroundLightColor,
        canvasColor: backgroundLightColor,
        accentColor: pink,
        textTheme: textTheme,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "Proxima Nova",
      );

  ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: backgroundDarkColor,
        canvasColor: backgroundDarkColor,
        accentColor: pink,
        textTheme: textTheme,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

  TextTheme get textTheme => TextTheme(
        headline6: headline6,
        caption: caption,
        headline1: headline1,
        bodyText1: bodyText1,
        bodyText2: bodyText2,
      );

  TextStyle get headline6 => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 24,
        color: textColorDark,
      );

  TextStyle get caption => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: textColor,
      );

  TextStyle get headline1 => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: textColorDark,
      );

  TextStyle get bodyText1 => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
      );

  TextStyle get bodyText2 => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: textColorDark,
      );
}
