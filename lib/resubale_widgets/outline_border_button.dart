import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

import 'Custom_Sized.dart';


class OutlineBorderButton extends StatelessWidget {
  final String title ;
  final VoidCallback onTap ;
  const OutlineBorderButton({super.key, required this.title,required this.onTap});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.all(14),
        height: MediaQuery.sizeOf(context).height * 0.21,
        width: MediaQuery.sizeOf(context).width * 1,
        decoration: BoxDecoration(
          color: theme.colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: theme.colorScheme.surfaceDim,width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSized(
            height: 0.01,
          ),
            largeText(title: 'Become a driver', textSize: 18.0,color: theme.colorScheme.primary),
            const CustomSized(
              height: 0.01,
            ),
            smallText(title: 'Become a driver and offer your services.', textSize: 11.0,color: theme.colorScheme.primary),
            const CustomSized(
              height:  0.03,
            ),
            Container(
              alignment: Alignment.center,
              height: MediaQuery.sizeOf(context).height * 0.06,
              width: MediaQuery.sizeOf(context).width * 1,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: theme.colorScheme.surfaceContainerHigh,width: 2),
              ),
              child: smallText(title: title,textSize: 14.0,weight:FontWeight.w700,color: theme.colorScheme.surfaceTint),
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
  const InviteFriendColorButton({super.key, required this.title,required this.onTap});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.all(14),
        height: MediaQuery.sizeOf(context).height * 0.21,
        width: MediaQuery.sizeOf(context).width * 1,
        decoration: BoxDecoration(
           color:  theme.colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: theme.colorScheme.surfaceContainerLowest,width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSized(
              height: 0.01,
            ),
            largeText(title: 'Invite your friends', textSize: 18.0,color: theme.colorScheme.primary),
            const CustomSized(
              height: 0.01,
            ),
            smallText(title: 'Invite your friends to our app.', textSize: 11.0,color: theme.colorScheme.primary),
            const CustomSized(
              height:  0.03,
            ),
            Container(
              alignment: Alignment.center,
              height: MediaQuery.sizeOf(context).height * 0.06,
              width: MediaQuery.sizeOf(context).width * 1,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: theme.colorScheme.surfaceContainerHigh,width: 2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Icon(Icons.share_outlined,color: theme.colorScheme.surfaceTint,size: 30,),
                  smallText(title: '  $title',textSize: 14.0,weight:FontWeight.w700,color: theme.colorScheme.surfaceTint),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
