import 'package:flutter/material.dart';
import 'package:flutter_animation_components/1_DailyMoodExperience/custom_shapes/mode_painter.dart';

class FaceExpression extends StatelessWidget {
  final Color colorEye;
  final double width;
  final double height;
  final MoodPainter painter;

  const FaceExpression({
    required this.colorEye,
    required this.width,
    required this.height,
    required this.painter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 25,
          children: [
            EyeContainer(colorEye: colorEye, width: width, height: height),
            EyeContainer(colorEye: colorEye, width: width, height: height),
          ],
        ),

        CustomPaint(size: Size(33 * 2, 40), painter: painter),
      ],
    );
  }
}

class EyeContainer extends StatelessWidget {
  final Color colorEye;
  final double width;
  final double height;

  const EyeContainer({
    required this.colorEye,
    required this.width,
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: colorEye,
        borderRadius: BorderRadius.all(Radius.circular(width / 2)),
      ),
    );
  }
}
