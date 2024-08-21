import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_app/resubale_widgets/band_name.dart';
import '../../../resubale_widgets/Bg_widget.dart';
import '../../../resubale_widgets/Custom_Sized.dart';
import '../../../resubale_widgets/custom_leading.dart';
import '../../../resubale_widgets/text_widgets.dart';
import 'custom_timer.dart';

class TimerRemainingToAccountRestore extends StatelessWidget {
  const TimerRemainingToAccountRestore({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BgWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: CustomLeading(),
          backgroundColor: Colors.transparent,
        ),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.655,
            width: MediaQuery.sizeOf(context).width * 1,
            decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                )),
            child: Padding(
              padding: const EdgeInsets.only(top:20.0,right: 20.0,left:20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BrandName(theme: theme),
                  CustomSized(
                    height: 0.02,
                  ),
                  largeText(title: 'Time left for unrestriction',color:theme.primaryColor),
                  CustomSized(
                    height: 0.015,
                  ),
                  smallText(
                      title: 'Your account is currently restricted due to a recent',color: theme.colorScheme.onSecondaryContainer),
                  CustomSized(
                    height: 0.01,
                  ),
                  smallText(
                      title: 'assessment. We understand that situations can',color: theme.colorScheme.onSecondaryContainer),
                  CustomSized(
                    height: 0.01,
                  ),
                  smallText(
                      title: 'change, and we want to ensure your safety and',color: theme.colorScheme.onSecondaryContainer),
                  CustomSized(
                    height: 0.01,
                  ),
                  smallText(
                      title: 'the safety of others. You’ll be able to resume',color: theme.colorScheme.onSecondaryContainer),
                  CustomSized(
                    height: 0.01,
                  ),
                  smallText(
                      title: 'driving in:',color: theme.colorScheme.onSecondaryContainer),
                  Center(
                    child: Container(
                      height: MediaQuery.sizeOf(context).height * 0.4,
                        width:MediaQuery.sizeOf(context).width * 0.4,
                        child: Custom3DCircularTimer()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
