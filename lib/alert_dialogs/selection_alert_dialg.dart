import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/alert_dialogs/repost_chat_alert_dilaog.dart';
import 'package:ride_app/alert_dialogs/rider_Status_confirmation.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/controllers/aler_dialog_providers.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import 'custom_alert_dialog.dart';
import 'fare_comparison_alert_diloag.dart';



class AlertDialogClass {

  void showCustomDialog(BuildContext context) {
    var theme = Theme.of(context);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: theme.scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: const DialogContent(),
        );
      },
    );
  }

  void showFareComparisonAlertDialog(BuildContext context){
    var theme = Theme.of(context);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor:theme.scaffoldBackgroundColor ,
          contentPadding: EdgeInsets.all(5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content:FareComparisonAlertDialog(),
        );
      },
    );
  }

  void showCustomAlertDialog(BuildContext context) {
    Future.delayed(Duration(seconds: 1),(){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlertDialog();
        },
      );
    });
  }

  void showChatRepostAlertDialog(context){
    showDialog(context: context, builder: (context){
      return RepostChatAlertDialog();
    });

  }

  void showRiderStatusConfirmationDialog(context){
    var theme = Theme.of(context);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor:theme.scaffoldBackgroundColor ,
          contentPadding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content:RiderStatusConfirmation(),
        );
      },
    );
  }



}

class DialogContent extends StatelessWidget {
  const DialogContent({super.key});


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      color: theme.scaffoldBackgroundColor,
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomSized(height: 0.02),
          Align(
            alignment: Alignment.centerLeft,
            child: largeText(
              title: 'Which one are you?',
              color: theme.primaryColor,
            ),
          ),
          Consumer<AlertDialogProviders>(builder: (context,provider,_){
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AlertSelectionConatiner(
                  descriptionSecond: 'and don’t know much',
                  descriptionThird: 'about city. Select this',
                  title: 'Tourist',
                  onTap: provider.selectTourist,
                  imagePath: touristSvg,
                  description: 'If you’re new to the city',
                  isSelected: provider.tourist,
                ),
                AlertSelectionConatiner(
                  descriptionSecond: 'locations and just want a',
                  descriptionThird: 'ride. Select this',
                  title: 'Local User',
                  onTap: provider.selectLocal,
                  imagePath: localSvg,
                  description: 'If you’re familiar with the',
                  isSelected: provider.local,
                ),
              ],
            );
          }),
          CustomButton(
            title: 'Go to booking',
            onTap: () {},
            borderRadius: 30,
          ),
          const CustomSized(
            height: 0.01,
          ),
        ],
      ),
    );
  }
}

class AlertSelectionConatiner extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;
  final String description;
  final String descriptionSecond;
  final String descriptionThird;
  final bool isSelected;
  const AlertSelectionConatiner(
      {super.key, 
        required this.descriptionSecond,
        required this.descriptionThird,
        required this.title,
        required this.onTap,
        required this.imagePath,
        required this.description,
        this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.sizeOf(context).height * 0.3,
        width: MediaQuery.sizeOf(context).width * 0.33,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 0.33,
              decoration: BoxDecoration(
                color: isSelected == true ? theme.primaryColor: theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: theme.colorScheme.surface),
              ),
              child: Column(
                children: [
                  const CustomSized(
                    height: 0.01,
                  ),
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.1,
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    decoration: const BoxDecoration(
                    ),
                    child: SvgPicture.asset(imagePath,color: isSelected == true ? theme.colorScheme.secondary : theme.primaryColor,),
                  ),
                  const CustomSized(
                    height: 0.01,
                  ),
                  smallText(
                      title: title,
                      color: isSelected == true ? theme.colorScheme.secondary  : theme.primaryColor),
                  const CustomSized(
                    height: 0.01,
                  ),
                ],
              ),
            ),
            const CustomSized(
              height: 0.01,
            ),
            smallText(title: description, textSize: 11.0,color: theme.colorScheme.onSecondaryContainer),
            smallText(title: descriptionSecond, textSize: 11.0,color: theme.colorScheme.onSecondaryContainer),
            smallText(title: descriptionThird,textSize: 11.0,color: theme.colorScheme.onSecondaryContainer),
          ],
        ),
      ),
    );
  }
}


