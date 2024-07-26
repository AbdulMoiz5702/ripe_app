import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';

class CircleAvatarWidget extends StatelessWidget {
  final double heights;
  final double widths;
  final Color colors;
  final Widget child;
  const CircleAvatarWidget({super.key,  this.heights = 0.05,  this.widths = 0.1, this.colors = primaryTextColor, required this.child });
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor:  colors,
      maxRadius: heights,
      child: Container(
        // height: MediaQuery.of(context).size.height*heights,
        // width: MediaQuery.of(context).size.width*widths,

        child: child,
      ),
    );
  }
}
