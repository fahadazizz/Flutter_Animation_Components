import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animation_components/3_SpotifyArtist/widget/artist_card.dart';

class ArtistCardTransform extends StatelessWidget {
  final int index;
  final double d;
  final double radius;
  final bool isActive;
  final double dragOffset;
  final double cardWidth;
  final double cardHeight;
  final Color color;
  final Function(double dy) onDragUpdate;

  const ArtistCardTransform({
    Key? key,
    required this.index,
    required this.d,
    required this.radius,
    required this.isActive,
    required this.dragOffset,
    required this.cardWidth,
    required this.cardHeight,
    required this.color,
    required this.onDragUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final angle = d * 0.34;
    final double x = sin(angle) * radius * 3;
    final double y = -(1 - cos(angle)) * radius * 3;
    final double zRotation = -d * 0.15 * 1.6;

    return Transform(
      transform: Matrix4.identity()
        ..translate(x, y)
        ..rotateZ(zRotation),
      alignment: Alignment.center,
      child: ArtistCard(
        isActive: isActive,
        dragOffset: dragOffset,
        cardWidth: cardWidth,
        cardHeight: cardHeight,
        color: color,
        onDragUpdate: onDragUpdate,
      ),
    );
  }
}
