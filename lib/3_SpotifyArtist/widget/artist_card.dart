import 'package:flutter/material.dart';

class ArtistCard extends StatelessWidget {
  final bool isActive;
  final double dragOffset;
  final double cardWidth;
  final double cardHeight;
  final Color color;
  final Function(double dy) onDragUpdate;
  // final double dragThreshold;

  const ArtistCard({
    Key? key,
    required this.isActive,
    required this.dragOffset,
    required this.cardWidth,
    required this.cardHeight,
    required this.color,
    required this.onDragUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.delta.dy > 0) {
          // isActive &&
          onDragUpdate(details.delta.dy);
        }
      },
      onVerticalDragEnd: (details) {
        if (isActive) {}
      },
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..translate(0.0, isActive ? dragOffset : 0.0),
        child: Container(
          width: cardWidth,
          height: cardHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: color,
          ),
        ),
      ),
    );
  }
}
