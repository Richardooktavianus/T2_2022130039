import 'package:flutter/material.dart';

class SpotifyTheme {
  static const Color spotifyGreen = Color(0xFF1DB954);
  static const Color darkBackground = Color(0xFF191414);

  static ThemeData get themeData {
    return ThemeData(
      primaryColor: spotifyGreen,
      scaffoldBackgroundColor: darkBackground,
      appBarTheme: const AppBarTheme(
        backgroundColor: darkBackground,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: darkBackground,
        selectedItemColor: spotifyGreen,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}