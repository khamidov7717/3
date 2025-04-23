import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:top_jobs/view/screens/search_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Switch(
          value:
              AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                  ? false
                  : true,
          onChanged: (value) {
            if (AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light) {
              AdaptiveTheme.of(context).setDark();
            } else {
              AdaptiveTheme.of(context).setLight();
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          if (value == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (ctx) => SearchScreen()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setings"),
        ],
      ),
    );
  }
}
