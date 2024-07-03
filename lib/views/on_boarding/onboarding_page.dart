import 'package:flutter/material.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';


class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String title2;
  final String description;
  final String description2;

  OnboardingPage({
    required this.imagePath,
    required this.title,
    required this.title2,
    required this.description,
    required this.description2
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            height: 330.0,
            width: 450.0,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(imagePath),fit: BoxFit.cover),
            ),
          ),
          largeText(title: title,color: Colors.black),
          CustomSized(height: 0.003,),
          largeText(title: title2,color: Colors.black),
          CustomSized(height: 0.01,),
          smallText(title: description,color: Colors.grey,weight:FontWeight.w500 ),
          CustomSized(height: 0.003,),
          smallText(title: description2,color: Colors.grey,weight:FontWeight.w500 ),
        ],
      ),
    );
  }
}
