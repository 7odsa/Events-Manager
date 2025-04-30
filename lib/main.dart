import 'package:events_manager/screens/login_screen.dart';
import 'package:events_manager/utils.dart';
import 'package:flutter/material.dart';

final colorScheme = ColorScheme.fromSeed(
  seedColor: seedColor,
  secondary: Color(0xffF2FEFF),
);

final lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: colorScheme,
  useMaterial3: true,
  scaffoldBackgroundColor: colorScheme.secondary,
  appBarTheme: AppBarTheme(backgroundColor: colorScheme.secondary),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: seedColor,
    ),
  ),
);
final darkTheme = lightTheme.copyWith(brightness: Brightness.dark);

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: LoginScreen(),
    );
  }
}
