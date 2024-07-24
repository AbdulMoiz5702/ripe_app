import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class CustomSized extends StatelessWidget {
  final double width ;
  final double height ;
  final Widget ? child ;
  const CustomSized({super.key, this.height = 0.05,this.width = 0.1,this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * height,
      width:MediaQuery.sizeOf(context).width * width,
      child: child,
    );
  }
}
