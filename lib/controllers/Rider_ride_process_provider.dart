import 'package:flutter/material.dart';

import '../views/RIDER_SIDES_SCREENS/rate_pessenger/repost_issue.dart';
import '../views/RIDER_SIDES_SCREENS/ride_process_rider/ride_process_bottoms_sheets/ride_completed_bottom_scheet.dart';
import '../views/RIDER_SIDES_SCREENS/ride_process_rider/ride_process_bottoms_sheets/rider_arrived_bottom_screen.dart';
import '../views/RIDER_SIDES_SCREENS/ride_process_rider/ride_process_bottoms_sheets/rider_coming_bottom_sheet.dart';
import '../views/RIDER_SIDES_SCREENS/ride_process_rider/ride_process_bottoms_sheets/rider_in_progress_bottom_sheet.dart';



class RiderRideProcessProvider extends ChangeNotifier {

  int rating = 0;
  List<String> selectedTags = [];


  int indexx = -1;

  changeIndex(index){
    indexx = index;
    notifyListeners();
  }

  final List<String> tags = [
    'Driving', 'Friendly', 'Polite', 'Behaviour',
    'Cleanliness', 'Arrived quickly', 'Navigation'
  ];


  void toggleTag(String tag) {
      if (selectedTags.contains(tag)) {
        selectedTags.remove(tag);
      } else {
        selectedTags.add(tag);
      }
      notifyListeners();
  }



  Widget buildStar(int index,context) {
    var theme = Theme.of(context);
    return IconButton(
      padding: EdgeInsets.all(0),
      icon: Icon(
        index < rating ? Icons.star_rounded : Icons.star_outline_rounded,
        color: index < rating ? Colors.yellow : theme.dividerColor ,
        size: 35,
      ),
      onPressed: () {
          rating = index + 1;
          notifyListeners();
      },
    );
  }

  void onRiderCommingInit({required BuildContext context}){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      openRiderCommingBottomBottomSheet(context: context);
    });
  }

  void openRiderCommingBottomBottomSheet({required BuildContext context}){
    var theme = Theme.of(context);
    showModalBottomSheet(
        backgroundColor:theme.scaffoldBackgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        context: context, builder: (context){
      return RiderComingBottomSheet();
    });
  }

  void openRiderArrivedBottomSheet({required BuildContext context}){
    var theme = Theme.of(context);
    showModalBottomSheet(
        backgroundColor:theme.scaffoldBackgroundColor,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        context: context, builder: (context){
      return RiderArrivedBottomSheets();
    });
  }

  void openRiderInProgressBottomSheet({required BuildContext context}){
    var theme = Theme.of(context);
    showModalBottomSheet(
        backgroundColor:theme.scaffoldBackgroundColor,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        context: context, builder: (context){
      return RiderInProgressBottomSheet();
    });
  }

  void openRideCompletedBottomSheet({required BuildContext context}){
    var theme = Theme.of(context);
    showModalBottomSheet(
        backgroundColor:theme.scaffoldBackgroundColor,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        context: context, builder: (context){
      return RideCompletedBottomScheet();
    });
  }

  void openRepostIssueBottomSheet({required BuildContext context}){
    var theme = Theme.of(context);
    showModalBottomSheet(
        backgroundColor:theme.scaffoldBackgroundColor,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        context: context, builder: (context){
      return RepostIssueBottomSheet();
    });
  }





}