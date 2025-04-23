import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:top_jobs/view/screens/on_boarding_screens/screens/logo_screen.dart';
import 'package:top_jobs/view/screens/search_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData.light(),
      dark: ThemeData.dark(),
      initial: AdaptiveThemeMode.system,
      
      builder: (context, ctx) {
        
        return MaterialApp(
        theme: ctx,  
          debugShowCheckedModeBanner: false, home: SearchScreen());
      }
    );
  }
}
