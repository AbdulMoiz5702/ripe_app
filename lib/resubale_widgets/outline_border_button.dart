import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

import 'Custom_Sized.dart';


class OutlineBorderButton extends StatelessWidget {
  final String title ;
  final VoidCallback onTap ;
  const OutlineBorderButton({required this.title,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: EdgeInsets.all(14),
        height: MediaQuery.sizeOf(context).height * 0.2,
        width: MediaQuery.sizeOf(context).width * 1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: containerBorderColor,width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSized(
            height: 0.01,
          ),
            largeText(title: 'Become a driver', textSize: 18.0,),
            CustomSized(
              height: 0.01,
            ),
            smallText(title: 'Become a driver and offer your services.', textSize: 11.0,),
            CustomSized(
              height:  0.03,
            ),
            Container(
              alignment: Alignment.center,
              height: MediaQuery.sizeOf(context).height * 0.06,
              width: MediaQuery.sizeOf(context).width * 1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: textfieldColor,width: 2),
              ),
              child: smallText(title: title,textSize: 14.0,weight:FontWeight.w700,color: checkBoxColor),
            ),
          ],
        ),
      ),
    );
  }
}

class InviteFriendColorButton extends StatelessWidget {
  final String title ;
  final VoidCallback onTap ;
  const InviteFriendColorButton({required this.title,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: EdgeInsets.all(14),
        height: MediaQuery.sizeOf(context).height * 0.2,
        width: MediaQuery.sizeOf(context).width * 1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: otpColor,width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSized(
              height: 0.01,
            ),
            largeText(title: 'Invite your friends', textSize: 18.0,),
            CustomSized(
              height: 0.01,
            ),
            smallText(title: 'Invite your friends to our app.', textSize: 11.0,),
            CustomSized(
              height:  0.03,
            ),
            Container(
              alignment: Alignment.center,
              height: MediaQuery.sizeOf(context).height * 0.06,
              width: MediaQuery.sizeOf(context).width * 1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: textfieldColor,width: 2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.share_outlined,color: checkBoxColor,size: 30,),
                  smallText(title: '  ${title}',textSize: 14.0,weight:FontWeight.w700,color: checkBoxColor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
