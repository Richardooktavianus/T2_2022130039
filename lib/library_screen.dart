import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t2_202210039/provider/library_provider.dart';
import 'package:t2_202210039/provider/setting_provider.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final libraryProvider = Provider.of<LibraryProvider>(context);
    final settingsProvider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      backgroundColor:
          settingsProvider.isDarkMode ? const Color(0xFF121212) : Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1DB954),
        title: Text(
          'Your Library',
          style: TextStyle(
              color: settingsProvider.isDarkMode ? Colors.white : Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Playlists',
              style: TextStyle(
                color:
                    settingsProvider.isDarkMode ? Colors.white : Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.playlist_play,
                  color: settingsProvider.isDarkMode
                      ? Colors.white
                      : Colors.black),
              title: Text(
                'My Playlist 1',
                style: TextStyle(
                    color: settingsProvider.isDarkMode
                        ? Colors.white
                        : Colors.black),
              ),
            ),
            ListTile(
              leading: Icon(Icons.playlist_play,
                  color: settingsProvider.isDarkMode
                      ? Colors.white
                      : Colors.black),
              title: Text(
                'My Playlist 2',
                style: TextStyle(
                    color: settingsProvider.isDarkMode
                        ? Colors.white
                        : Colors.black),
              ),
            ),
            ListTile(
              leading: Icon(Icons.playlist_play,
                  color: settingsProvider.isDarkMode
                      ? Colors.white
                      : Colors.black),
              title: Text(
                'My Playlist 3',
                style: TextStyle(
                    color: settingsProvider.isDarkMode
                        ? Colors.white
                        : Colors.black),
              ),
              onTap: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}
