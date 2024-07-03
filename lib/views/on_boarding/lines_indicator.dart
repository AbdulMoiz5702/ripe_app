import 'package:flutter/material.dart';

class LineIndicator extends StatelessWidget {
  final int itemCount;
  final int currentIndex;

  LineIndicator({
    required this.itemCount,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          height: 3,
          width: MediaQuery.sizeOf(context).width * 0.18,
          color: currentIndex == index ? Colors.black : Colors.grey,
        );
      }),
    );
  }
}
