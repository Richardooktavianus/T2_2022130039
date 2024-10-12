import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t2_202210039/provider/setting_provider.dart';
import 'package:t2_202210039/provider/user_provider.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<UserProvider>(context);
    final settingsProvider = Provider.of<SettingsProvider>(context);

    Color textColor = settingsProvider.isDarkMode ? Colors.white : Colors.black;
    Color backgroundColor =
        settingsProvider.isDarkMode ? Colors.black : Colors.white;
    Color buttonColor =
        settingsProvider.isDarkMode ? Colors.white : Colors.blue;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(color: textColor),
        ),
        backgroundColor: backgroundColor = const Color(0xFF1DB954),
      ),
      backgroundColor:
          settingsProvider.isDarkMode ? Colors.black : Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                // Logic to pick and update profile image
                profileProvider.pickProfileImage();
              },
              child: CircleAvatar(
                radius: 50,
                backgroundImage: profileProvider.profileImage != null
                    ? FileImage(profileProvider.profileImage!)
                    : const AssetImage('assets/images/default_avatar.png')
                        as ImageProvider,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              initialValue: profileProvider.name,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: textColor),
              ),
              style: TextStyle(color: textColor),
              onChanged: (value) => profileProvider.updateName(value),
            ),
            const SizedBox(height: 20),
            TextFormField(
              initialValue: profileProvider.email,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: textColor),
              ),
              style: TextStyle(color: textColor),
              onChanged: (value) => profileProvider.updateEmail(value),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                profileProvider.saveProfile();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(
                    'Profile Updated!',
                    style: TextStyle(color: textColor),
                  )),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: backgroundColor = const Color(0xFF1DB954),
                  foregroundColor: settingsProvider.isDarkMode
                      ? Colors.white
                      : Colors.black),
              child: const Text(
                'Save',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
