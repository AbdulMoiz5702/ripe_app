import 'package:flutter/material.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';


class SignupStepsCount extends StatelessWidget {
  final String title ;
  const SignupStepsCount({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      height: 40,
      width: MediaQuery.sizeOf(context).width * 0.13,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          smallText(title: title,color: Colors.black,textSize: 14.0,weight: FontWeight.w500),
          smallText(title: '/5',color: Colors.black54,textSize: 13.0,weight: FontWeight.w500),
        ],
      ),
    );
  }
}
