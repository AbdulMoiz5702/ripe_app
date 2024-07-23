import 'package:flutter/material.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';


class AllowAccessLocationText extends StatelessWidget {
  final String pointOne ;
  final String pointTwo ;
  final String pointThree ;
  final String pointFour ;
  final String  ? pointFive ;
  const AllowAccessLocationText({required this.pointOne,required this.pointTwo,required this.pointThree,required this.pointFour,this.pointFive});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.brightness_1, size: 8, color: Colors.black),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(pointOne,style: TextStyles.bulletPointBold,),
                    Text(pointTwo,style: TextStyles.bulletPoint,),
                  ],
                ),
                Text(pointThree,style: TextStyles.bulletPoint,),
                Text(pointFour,style: TextStyles.bulletPoint,),
                pointFive == null ?Container(height: 0,width: 0,) :Text(pointFive.toString(),style: TextStyles.bulletPoint,),
              ],
            )
          ],
        )
      ],
    );
  }
}
