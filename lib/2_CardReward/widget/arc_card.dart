import 'package:flutter/material.dart';

class ArcCard extends StatelessWidget {
  final bool isActive;
  final double dragOffset;
  final double cardWidth;
  final double cardHeight;
  final Color color;
  final Function(double dy) onDragUpdate;

  const ArcCard({
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
        if (isActive && details.delta.dy > 0) {
          onDragUpdate(details.delta.dy);
        }
      },
      onVerticalDragEnd: (details) {},
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
