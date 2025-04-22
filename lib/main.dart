import 'package:flutter/material.dart';
import 'package:top_jobs/view/screens/on_boarding_screens/screens/logo_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogoScreen());
  }
}
