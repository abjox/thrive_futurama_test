import 'package:flutter/material.dart';

// Define reusable colors
const Color kPrimaryColorLight = Color(0xFF7F9BA1);
const Color kSecondaryColorLight = Color(0xFFADDBEE);
const Color kTextColorLight = Color(0xFF373737);
const Color kPrimaryColorDark = Color(0xFFE7E7E7);
const Color kSecondaryColorDark = Color(0xFFACC7D8);
const Color kTextColorDark = Color(0xFFB2B2B2);
const Color kBackgroundColorLight = Color(0xFFF5F5F5);
const Color kBackgroundColorDark = Color(0xFF1A1A1A);

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme(
    primary: kPrimaryColorLight,
    primaryContainer: Color(0xFF5A5A5A),
    secondary: kSecondaryColorLight,
    secondaryContainer: Color(0xFF74A7B9),
    surface: Colors.white,
    background: kBackgroundColorLight,
    error: Color(0xFFB00020),
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: kTextColorLight,
    onBackground: kTextColorLight,
    onError: Colors.white,
    brightness: Brightness.light,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.bold,
      color: kTextColorLight,
    ),
    displayMedium: TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      color: kTextColorLight,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0,
      color: kTextColorLight,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      color: kTextColorLight,
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme(
    primary: kPrimaryColorDark,
    primaryContainer: Color(0xFF5A5A5A),
    secondary: kSecondaryColorDark,
    secondaryContainer: Color(0xFF74A7B9),
    surface: Color(0xFF121212),
    background: kBackgroundColorDark,
    error: Color(0xFFCF6679),
    onPrimary: Colors.black,
    onSecondary: Colors.white,
    onSurface: kTextColorDark,
    onBackground: kTextColorDark,
    onError: Colors.black,
    brightness: Brightness.dark,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.bold,
      color: kTextColorDark,
    ),
    displayMedium: TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      color: kTextColorDark,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0,
      color: kTextColorDark,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      color: kTextColorDark,
    ),
  ),
);
