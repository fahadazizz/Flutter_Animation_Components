import 'package:flutter/material.dart';
import 'package:flutter_animation_components/2_CardReward/main_page_daily_reward.dart';

class ShowSelectedCard extends StatefulWidget {
  final Color color;
  const ShowSelectedCard({required this.color, super.key});

  @override
  State<ShowSelectedCard> createState() => _ShowSelectedCardState();
}

class _ShowSelectedCardState extends State<ShowSelectedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _translateAnimation;
  late Animation<double> _widthAnimation;
  late Animation<double> _heightAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _translateAnimation = Tween<double>(begin: 200, end: 0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _widthAnimation = Tween<double>(begin: 150, end: 300).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _heightAnimation = Tween<double>(begin: 230, end: 430).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 61, 46, 24),
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform(
                    transform: Matrix4.identity()
                      ..translate(0.0, _translateAnimation.value),
                    child: Container(
                      width: _widthAnimation.value,
                      height: _heightAnimation.value,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: widget.color,
                      ),
                    ),
                  );
                },
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MainPageDailyReward();
                      },
                    ),
                    (route) => false,
                  );
                },
                child: Container(
                  width: 180,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: const Color.fromARGB(255, 61, 46, 24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.amber,
                        spreadRadius: 1,
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Text(
                    "Continue",
                    style: TextStyle(color: Colors.amber, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
