import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/controllers/pessenger_ride_process_provider.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import '../../../consts/images_path.dart';
import '../../../resubale_widgets/Custom_Sized.dart';
import '../../../resubale_widgets/bottom_sheets_leading.dart';
import '../../../resubale_widgets/text_widgets.dart';


class ConfirmAdditonalDropStop extends StatelessWidget {
  final String address ;
  final String subAddress ;
  const ConfirmAdditonalDropStop({required this.subAddress,required this.address});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var controller = Provider.of<PessengerRideProcessProvider>(context,listen: false);
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.52,
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BottomSheetsLeadings(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSized(
                  height: 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    largeText(
                        title: 'Add stop',
                        textSize: 20.0,
                        color: theme.primaryColor),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                        controller.openAddNewDropPointBottomSheet(context: context);
                      },
                      child: largeText(
                          title: 'Change location',
                          textSize: 14.0,
                          color: theme.colorScheme.secondary),
                    ),
                  ],
                ),
                CustomSized(
                  height: 0.02,
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(8),
                  dense: true,
                  leading: SvgPicture.asset(
                    currentLocationSVG,
                    color: theme.colorScheme.secondary,
                    alignment: Alignment.bottomCenter,
                    height: 25,
                  ),
                  title: smallText(
                      title:address, color: theme.primaryColor),
                  subtitle: smallText(
                      title: subAddress,
                      textSize: 11.0,
                      color: theme.colorScheme.onSecondaryContainer),
                  trailing: Icon(
                    Icons.favorite_border_rounded,
                    color: theme.colorScheme.onSecondaryContainer,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(10),
                  height: MediaQuery.sizeOf(context).height * 0.1,
                  width: MediaQuery.sizeOf(context).width * 1,
                  decoration: BoxDecoration(
                    color:  theme.cardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error,
                        size: 25,
                        color:  theme.canvasColor,
                      ),
                      CustomSized(
                        width: 0.02,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              smallText(title: 'An amount of',color:  theme.canvasColor,),
                              smallText(title: ' \$15 ',color:  theme.canvasColor,weight: FontWeight.w700),
                              smallText(title: ' will be added to your',color:  theme.canvasColor,),
                            ],
                          ),
                          CustomSized(height: 0.002,),
                          smallText(title: 'fare amount for this additional stop.',color:  theme.canvasColor,),
                        ],
                      ),
                    ],
                  ),
                ),
                CustomSized(
                  height: 0.02,
                ),
                CustomButton(title: 'Confirm additional stop', onTap: (){
                  controller.openEstimatedTimeBottomSheet(context: context);
                }, borderRadius: 30,
                  width: 1,onBoard: false,),
                CustomSized(
                  height: 0.01,
                ),
                SecondaryCustomButton(
                  color:  theme.colorScheme.surfaceContainerHighest,
                  titleColor: theme.colorScheme.primary,
                  title: 'No, go back to ride', onTap: (){
                    Navigator.pop(context);
                    controller.onPessengerRiderComingBottomSheetInit(context: context);
                }, borderRadius: 30,
                  width: 1,onBoard: false,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
