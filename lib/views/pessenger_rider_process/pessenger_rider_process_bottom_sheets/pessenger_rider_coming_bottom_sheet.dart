import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/controllers/pessenger_ride_process_provider.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/bottom_sheets_leading.dart';
import 'package:ride_app/resubale_widgets/chat_rider_passenger_listTile.dart';
import 'package:ride_app/resubale_widgets/doted_divider.dart';
import 'package:ride_app/resubale_widgets/location_sop_points.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';



class PessengerRiderComingBottomSheet extends StatelessWidget {
  const PessengerRiderComingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var controller =  Provider.of<PessengerRideProcessProvider>(context,listen: false);
    var theme = Theme.of(context);
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.9,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            BottomSheetsLeadings(),
            CustomSized(height: 0.01,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Consumer<PessengerRideProcessProvider>(builder: (context,provider,_){
                   return provider.change == true ? Center(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         largeText(title: '05:00',textSize: 32.0,color: theme.primaryColor,weight:FontWeight.w800 ),
                         CustomSized(height: 0.002,),
                         largeText(title: 'Your rider has arrived',textSize: 17.0,color: theme.colorScheme.onSecondaryContainer,),
                       ],
                     ),
                   ) : Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       largeText(title: 'Peter accepted your request for \$100,',textSize: 17.0,color: theme.primaryColor,),
                       CustomSized(height: 0.002,),
                       largeText(title: 'will arrive in 〜6 min.',textSize: 17.0,color: theme.primaryColor,),
                     ],
                   );
                 }),
                 CustomSized(height: 0.02,),
                 DottedDivider(),
                 CustomSized(height: 0.02,),
                 Row(
                   children: [
                     Image.asset(wagon),
                     CustomSized(width: 0.04,height: 0,),
                     Column(
                       children: [
                         largeText(title: 'Honda - Grey Corolla', textSize: 14.0,color: theme.primaryColor),
                         CustomSized(height: 0.01,),
                         Container(
                           margin: const EdgeInsets.only(right: 5),
                           padding: const EdgeInsets.all(15),
                           alignment: Alignment.center,
                           decoration: BoxDecoration(
                               color: theme.colorScheme.surfaceContainerHighest,
                               borderRadius: BorderRadius.circular(
                                 10,
                               )),
                           child: largeText(title: 'RIR-19-467', textSize: 14.0,color:theme.primaryColor),
                         ),

                       ],
                     )
                   ],
                 ),
                 CustomSized(height: 0.02,),
                 DottedDivider(),
                 CustomSized(height: 0.02,),
                 ChatRiderListTIle(theme: theme),
                 CustomSized(height: 0.02,),
                 DottedDivider(),
                 ListTile(
                   contentPadding: EdgeInsets.all(5),
                   leading: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       smallText(title: 'Payment details',textSize: 11.0,color: theme.colorScheme.onSecondaryContainer),
                       CustomSized(height: 0.002),
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisSize: MainAxisSize.min,
                         children: [
                           SvgPicture.asset(masterCardSVG),
                           CustomSized(width: 0.02,height: 0,),
                           largeText(title: '**** **** **** 2421',textSize: 17.0,color: theme.primaryColor),
                         ],
                       )
                     ],
                   ),
                   trailing: largeText(title: '\$100',textSize: 20.0,color: theme.primaryColor),
                 ),
                 DottedDivider(),
                 CustomSized(height: 0.01,),
                 GestureDetector(
                   onTap: (){
                     Navigator.pop(context);
                     controller.openAddNewDropPointBottomSheet(context: context);
                   },
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       smallText(title: 'Route details',textSize: 11.0),
                       Row(
                         children: [
                           Icon(Icons.add,color: theme.colorScheme.secondary,),
                           largeText(title:'Add stop',textSize: 13.0,color: theme.colorScheme.secondary,),
                         ],
                       )
                     ],
                   ),
                 ),
                 CustomSized(height: 0.01,),
                 LocationStopPonits(theme: theme),
                 CustomSized(height: 0.02,),
                 SecondaryAccessButton(
                     borderRadius: 30,
                     width: 1,
                     titleColor: theme.primaryColor,
                     color: theme.colorScheme.surfaceContainerHighest,
                     title: 'Emergency assistance', onTap: (){
                   controller.openEmergencyAssistanceBottomSheet(context: context);

                 }),
                 CustomSized(height: 0.01,),
                 SecondaryAccessButton(
                   iconData: Icons.cancel_outlined,
                   titleColor: theme.colorScheme.secondaryFixed,
                   title: 'Cancel ride',
                   onTap: () {
                     controller.openCancelRiderBottomSheet(context: context);
                   },
                   borderRadius: 30,
                   width: 1,
                   color: theme.colorScheme.secondaryFixedDim,
                 ),
               ],
                       ),
            )
          ],
        ),
      ),
    );
  }
}



