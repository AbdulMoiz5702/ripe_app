import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/consts/strings.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/custom_leading.dart';
import 'package:ride_app/resubale_widgets/cutom_leading%20text_feild.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import '../../../consts/colors.dart';
import '../../../controllers/pessenger_ride_process_provider.dart';

class PessengerRepostIssue extends StatelessWidget {
  const PessengerRepostIssue({super.key});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: theme.scaffoldBackgroundColor,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                largeText(
                    title: 'Report issue',
                    textSize: 18.0,
                    color: theme.primaryColor),
                CustomLeadingSecond(
                  iconData: Icons.close,
                  isSecondary: true,
                  padding: 8,
                ),
              ],
            ),
            Consumer<PessengerRideProcessProvider>(builder: (context, provider, _) {
              return Column(
                children: List.generate(repostIssueUser.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      provider.changeIndexReportIssue(index);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      margin: EdgeInsets.only(bottom: 5),
                      alignment: Alignment.centerLeft,
                      height: MediaQuery.sizeOf(context).height * 0.07,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: provider.indexxxReportIssue == index
                            ? theme.colorScheme.surfaceContainerHighest
                            : Colors.transparent,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          smallText(
                              title: repostIssueUser[index],
                              color: theme.primaryColor),
                          provider.indexxxReportIssue == index
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
            CustomSized(height: 0.03,),
            CustomButton(title: 'Submit issue', onTap: () {},width: 1,borderRadius: 30,onBoard: false,)
          ],
        ),
      ),
    );
  }
}
