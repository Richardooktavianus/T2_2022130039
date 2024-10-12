import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t2_202210039/edit_screen.dart';
import 'package:t2_202210039/provider/setting_provider.dart';
import 'package:t2_202210039/provider/user_provider.dart';
import 'package:t2_202210039/setting_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final settingsProvider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      backgroundColor:
          settingsProvider.isDarkMode ? const Color(0xFF121212) : Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1DB954),
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: userProvider.profileImage != null
                      ? FileImage(userProvider.profileImage!)
                      : const NetworkImage('https://i.pravatar.cc/300'),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userProvider.name,
                      style: TextStyle(
                          color: settingsProvider.isDarkMode
                              ? Colors.white
                              : Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      userProvider.email,
                      style: TextStyle(
                          color: settingsProvider.isDarkMode
                              ? Colors.grey
                              : Colors.black54,
                          fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            Divider(
                color:
                    settingsProvider.isDarkMode ? Colors.grey : Colors.black12),
            const SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.account_circle,
                  color: settingsProvider.isDarkMode
                      ? Colors.white
                      : Colors.black),
              title: Text('Edit Profile',
                  style: TextStyle(
                      color: settingsProvider.isDarkMode
                          ? Colors.white
                          : Colors.black)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditProfileScreen(),
                  ),
                ).then((_) {
                  userProvider.loadProfile();
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.settings,
                  color: settingsProvider.isDarkMode
                      ? Colors.white
                      : Colors.black),
              title: Text('Settings',
                  style: TextStyle(
                      color: settingsProvider.isDarkMode
                          ? Colors.white
                          : Colors.black)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>const SettingScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout,
                  color: settingsProvider.isDarkMode
                      ? Colors.redAccent
                      : Colors.black),
              title: Text('Log Out',
                  style: TextStyle(
                      color: settingsProvider.isDarkMode
                          ? Colors.redAccent
                          : Colors.black)),
              onTap: () {
                // Aksi untuk logout
              },
            ),
          ],
        ),
      ),
    );
  }
}
