import 'dart:math';

import 'package:flutter/material.dart';

class RowContainer extends StatefulWidget {
  final int currentIndex;
  final int orignalIndex;

  const RowContainer({required this.currentIndex, required this.orignalIndex});

  @override
  State<RowContainer> createState() => _RowContainerState();
}

class _RowContainerState extends State<RowContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _translateAnim;
  late Animation<double> _rotateAnim;

  double _dragOffset = 0.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _setupAnimations();
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant RowContainer oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.currentIndex != widget.currentIndex) {
      _setupAnimations();
      _controller
        ..reset()
        ..forward();
    }
  }

  void _setupAnimations() {
    bool isActive = widget.currentIndex == widget.orignalIndex;

    // Translate Y
    double beginTranslate = isActive ? -50 : 0;
    double endTranslate = isActive ? 0 : -50;

    _translateAnim = Tween<double>(
      begin: beginTranslate,
      end: endTranslate,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Rotate
    double beginRotate = isActive
        ? (widget.currentIndex > widget.orignalIndex
              ? 0 * pi / 180
              : -0 * pi / 180)
        : 0;
    double endRotate = isActive
        ? 0
        : (widget.currentIndex > widget.orignalIndex
              ? 20 * pi / 180
              : -20 * pi / 180);

    _rotateAnim = Tween<double>(
      begin: beginRotate,
      end: endRotate,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isActive = widget.currentIndex == widget.orignalIndex;

    return GestureDetector(
      onLongPress: () {
        if (isActive) {
          setState(() {});
        }
      },
      onVerticalDragUpdate: (details) {
        if (isActive) {
          setState(() {
            _dragOffset += details.delta.dy;
            if (_dragOffset < 0) _dragOffset = 0;
          });
        }
      },
      onVerticalDragEnd: (details) {
        if (isActive) {
          final releasedOffset = _dragOffset;
          AnimationController tempController = AnimationController(
            vsync: this,
            duration: const Duration(milliseconds: 300),
          );

          Animation<double> backAnim =
              Tween<double>(begin: releasedOffset, end: 0).animate(
                CurvedAnimation(parent: tempController, curve: Curves.easeOut),
              );

          backAnim.addListener(() {
            setState(() {
              _dragOffset = backAnim.value;
            });
          });

          tempController.forward().then((_) => tempController.dispose());
        }
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..translate(0.0, _translateAnim.value + _dragOffset)
              ..rotateZ(_rotateAnim.value),
            child: Container(
              width: 180,
              height: 240,
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 75),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.white,
                boxShadow: isActive
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ]
                    : null,
              ),
            ),
          );
        },
      ),
    );
  }
}
