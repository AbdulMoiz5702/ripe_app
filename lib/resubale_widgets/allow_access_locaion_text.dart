import 'package:flutter/material.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

import 'Custom_Sized.dart';


class AllowAccessLocationText extends StatelessWidget {
  final String pointOne ;
  final String pointTwo ;
  final String pointThree ;
  final String pointFour ;
  final String  ? pointFive ;
  const AllowAccessLocationText({required this.pointOne,required this.pointTwo,required this.pointThree,required this.pointFour,this.pointFive});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
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
              child: Icon(Icons.brightness_1, size: 8, color: theme.primaryColor),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(pointOne,style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: theme.primaryColor,
                      fontFamily:'Nunito Sans',
                    ),),
                    Text(pointTwo,style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: theme.primaryColor,
                      fontFamily:'Nunito Sans',
                    ),),
                  ],
                ),
                CustomSized(
                  height: 0.01,
                ),
                Text(pointThree,style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: theme.primaryColor,
                  fontFamily:'Nunito Sans',
                ),),
                CustomSized(
                  height: 0.01,
                ),
                Text(pointFour,style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: theme.primaryColor,
                  fontFamily:'Nunito Sans',
                ),),
                CustomSized(
                  height: 0.01,
                ),
                pointFive == null ? Container(height: 0,width: 0,) :Text(pointFive.toString(),style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: theme.primaryColor,
                  fontFamily:'Nunito Sans',
                ),),
              ],
            )
          ],
        )
      ],
    );
  }
}
