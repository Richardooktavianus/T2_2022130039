import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t2_202210039/provider/setting_provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1DB954),
        title: Text(
          'Settings',
          style: TextStyle(
            color: settingsProvider.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: Container(
        color: settingsProvider.isDarkMode ? const Color(0xFF121212) : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SwitchListTile(
                title: Text(
                  'Dark Mode',
                  style: TextStyle(
                    color: settingsProvider.isDarkMode
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                value: settingsProvider.isDarkMode,
                onChanged: (value) {
                  settingsProvider.toggleDarkMode();
                },
                secondary: Icon(
                  settingsProvider.isDarkMode
                      ? Icons.dark_mode
                      : Icons.light_mode,
                  color:
                      settingsProvider.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                title: Text(
                  'About App',
                  style: TextStyle(
                    color: settingsProvider.isDarkMode
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
