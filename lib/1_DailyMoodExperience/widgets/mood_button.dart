import 'package:flutter/material.dart';

class MoodButton extends StatelessWidget {
  final String ktextButton;
  final Color kcolorButton;
  final VoidCallback? onTap;
  const MoodButton({
    required this.ktextButton,
    required this.kcolorButton,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        height: 90,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: kcolorButton,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(color: kcolorButton, spreadRadius: 0, blurRadius: 1),
          ],
        ),
        child: Text(ktextButton, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
