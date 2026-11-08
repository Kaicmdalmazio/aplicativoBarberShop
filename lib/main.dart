
import 'package:flutter/material.dart';
import 'view/login_screen.dart';

void main() {
  runApp(const BarbeariaApp());
}

class BarbeariaApp extends StatelessWidget {
  const BarbeariaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barber Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD9AB62),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF171717),
      ),
      home: const LoginScreen(),
    );
  }
}
