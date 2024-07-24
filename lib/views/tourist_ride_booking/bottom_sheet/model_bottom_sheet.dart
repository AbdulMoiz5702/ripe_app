import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/consts/strings.dart';
import 'package:ride_app/controllers/shedule_ride_provider.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import '../../../resubale_widgets/home_screen_Text_Feild.dart';
import '../shedule_your_ride.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
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
                const CustomSized(height: 0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    largeText(title: 'Where to?',textSize: 20.0),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(_createRoute(screen: const SheduleYourRideScreen()));
                      },
                      child: Container(
                        child:Row(children: [
                          const Icon(Icons.add_box,color: checkBoxColor,),
                          smallText(title: ' Now ',),
                          const Icon(Icons.keyboard_arrow_down_rounded),
                        ],),
                      ),
                    ),
                  ],
                ),
                const CustomSized(height: 0.02,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
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
                              const CustomSized(width: 0.02,),
                              smallText(title: exploreScreen[index],color: provider.index == index ? primaryTextColor : dividerColor,),
                              const CustomSized(width: 0.04,),
                            ],
                          ),),
                        );
                      });
                    }),
                  ),
                ),
                const CustomSized(height: 0.02,),
                HomeScreenTextField(controller: controller, hint: 'search', onValidator: (value) {
                  return null;
                }, onFieldSubmittedValue: (newValue) {}, iconPath: searchBlack,color: textfieldColorSecond,hintColor: blackColor,),
                Column(
                  children: List.generate(6, (index){
                    return ListTile(
                      leading: const Icon(Icons.place_outlined,color: checkBoxColor,),
                      title: smallText(title: 'Giga Mall',color: primaryTextColor),
                      subtitle: smallText(title: 'DHA Phase II, Islamabad',textSize: 11.0),
                      trailing:  const Icon(Icons.favorite_border_rounded),
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

Route _createRoute({required Widget screen}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 2.0);  // Changed from -1.0 to 1.0 for bottom to top transition
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
