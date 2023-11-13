import 'package:flutter/material.dart';

final dark_theme = ThemeData(
  scaffoldBackgroundColor: const Color(0xFF252525),
  colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 218, 216, 207),
      primary: const Color(0xFFF4D144)),
  secondaryHeaderColor: Color.fromARGB(255, 24, 24, 24),
  useMaterial3: true,
);
