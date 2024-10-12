import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t2_202210039/album_detil_screen.dart';
import 'package:t2_202210039/provider/setting_provider.dart';
import 'package:t2_202210039/setting_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    final albums = [
      AlbumModel(
        id: 1,
        name: 'Album 1',
        image: 'https://picsum.photos/id/1/200/200',
        songs: ['Song 1A', 'Song 2A', 'Song 3A'],
      ),
      AlbumModel(
        id: 2,
        name: 'Album 2',
        image: 'https://picsum.photos/id/2/200/200',
        songs: ['Song 1B', 'Song 2B', 'Song 3B'],
      ),
      AlbumModel(
        id: 3,
        name: 'Album 3',
        image: 'https://picsum.photos/id/3/200/200',
        songs: ['Song 1C', 'Song 2C', 'Song 3C'],
      ),
      AlbumModel(
        id: 4,
        name: 'Album 4',
        image: 'https://picsum.photos/id/4/200/200',
        songs: ['Song 1D', 'Song 2D', 'Song 3D'],
      ),
      AlbumModel(
        id: 5,
        name: 'Album 5',
        image: 'https://picsum.photos/id/5/200/200',
        songs: ['Song 1E', 'Song 2E', 'Song 3E'],
      ),
      AlbumModel(
        id: 6,
        name: 'Album 6',
        image: 'https://picsum.photos/id/6/200/200',
        songs: ['Song 1F', 'Song 2F', 'Song 3F'],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF004AAD), Color(0xFF000428)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        title: Text(
          'Good Morning',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: settingsProvider.isDarkMode
              ? const LinearGradient(
                  colors: [Color(0xFF000000), Color(0xFF121212)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              : const LinearGradient(
                  colors: [Colors.white, Colors.grey],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildScrollableSection(
                'Special Hits',
                albums,
                context,
                settingsProvider,
              ),
              _buildScrollableSection(
                'New Album',
                albums,
                context,
                settingsProvider,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScrollableSection(
    String title,
    List<AlbumModel> albums,
    BuildContext context,
    SettingsProvider settingsProvider,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'See all',
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: albums.length,
              itemBuilder: (context, index) {
                return _buildAlbumCard(
                    albums[index], context, settingsProvider);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAlbumCard(
    AlbumModel album,
    BuildContext context,
    SettingsProvider settingsProvider,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AlbumDetailScreen(
              albumName: album.name,
              albumImage: album.image,
              songs: album.songs,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: settingsProvider.isDarkMode ? Colors.grey[900] : Colors.white,
          boxShadow: [
            BoxShadow(
              color: settingsProvider.isDarkMode
                  ? Colors.black.withOpacity(0.5)
                  : Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                album.image,
                width: 140,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                album.name,
                style: GoogleFonts.poppins(
                  color:
                      settingsProvider.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AlbumModel {
  final int id;
  final String name;
  final String image;
  final List<String> songs;

  AlbumModel({
    required this.id,
    required this.name,
    required this.image,
    required this.songs,
  });
}
