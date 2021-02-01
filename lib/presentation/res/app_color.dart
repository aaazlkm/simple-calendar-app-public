import 'package:flutter/material.dart';

class AppColor {
  AppColor.light()
      : _colorScheme = ColorScheme(
          brightness: Brightness.light,
          primary: Colors.grey[200]!,
          primaryVariant: Colors.grey[500]!,
          onPrimary: Colors.grey[900]!,
          secondary: const Color.fromRGBO(246, 186, 51, 1),
          secondaryVariant: const Color.fromRGBO(211, 156, 45, 1),
          onSecondary: Colors.black,
          background: const Color.fromRGBO(244, 244, 244, 1),
          onBackground: Colors.grey[900]!,
          surface: Colors.white,
          onSurface: Colors.grey[900]!,
          error: const Color(0xffB00020),
          onError: Colors.white,
        ),
        _textColor = Colors.black,
        _holidayColor = const Color(0xffB00020),
        _cursorColor = Colors.grey[500]!;

  AppColor.dark()
      : _colorScheme = ColorScheme(
          brightness: Brightness.dark,
          primary: const Color(0xff121212),
          primaryVariant: Colors.black,
          onPrimary: Colors.grey[50]!,
          secondary: Colors.yellow[800]!,
          secondaryVariant: Colors.yellow[900]!,
          onSecondary: Colors.grey[50]!,
          background: Color.alphaBlend(Colors.white.withOpacity(0.02), const Color(0xff121212)),
          onBackground: Colors.grey[50]!,
          surface: Color.alphaBlend(Colors.white.withOpacity(0.08), const Color(0xff121212)),
          onSurface: Colors.grey[50]!,
          error: Color.alphaBlend(Colors.white.withOpacity(0.4), const Color(0xffB00020)),
          onError: Colors.grey[50]!,
        ),
        _textColor = Colors.white,
        _holidayColor = Color.alphaBlend(Colors.white.withOpacity(0.4), const Color(0xffB00020)),
        _cursorColor = Colors.grey[300]!;

  AppColor.lemon()
      : _colorScheme = ColorScheme(
          brightness: Brightness.light,
          primary: Colors.indigo[800]!,
          primaryVariant: Colors.indigo[900]!,
          secondary: Colors.yellow[800]!,
          secondaryVariant: Colors.yellow[900]!,
          background: Colors.yellow[400]!,
          surface: Colors.yellow[600]!,
          error: Colors.red,
          onPrimary: Colors.grey[800]!,
          onSecondary: Colors.white,
          onBackground: Colors.grey[800]!,
          onSurface: Colors.grey[800]!,
          onError: Colors.white,
        ),
        _textColor = Colors.grey[900]!,
        _holidayColor = Colors.red,
        _cursorColor = Colors.grey[300]!;

  static const int colorValue = 200;

  static List<Color> eventColors = [
    Colors.red[colorValue]!,
    Colors.pink[colorValue]!,
    Colors.purple[colorValue]!,
    Colors.deepPurple[colorValue]!,
    Colors.indigo[colorValue]!,
    Colors.blue[colorValue]!,
    Colors.cyan[colorValue]!,
    Colors.teal[colorValue]!,
    Colors.green[colorValue]!,
    Colors.lightGreen[colorValue]!,
    Colors.lime[colorValue]!,
    Colors.yellow[colorValue]!,
    Colors.amber[colorValue]!,
    Colors.orange[colorValue]!,
    Colors.deepOrange[colorValue]!,
    const Color.fromRGBO(232, 232, 232, 1),
  ];

  final ColorScheme _colorScheme;

  final Color _holidayColor;

  final Color _textColor;

  final Color _cursorColor;

  ColorScheme get colorScheme => _colorScheme;

  Color get holidayColor => _holidayColor;

  Color get textColor => _textColor;

  Color get cursorColor => _cursorColor;
}
