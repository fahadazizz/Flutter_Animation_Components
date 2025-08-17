// import 'package:flutter/material.dart';
// import 'package:flutter_animation_components/1_Shoping_Experience/model/mode_enum.dart';

// class MoodPainter extends CustomPainter {
//   final Color color;
//   final double strokeWidth;
//   final MoodEnum moodEnum;

//   MoodPainter(this.color, this.strokeWidth, this.moodEnum);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = color
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap
//           .round // rounded ends
//       ..strokeWidth = strokeWidth;

//     final path = Path();

//     switch (moodEnum) {
//       case MoodEnum.happy:
//         path.moveTo(0, size.height * 0.5);
//         path.quadraticBezierTo(
//           size.width / 2,
//           size.height * 1.2,
//           size.width,
//           size.height * 0.5,
//         );
//         canvas.drawPath(path, paint);
//         break;

//       case MoodEnum.sad:
//         path.moveTo(0, size.height * 0.5);
//         path.quadraticBezierTo(
//           size.width / 2,
//           size.height * -0.2,
//           size.width,
//           size.height * 0.5,
//         );
//         canvas.drawPath(path, paint);
//         break;

//       case MoodEnum.neutral:
//         canvas.drawLine(
//           Offset(0, size.height / 2),
//           Offset(size.width, size.height / 2),
//           paint,
//         );
//         break;
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }

import 'package:flutter/material.dart';
import '../enums/mode_enum.dart';

class MoodPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double curvature;

  MoodPainter(this.color, this.strokeWidth, this.curvature);

  MoodPainter.fromMood(this.color, this.strokeWidth, MoodEnum mood)
    : curvature = mood.factor;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    final midY = size.height * 0.5;
    final amplitude = size.height * 0.6;

    final controlY = midY + curvature.clamp(-1.0, 1.0) * amplitude;

    final path = Path()
      ..moveTo(0, midY)
      ..quadraticBezierTo(size.width / 2, controlY, size.width, midY);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant MoodPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.curvature != curvature;
  }
}
