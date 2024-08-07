import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/consts/colors.dart';
import '../../../consts/images_path.dart';
import '../../../controllers/pessenger_ride_process_provider.dart';
import '../../../resubale_widgets/Custom_Sized.dart';
import '../../../resubale_widgets/bottom_sheets_leading.dart';
import '../../../resubale_widgets/home_screen_Text_Feild.dart';
import '../../../resubale_widgets/text_widgets.dart';


class AddNewDropPointBottomSheet extends StatelessWidget {
  const AddNewDropPointBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var controller = Provider.of<PessengerRideProcessProvider>(context,listen: false);
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.6,
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BottomSheetsLeadings(),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSized(
                      height: 0.02,
                    ),
                    largeText(
                        title: 'Add stop',
                        textSize: 20.0,
                        color: theme.primaryColor),
                    CustomSized(
                      height: 0.02,
                    ),
                    HomeScreenTextField(
                      controller: textController,
                      hint: 'search',
                      onValidator: (value) {},
                      onFieldSubmittedValue: (newValue) {},
                      iconPath: searchBlack,
                      color: theme.colorScheme.surfaceContainerHighest,
                      hintColor: theme.primaryColor,
                    ),
                    Column(
                      children: List.generate(6, (index) {
                        return ListTile(
                          onTap:(){
                            Navigator.pop(context);
                            controller.openConfirmAdditonalDropStop(context: context, address: 'Giga Mall', subAddress: 'DHA Phase II, Islamabad');
                          } ,
                          contentPadding: EdgeInsets.all(8),
                          dense: true,
                          leading: SvgPicture.asset(
                            currentLocationSVG,
                            color: theme.colorScheme.secondary,
                            alignment: Alignment.bottomCenter,
                            height: 25,
                          ),
                          title: smallText(
                              title: 'Giga Mall', color: theme.primaryColor),
                          subtitle: smallText(
                              title: 'DHA Phase II, Islamabad',
                              textSize: 11.0,
                              color: theme.colorScheme.onSecondaryContainer),
                          trailing: Icon(
                            Icons.favorite_border_rounded,
                            color: theme.colorScheme.onSecondaryContainer,
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
