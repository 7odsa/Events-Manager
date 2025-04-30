import 'package:events_manager/screens/login_screen.dart';
import 'package:flutter/material.dart';

final seedColor = Color(0xff485EF7);
final colorScheme = ColorScheme.fromSeed(
  seedColor: seedColor,
  secondary: Color(0xffd4e4ed),
);

final lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: colorScheme,
  useMaterial3: true,
  scaffoldBackgroundColor: colorScheme.secondary,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(seedColor)),
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
