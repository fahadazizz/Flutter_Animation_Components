import 'package:flutter/material.dart';

class AbsorbContainer extends StatelessWidget {
  const AbsorbContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      height: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Colors.yellow,
            blurRadius: 6,
            spreadRadius: 2,
            blurStyle: BlurStyle.outer,
            offset: Offset(4, -5),
          ),
        ],
      ),
    );
  }
}
