import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/controllers/shedule_ride_provider.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/custom_leading.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';


import 'current_pick_up_screen.dart';


class SheduleYourRideScreen extends StatelessWidget {
  const SheduleYourRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: RichText(
            text: const TextSpan(children: [
              TextSpan(
                  text: 'Logo',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              TextSpan(
                  text: 'ipsum',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18))
            ])),
        actions: [
          CustomLeading(isHome: true,iconData: Icons.close_outlined,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSized(height: 0.02,),
            largeText(title:'Scheduled your ride'),
            CustomSized(height: 0.01,),
            smallText(title:'Which time you want to be picked up?'),
            CustomSized(height: 0.02,),
            Consumer<ScheduleRideProvider>(
              builder: (context,provider,_){
                return Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: MediaQuery.sizeOf(context).height * 0.2,
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    decoration: BoxDecoration(
                      color: secondaryWhiteColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            provider.selectDate(context);
                          },
                            child: largeText(title: DateFormat('d MMM, E').format(provider.selectedDate),textSize: 32.0,weight: FontWeight.w800)),
                        Divider(color: dividerColor,),
                        GestureDetector(
                            onTap: (){
                              provider.selectTime(context);
                            },
                            child: largeText(title: provider.formatTime(),textSize: 32.0,weight: FontWeight.w800)),
                      ],
                    ),
                  ),
                );
              },
            ),
            CustomSized(height: 0.3,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.notifications_active_outlined,color: checkBoxColor,size: 30,),
                CustomSized(width: 0.02,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    smallText(title: 'if no cars are available we will let you know',),
                    smallText(title: 'at the  end of your pickup window',),
                  ],
                )
              ],
            ),
            CustomSized(height: 0.02,),
            Consumer<ScheduleRideProvider>(
              builder: (context,provider,_){
                return Align(
                    alignment: Alignment.center,
                    child: CustomButton(title: 'Confirm pickup time', onTap: (){
                      if(provider.isSelectedTimeValid(provider.selectedTime)){
                        print('valid');

                      }else {
                        print('in - valid');
                      }
                    },borderRadius: 30,onBoard: false,width: 1,));
              },
            ),
            CustomSized(height: 0.02,),
            Align(
                alignment: Alignment.center,
                child: CustomButton(title: 'Set current date and time', onTap: (){
                  Navigator.push(context, CupertinoPageRoute(builder: (context)=> CurrentPickUpScreen()));
                },borderRadius: 30,onBoard: false,width: 1,color: secondaryWhiteColor,titleColor: primaryTextColor,)),
          ],
        ),
      ),
    );
  }
}
