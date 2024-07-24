import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/controllers/shedule_ride_provider.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/notification_list_tile.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

import '../route_details_details.dart';

class ConfirmPickUp extends StatelessWidget {
  final TimeOfDay selectedTime;
  final String selectedDate;
  ConfirmPickUp({required this.selectedTime,required this.selectedDate});
  @override
  Widget build(BuildContext context) {
    print('object');
    String formattedTime = '${selectedTime.hourOfPeriod}:${selectedTime.minute.toString().padLeft(2, '0')} ${selectedTime.period == DayPeriod.am ? 'AM' : 'PM'}';
    return Container(
      padding: EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 5,
            width: MediaQuery.sizeOf(context).width * 0.3,
            decoration: BoxDecoration(
              color: dividerColor,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          CustomSized(height: 0.02,),
          ListTile(
            leading: largeText(title: 'Pickup location',textSize: 20.0),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                 SvgPicture.asset(advanceCalender,color: checkBoxColor,),
                largeText(title: '$selectedDate, $formattedTime',textSize: 13.0)
              ],
            ),
          ),
          Consumer<ScheduleRideProvider>(builder: (context,provider,_){
            return ListTile(
              dense: true,
              leading: Icon(Icons.location_on_outlined,color: checkBoxColor,),
              title:smallText(title: 'The Centaurus Mall',color: primaryTextColor) ,
              subtitle: smallText(title: 'F-8 - Islamabad, The Centaurus Mall',textSize: 11.0),
              trailing: IconButton(onPressed: (){
                provider.openMarkAddressFavoriteBottomSheet(context: context, address: 'The Centaurus Mall', suBbAddress: 'F-8 - Islamabad, The Centaurus Mall');
              }, icon: Icon(Icons.favorite_border,)),
            );
          }),
          Divider(),
          Consumer<ScheduleRideProvider>(
            builder: (context,provider,_){
              print('consumer');
             return Padding(
               padding: const EdgeInsets.only(left:10),
               child: NotificationListTile(title: 'Pick up from airport', value: provider.value, onChanged: (value){
                 provider.onChange(value);
                 provider.openAirPortPickupBottomSheet(context);
                 provider.makeValueFalse();
               }),
             );
            },
          ),
          CustomSized(height: 0.02,),
          CustomButton(title: 'Confirm pickup', onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> RouteDetailsDetailsScreen()));
          },borderRadius: 30,onBoard: false,width:1,),
          CustomSized(height: 0.02,),
        ],
      ),
    );
  }
}