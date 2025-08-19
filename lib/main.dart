import 'package:flutter/material.dart';

import '2_CardReward/main_page_daily_reward.dart';

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
      home: MainPageDailyReward(),
    );
  }
}
