import 'package:flutter/material.dart';

enum MoodEnum { happy, neutral, sad }

extension MoodProperties on MoodEnum {
  // Background color for the whole screen
  Color get backgroundColor {
    switch (this) {
      case MoodEnum.happy:
        return Colors.greenAccent;
      case MoodEnum.neutral:
        return Colors.orangeAccent;
      case MoodEnum.sad:
        return Colors.deepOrangeAccent.withOpacity(0.7);
    }
  }

  // Color used for face/mouth
  Color get faceColor {
    switch (this) {
      case MoodEnum.happy:
        return Colors.green;
      case MoodEnum.neutral:
        return Colors.orange;
      case MoodEnum.sad:
        return Colors.red;
    }
  }

  // Face size (you can tweak these)
  double get eyeWidth {
    switch (this) {
      case MoodEnum.happy:
        return 120;
      case MoodEnum.neutral:
        return 120;
      case MoodEnum.sad:
        return 60;
    }
  }

  double get eyeHeight {
    switch (this) {
      case MoodEnum.happy:
        return 120;
      case MoodEnum.neutral:
        return 60;
      case MoodEnum.sad:
        return 60;
    }
  }

  /// Numeric curvature factor for animation:
  /// +1 = smile, 0 = flat, -1 = sad
  double get factor {
    switch (this) {
      case MoodEnum.happy:
        return 1.0;
      case MoodEnum.neutral:
        return 0.0;
      case MoodEnum.sad:
        return -1.0;
    }
  }
}
