import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:t2_202210039/provider/setting_provider.dart';

class AlbumDetailScreen extends StatelessWidget {
  final String albumName;
  final String albumImage;
  final List<String> songs; // List of songs for the album

  const AlbumDetailScreen({
    super.key,
    required this.albumName,
    required this.albumImage,
    required this.songs, // Accept songs in the constructor
  });

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1DB954),
        title: Text(
          albumName,
          style: GoogleFonts.poppins(
            color: settingsProvider.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: Container(
        color: settingsProvider.isDarkMode ? Colors.grey[900] : Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                albumImage,
                height: 300,
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              albumName,
              style: GoogleFonts.poppins(
                color:
                    settingsProvider.isDarkMode ? Colors.white : Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _playAlbum(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1DB954),
              ),
              child: const Text('Play Album'),
            ),
            const SizedBox(height: 20),
            Text(
              'Songs:',
              style: TextStyle(
                color:
                    settingsProvider.isDarkMode ? Colors.white : Colors.black,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      '${index + 1}. ${songs[index]}',
                      style: GoogleFonts.poppins(
                        color: settingsProvider.isDarkMode
                            ? Colors.white
                            : Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Simulate album playback
  void _playAlbum(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Now playing "$albumName"'),
        backgroundColor: const Color(0xFF1DB954),
      ),
    );
    // You can add navigation to a new screen here to simulate the player.
    // Navigator.push(context, MaterialPageRoute(builder: (context) => PlayerScreen(albumName: albumName, songs: songs)));
  }
}
