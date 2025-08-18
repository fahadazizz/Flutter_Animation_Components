import 'package:flutter/material.dart';
import 'package:flutter_animation_components/2_CardReward/widget/card_transform.dart';

class ArcCarousel extends StatefulWidget {
  final List<Color> colors;
  final int length;
  final double radius;

  const ArcCarousel({
    Key? key,
    required this.colors,
    required this.length,
    double? radius,
  }) : radius = radius ?? (180 * 1.1),
       super(key: key);

  @override
  State<ArcCarousel> createState() => _ArcCarouselState();
}

class _ArcCarouselState extends State<ArcCarousel>
    with SingleTickerProviderStateMixin {
  double pageOffset = 0.0;
  late AnimationController _controller;
  late Animation<double> _animation;

  final double cardWidth = 180;
  final double cardHeight = 250;

  double _dragOffset = 0.0;
  late int currentIndex;

  @override
  void initState() {
    currentIndex = (widget.length / 2).toInt();
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
  }

  void _onDragUpdate(DragUpdateDetails details) {
    setState(() {
      pageOffset -= details.primaryDelta! / cardWidth;
    });
  }

  void _onDragEnd(DragEndDetails details) {
    final velocity = details.primaryVelocity ?? 0;
    double target = (currentIndex + pageOffset).roundToDouble();

    if (velocity.abs() > 800) {
      target += velocity < 0 ? 1 : -1;
    }

    target = target.clamp(0, widget.colors.length - 1).toDouble();

    _animation =
        Tween<double>(begin: pageOffset, end: target - currentIndex).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
        )..addListener(() {
          setState(() {
            pageOffset = _animation.value;
          });
        });

    _controller.forward(from: 0).whenComplete(() {
      setState(() {
        currentIndex = target.toInt();
        pageOffset = 0.0;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final itemCount = widget.colors.length;

    return SizedBox(
      height: cardHeight + 150,
      child: GestureDetector(
        onHorizontalDragUpdate: _onDragUpdate,
        onHorizontalDragEnd: _onDragEnd,
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: List.generate(itemCount, (index) {
              final d = index - currentIndex - pageOffset;

              return CardTransform(
                index: index,
                d: d,
                radius: widget.radius,
                isActive: index == currentIndex,
                dragOffset: _dragOffset,
                cardWidth: cardWidth,
                cardHeight: cardHeight,
                color: widget.colors[index],
                onDragUpdate: (dy) {
                  setState(() {
                    _dragOffset += dy;
                  });
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}
