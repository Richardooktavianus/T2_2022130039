import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t2_202210039/provider/setting_provider.dart';
import 'package:t2_202210039/setting_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1DB954),
        title: Text(
          'Spotify Clone',
          style: TextStyle(
            color: settingsProvider.isDarkMode ? Colors.white : Colors.black,
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
                  builder: (context) => SettingScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: settingsProvider.isDarkMode ? Colors.grey[900] : Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Good Morning',
                  style: TextStyle(
                    color: settingsProvider.isDarkMode
                        ? Colors.white
                        : Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                padding: const EdgeInsets.all(16.0),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Aksi saat album/playlist diklik
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: settingsProvider.isDarkMode
                            ? Colors.grey[850]
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                'https://via.placeholder.com/150',
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Album Name',
                              style: TextStyle(
                                color: settingsProvider.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
