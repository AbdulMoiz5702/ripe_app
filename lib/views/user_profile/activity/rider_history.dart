import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/custom_leading.dart';
import '../../../../resubale_widgets/text_widgets.dart';
import '../../../resubale_widgets/user_rider_history_card.dart';
import '../../RIDER_SIDES_SCREENS/request_screen/bookings/ride_details_screen.dart';


class UserRiderHistoryScreen extends StatefulWidget {
  const UserRiderHistoryScreen({super.key});

  @override
  State<UserRiderHistoryScreen> createState() => _UserRiderHistoryScreenState();
}

class _UserRiderHistoryScreenState extends State<UserRiderHistoryScreen> {
  bool showList = false;

   showRiderHistory() {
     Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        showList = true;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showRiderHistory();
  }
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: CustomLeading(isHome: true,),
        title: largeText(title: 'Ride activity', textSize: 20.0,color: theme.primaryColor),
      ),
      body:showList == true ? ListView.builder(
        itemCount: 8,
          itemBuilder: (context,index){
        return UserRiderHistoryCard(
          isRideCanceled: index == 1 ? true : false,
          date: '7 May, 2024, ', time: '3:39PM', price: 20, distance: 20, locations: [
          'H2VV+96R, 7 Main Peshawar Rd, Saddar, Rawalpindi, Punjab 46000, Pakistan',
          'Askari 11, Rawalpindi, Punjab 46000, Pakistan',
          'Liaquat Bagh, Rawalpindi, Punjab 46000, Pakistan',
        ], onTap: () {
           Navigator.push(context, MaterialPageRoute(builder: (context)=> RideDetailsScreen()));
        },);
      })
          : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              savedAddress,
              height: MediaQuery.sizeOf(context).height * 0.4,
            ),
          ),
          largeText(title: 'No ride history', textSize: 17.0,color: theme.primaryColor),
          const CustomSized(height: 0.02),
          smallText(title: 'You didn’t have any rides yet.Let’s do something',color: theme.colorScheme.onSecondaryContainer),
          smallText(title: 'about that.',color: theme.colorScheme.onSecondaryContainer),
          const CustomSized(height: 0.2),
          CustomButton(title: 'Book a ride', onTap: (){
          },onBoard: false,width: 0.9,borderRadius: 30,),
        ],
      ),
    );
  }
}
