import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t2_202210039/provider/setting_provider.dart';
import 'package:t2_202210039/provider/user_provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final profileProvider = Provider.of<UserProvider>(context, listen: false);
    _nameController.text = profileProvider.name;
    _emailController.text = profileProvider.email;
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<UserProvider>(context);
    final settingsProvider = Provider.of<SettingsProvider>(context);

    Color textColor = settingsProvider.isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(color: textColor),
        ),
      ),
      backgroundColor:
          settingsProvider.isDarkMode ? Colors.black : Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                final pickedFile = await ImagePicker().pickImage(
                  source: ImageSource.gallery,
                );
                if (pickedFile != null) {
                  profileProvider.pickProfileImage(File(pickedFile.path));
                }
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
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: textColor),
              ),
              style: TextStyle(color: textColor),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: textColor),
              ),
              style: TextStyle(color: textColor),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                profileProvider.updateName(_nameController.text);
                profileProvider.updateEmail(_emailController.text);
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

