import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class UserProvider with ChangeNotifier {
  String _name = 'John Doe';
  String _email = 'johndoe@example.com';
  File? _profileImage;

  String get name => _name;
  String get email => _email;
  File? get profileImage => _profileImage;

  get username => null;

  void updateName(String newName) {
    _name = newName;
    notifyListeners();
  }

  void updateEmail(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }

  Future<void> pickProfileImage(File file) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _profileImage = File(pickedFile.path);
      notifyListeners();
    }
  }

  void saveProfile() {
    // Save profile to a backend or local storage
    notifyListeners();
  }

  void loadProfile() {}
}
