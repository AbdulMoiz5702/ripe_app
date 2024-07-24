import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/consts/strings.dart';
import 'package:ride_app/controllers/shedule_ride_provider.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import '../../../resubale_widgets/home_screen_Text_Feild.dart';
import '../../custom_rote_navigation/custom_route_navigation.dart';
import '../shedule_your_ride.dart';

class BottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 5,
              width: MediaQuery.sizeOf(context).width * 0.3,
              decoration: BoxDecoration(
                color: dividerColor,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSized(height: 0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    largeText(title: 'Where to?',textSize: 20.0),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(createRoute(screen: SheduleYourRideScreen()));
                      },
                      child: Container(
                        child:Row(children: [
                          Icon(Icons.add_box,color: checkBoxColor,),
                          smallText(title: ' Now ',),
                          Icon(Icons.keyboard_arrow_down_rounded),
                        ],),
                      ),
                    ),
                  ],
                ),
                CustomSized(height: 0.02,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    children: List.generate(exploreScreen.length, (index){
                      return Consumer<ScheduleRideProvider>(builder: (context,provider,_){
                        return GestureDetector(
                          onTap: (){
                            provider.selectedIndex(index);
                          },
                          child: Container(child: Row(
                            children: [
                              Icon(exploreScreenIcons[index],color: provider.index == index ? primaryTextColor : dividerColor,),
                              CustomSized(width: 0.02,),
                              smallText(title: exploreScreen[index],color: provider.index == index ? primaryTextColor : dividerColor,),
                              CustomSized(width: 0.04,),
                            ],
                          ),),
                        );
                      });
                    }),
                  ),
                ),
                CustomSized(height: 0.02,),
                HomeScreenTextField(controller: controller, hint: 'search', onValidator: (value) {}, onFieldSubmittedValue: (newValue) {}, iconPath: searchBlack,color: textfieldColorSecond,hintColor: blackColor,),
                Column(
                  children: List.generate(6, (index){
                    return ListTile(
                      leading: Icon(Icons.place_outlined,color: checkBoxColor,),
                      title: smallText(title: 'Giga Mall',color: primaryTextColor),
                      subtitle: smallText(title: 'DHA Phase II, Islamabad',textSize: 11.0),
                      trailing:  Icon(Icons.favorite_border_rounded),
                    );
                  }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


