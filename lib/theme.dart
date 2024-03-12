import 'package:flutter/material.dart';

class AppColors {
  static const Color bg = Color(0xFFFCFCFC),
      txt = Color(0xFF44424C),
      primaryCol = Color(0xFF2A77B6),
      primaryCol2 = Color.fromARGB(255, 12, 36, 55),
      primaryColCont = Color.fromARGB(255, 253, 236, 238),
      highlightCol = Color(0xFFFD5450),
      boxCol = Color(0xFFF9F9F9);
}

ThemeData lightTheme = ThemeData.from(
  colorScheme: const ColorScheme.light(primary: AppColors.primaryCol),
  useMaterial3: true,
  textTheme:
      const TextTheme(displayLarge: TextStyle(fontWeight: FontWeight.bold)),
);
ThemeData darkTheme = ThemeData.from(
  colorScheme: const ColorScheme.dark(primary: AppColors.primaryCol),
  useMaterial3: true,
  textTheme:
      const TextTheme(displayLarge: TextStyle(fontWeight: FontWeight.bold)),
);
