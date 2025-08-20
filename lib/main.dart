import 'package:flutter/material.dart';
import 'package:flutter_animation_components/3_SpotifyArtist/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      themeMode: ThemeMode.dark,
      // home: MainScreenDailyMood(),
      // home: MainPageDailyReward(),
      home: MainPage(),
    );
  }
}
