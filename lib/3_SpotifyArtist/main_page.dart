import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animation_components/3_SpotifyArtist/widget/artist_card_crousel.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff151515),
      body: Center(
        child: Stack(
          // alignment: Alignment.center,
          children: [
            Transform.rotate(
              angle: -1.6,
              child: ArtistCardCrousel(
                colors: [
                  Colors.amber,
                  Colors.redAccent,
                  Colors.blueAccent,
                  Colors.greenAccent,
                  Colors.orangeAccent,
                  Colors.purpleAccent,
                  Colors.blueGrey,
                ],
                length: 7,
              ),
            ),
            Container(
              width: 400,
              height: 400,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.4),
                        Colors.black.withOpacity(0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
