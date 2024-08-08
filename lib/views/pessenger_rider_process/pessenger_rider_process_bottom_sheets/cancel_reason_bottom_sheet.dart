import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/consts/strings.dart';
import 'package:ride_app/controllers/pessenger_ride_process_provider.dart';

import '../../../consts/colors.dart';
import '../../../resubale_widgets/CustomButton.dart';
import '../../../resubale_widgets/Custom_Sized.dart';
import '../../../resubale_widgets/cutom_leading text_feild.dart';
import '../../../resubale_widgets/text_widgets.dart';


class CancelReasonBottomSheet extends StatelessWidget {
  const CancelReasonBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.75,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: theme.scaffoldBackgroundColor,
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Consumer<PessengerRideProcessProvider>(builder: (context, provider, _) {
              return Column(
                children: List.generate(riderCancel.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      provider.changeIndex(index);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      margin: EdgeInsets.only(bottom: 5),
                      alignment: Alignment.centerLeft,
                      height: MediaQuery.sizeOf(context).height * 0.07,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: provider.indexx == index
                            ? theme.colorScheme.surfaceContainerHighest
                            : Colors.transparent,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          smallText(
                              title: riderCancel[index],
                              color: theme.primaryColor),
                          provider.indexx == index
                              ? Icon(Icons.check,color: alertDialogIconColor,)
                              : Container(
                            height: 0,
                            width: 0,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              );
            }),
            CustomSized(height: 0.02,),
            CustomLeadingTextField(
                autoFocus: true,
                enable: true,
                isHintChange: true,
                leadingText: 'Other issue',
                controller: textController,
                keyBoardType: TextInputType.text,
                obscureText:false ,
                hint: 'Write your issue',
                onValidator: (value) {},
                onFieldSubmittedValue: (value) {}),
            CustomSized(height: 0.02,),
            SecondaryCustomButton(
              titleColor: theme.colorScheme.secondaryFixed,
              title: 'Cancel my ride',
              onTap: () {
                Navigator.pop(context);
              },
              borderRadius: 30,
              width: 1,
              color: theme.colorScheme.secondaryFixedDim,
                onBoard: false
            ),
            CustomSized(height: 0.02,),
            CustomButton(title: 'Go back to ride', onTap: () {
              Navigator.pop(context);
            },width: 1,borderRadius: 30,onBoard: false,)
          ],
        ),
      ),
    );
  }
}
