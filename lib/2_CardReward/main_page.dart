import 'package:flutter/material.dart';
import 'package:flutter_animation_components/2_CardReward/widget/absorb_container.dart';
import 'package:flutter_animation_components/2_CardReward/widget/row_container.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _controller = PageController(viewportFraction: 0.58);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff533C1F),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 200,
                  height: 260,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: const Color(0xff533C1F),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.yellow,
                        blurRadius: 12,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 400,
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: 8,

                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return RowContainer(
                        currentIndex: _currentPage,
                        orignalIndex: index,
                      );
                    },
                  ),
                ),
              ],
            ),
            AbsorbContainer(),
          ],
        ),
      ),
    );
  }
}
