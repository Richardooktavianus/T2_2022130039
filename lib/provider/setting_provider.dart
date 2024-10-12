import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  bool _isDarkMode = false; // Default dark mode status (false = light mode)

  // Getter untuk mengambil status dark mode
  bool get isDarkMode => _isDarkMode;

  // Method untuk mengganti status dark mode
  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode; // Mengganti status dark mode (true/false)
    notifyListeners(); // Notifikasi ke widget yang mendengarkan perubahan
  }

  // Method untuk mengatur dark mode secara langsung
  void setDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}
