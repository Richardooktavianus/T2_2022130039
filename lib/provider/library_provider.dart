import 'package:flutter/material.dart';

class LibraryProvider with ChangeNotifier {
  final List<String> _songs = ["Song 1", "Song 2", "Song 3"];

  List<String> get songs => _songs;

  void addSong(String song) {
    _songs.add(song);
    notifyListeners();
  }
}
