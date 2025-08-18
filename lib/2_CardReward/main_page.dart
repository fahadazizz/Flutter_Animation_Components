import 'package:flutter/material.dart';
import 'package:flutter_animation_components/2_CardReward/widget/absorb_container.dart';
import 'package:flutter_animation_components/2_CardReward/widget/arc_crousel.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 61, 46, 24),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 185,
                  height: 255,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: const Color.fromARGB(255, 61, 46, 24),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.yellow,
                        blurRadius: 6,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                ),
                ArcCarousel(
                  colors: [
                    Colors.amber,
                    Colors.redAccent,
                    Colors.greenAccent,
                    Colors.blueAccent,
                    Colors.greenAccent,
                  ],
                  length: 5,
                ),
                Positioned(
                  bottom: -1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            AbsorbContainer(),
          ],
        ),
      ),
    );
  }
}
