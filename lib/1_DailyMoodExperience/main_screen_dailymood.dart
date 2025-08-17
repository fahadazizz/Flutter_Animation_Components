import 'package:flutter/material.dart';
import 'package:flutter_animation_components/1_DailyMoodExperience/custom_shapes/mode_painter.dart';
import 'package:flutter_animation_components/1_DailyMoodExperience/enums/mode_enum.dart';
import 'package:flutter_animation_components/1_DailyMoodExperience/widgets/face_expression.dart';
import 'package:flutter_animation_components/1_DailyMoodExperience/widgets/mood_button.dart';

class MainScreenDailyMood extends StatefulWidget {
  MainScreenDailyMood({super.key});

  @override
  State<MainScreenDailyMood> createState() => _MainScreenDailyMoodState();
}

class _MainScreenDailyMoodState extends State<MainScreenDailyMood>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _curve;

  // Tweens
  late Tween<double> _factorTween;
  late Tween<double> _widthTween;
  late Tween<double> _heightTween;
  late ColorTween _bgTween;
  late ColorTween _faceColorTween;

  // Animations
  late Animation<double> _factorAnim;
  late Animation<double> _widthAnim;
  late Animation<double> _heightAnim;
  late Animation<Color?> _bgAnim;
  late Animation<Color?> _faceColorAnim;

  MoodEnum _currentMood = MoodEnum.happy;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _curve = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _setupTweens(from: _currentMood, to: _currentMood);
    _controller.value = 1.0;
  }

  void _setupTweens({required MoodEnum from, required MoodEnum to}) {
    _factorTween = Tween<double>(begin: from.factor, end: to.factor);
    _widthTween = Tween<double>(begin: from.eyeWidth, end: to.eyeWidth);
    _heightTween = Tween<double>(begin: from.eyeHeight, end: to.eyeHeight);
    _bgTween = ColorTween(begin: from.backgroundColor, end: to.backgroundColor);
    _faceColorTween = ColorTween(begin: from.faceColor, end: to.faceColor);

    _factorAnim = _factorTween.animate(_curve);
    _widthAnim = _widthTween.animate(_curve);
    _heightAnim = _heightTween.animate(_curve);
    _bgAnim = _bgTween.animate(_curve);
    _faceColorAnim = _faceColorTween.animate(_curve);
  }

  void _animateToMood(MoodEnum target) {
    final fromFactor = _factorAnim.value;
    final fromWidth = _widthAnim.value;
    final fromHeight = _heightAnim.value;
    final fromBg = _bgAnim.value ?? _currentMood.backgroundColor;
    final fromFace = _faceColorAnim.value ?? _currentMood.faceColor;

    _factorTween = Tween<double>(begin: fromFactor, end: target.factor);
    _widthTween = Tween<double>(begin: fromWidth, end: target.eyeWidth);
    _heightTween = Tween<double>(begin: fromHeight, end: target.eyeHeight);
    _bgTween = ColorTween(begin: fromBg, end: target.backgroundColor);
    _faceColorTween = ColorTween(begin: fromFace, end: target.faceColor);

    _factorAnim = _factorTween.animate(_curve);
    _widthAnim = _widthTween.animate(_curve);
    _heightAnim = _heightTween.animate(_curve);
    _bgAnim = _bgTween.animate(_curve);
    _faceColorAnim = _faceColorTween.animate(_curve);

    _currentMood = target;

    _controller
      ..stop()
      ..reset()
      ..forward();
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final bg = _bgAnim.value ?? _currentMood.backgroundColor;
        final faceColor = _faceColorAnim.value ?? _currentMood.faceColor;
        final w = _widthAnim.value;
        final h = _heightAnim.value;
        final curvature = _factorAnim.value;

        return Scaffold(
          backgroundColor: bg,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "How was your Day",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FaceExpression(
                  colorEye: faceColor,
                  width: w,
                  height: h,
                  painter: MoodPainter(faceColor, 14, curvature),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MoodButton(
                      ktextButton: "Great",
                      kcolorButton: Colors.green,
                      onTap: () => _animateToMood(MoodEnum.happy),
                    ),
                    MoodButton(
                      ktextButton: "Not Bad",
                      kcolorButton: Colors.orange,
                      onTap: () => _animateToMood(MoodEnum.neutral),
                    ),
                    MoodButton(
                      ktextButton: "Bad",
                      kcolorButton: Colors.red,
                      onTap: () => _animateToMood(MoodEnum.sad),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
