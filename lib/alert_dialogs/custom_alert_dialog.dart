import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Dialog(
        backgroundColor: alertDialogBackGroundColor,
        insetAnimationCurve: Curves.linear,
        insetAnimationDuration: const Duration(seconds:2),
        insetPadding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.57,left: 8,right: 8) ,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(9),
          height: MediaQuery.sizeOf(context).height * 0.12,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(3),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: alertDialogIconColor,
                    ),
                      child: const Icon(Icons.check, color: whiteColor, size: 20)),
                  const CustomSized(width: 0.06,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      smallText(title: 'Your profile has been verified ',color: alertTextColor),
                      const CustomSized(height: 0.002,),
                      smallText(title: 'successfully. You may now enjoy',color: alertTextColor),
                      const CustomSized(height: 0.002,),
                      smallText(title: 'your ride.',color: alertTextColor),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
