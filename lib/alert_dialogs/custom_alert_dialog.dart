import 'package:flutter/material.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Dialog(
        backgroundColor: theme.colorScheme.scrim,
        insetAnimationCurve: Curves.linear,
        insetAnimationDuration: const Duration(seconds:2),
        insetPadding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.57,left: 8,right: 8) ,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 20),
          height: MediaQuery.sizeOf(context).height * 0.12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  CustomSized(
                    height: 0.008,
                    width: 0,
                  ),
                  Icon(
                    Icons.check_circle,
                    size: 25,
                    color:  theme.colorScheme.surfaceVariant,
                  ),
                ],
              ),
              CustomSized(
                width: 0.03,
              ),
              Expanded(
                child: Text(
                  'Your profile has bee verified       successfully. You may now enjoy            your ride.',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.7,
                    fontWeight: FontWeight.w400,
                    color:  theme.colorScheme.onPrimary,
                    fontFamily: 'Nunito Sans',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
