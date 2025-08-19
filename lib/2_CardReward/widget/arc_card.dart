import 'package:flutter/material.dart';
import 'package:flutter_animation_components/2_CardReward/show_selected_card.dart';

class ArcCard extends StatelessWidget {
  final bool isActive;
  final double dragOffset;
  final double cardWidth;
  final double cardHeight;
  final Color color;
  final Function(double dy) onDragUpdate;
  final double dragThreshold;

  const ArcCard({
    Key? key,
    required this.isActive,
    required this.dragOffset,
    required this.cardWidth,
    required this.cardHeight,
    required this.color,
    required this.onDragUpdate,
    this.dragThreshold = 100.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (isActive && details.delta.dy > 0) {
          onDragUpdate(details.delta.dy);
        }
      },
      onVerticalDragEnd: (details) {
        if (isActive) {
          if (dragOffset > dragThreshold) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShowSelectedCard(color: color),
              ),
            );
          }
        }
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
