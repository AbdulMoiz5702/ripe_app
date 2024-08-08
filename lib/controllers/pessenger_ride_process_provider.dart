import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';
import '../views/pessenger_rider_process/pessenger_rate_rider_screen/add_rider_to_avorite_bottom_sheet.dart';
import '../views/pessenger_rider_process/pessenger_rate_rider_screen/custom_tip_bottom_sheet.dart';
import '../views/pessenger_rider_process/pessenger_rider_process_bottom_sheets/Emergency_assistance_bottom_sheet.dart';
import '../views/pessenger_rider_process/pessenger_rider_process_bottom_sheets/add_new_drop_point.dart';
import '../views/pessenger_rider_process/pessenger_rider_process_bottom_sheets/cancel_reason_bottom_sheet.dart';
import '../views/pessenger_rider_process/pessenger_rider_process_bottom_sheets/cancel_rider_bottom_sheet.dart';
import '../views/pessenger_rider_process/pessenger_rider_process_bottom_sheets/confirm_additonal_drop_stop.dart';
import '../views/pessenger_rider_process/pessenger_rider_process_bottom_sheets/estimated_time_bottom_sheet.dart';
import '../views/pessenger_rider_process/pessenger_rider_process_bottom_sheets/pessenger_repost_issue.dart';
import '../views/pessenger_rider_process/pessenger_rider_process_bottom_sheets/pessenger_ride_completed_bottom_sheet.dart';
import '../views/pessenger_rider_process/pessenger_rider_process_bottom_sheets/pessenger_rider_coming_bottom_sheet.dart';


class PessengerRideProcessProvider extends ChangeNotifier {

  bool change = false ;
  bool isExpanded = false ;
  int indexx = -1;
  int indexxxReportIssue = -1;

  int rating = 0;
  List<String> selectedTags = [];
  int indexTags = -1;
  int indexTagsTip = -1;

  changeIndexTagsTip(index){
    indexTagsTip = index;
    notifyListeners();
  }

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

  changeIndexTags(index){
    indexTags = index;
    notifyListeners();
  }

  changeValue(){
    isExpanded =! isExpanded;
    notifyListeners();
  }



  changeIndexReportIssue(index){
    indexxxReportIssue = index;
    notifyListeners();
  }

  void changeChangeValue(){
    Timer.periodic(Duration(seconds: 5), (v){
      change = true ;
      notifyListeners();
    });
  }

  Widget buildStar(int index,context) {
    var theme = Theme.of(context);
    return IconButton(
      padding: EdgeInsets.all(0),
      icon: Icon(
        index < rating ? Icons.star_rounded : Icons.star_outline_rounded,
        color: index < rating ? Colors.orange : greyColor,
        size: 35,
      ),
      onPressed: () {
        switch(index) {
          case 0:
            rating = index + 1;
            break;
          case 1:
            rating = index + 1;
            break;
          case 2:
            rating = index + 1;
            break;
          case 3:
            rating = index + 1;
            openAddRiderToAvoriteBottomSheet(context: context);
            break;
          case 4:
            rating = index + 1;
            openAddRiderToAvoriteBottomSheet(context: context);
            break;
        }
        notifyListeners();

      },
    );
  }

  void onPessengerRiderComingBottomSheetInit({required BuildContext context}){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      openPessengerRiderComingBottomSheet(context: context);
    });
  }

  void openPessengerRiderComingBottomSheet({required BuildContext context}){
    var theme = Theme.of(context);
    showModalBottomSheet(
      isScrollControlled: true,
        backgroundColor:theme.scaffoldBackgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        context: context, builder: (context){
      return PessengerRiderComingBottomSheet();
    });
  }

  void openCancelRiderBottomSheet({required BuildContext context}){
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
      return CancelRiderBottomSheet();
    });
  }


  void openCancelReasonBottomSheet({required BuildContext context}){
    var theme = Theme.of(context);
    showModalBottomSheet(
      isScrollControlled: true,
        backgroundColor:theme.scaffoldBackgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        context: context, builder: (context){
      return CancelReasonBottomSheet();
    });
  }


  void openEmergencyAssistanceBottomSheet({required BuildContext context}){
    var theme = Theme.of(context);
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor:theme.scaffoldBackgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        context: context, builder: (context){
      return EmergencyAssistanceBottomSheet();
    });
  }

  void openAddNewDropPointBottomSheet({required BuildContext context}){
    var theme = Theme.of(context);
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor:theme.scaffoldBackgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        context: context, builder: (context){
      return AddNewDropPointBottomSheet();
    });
  }

  void openConfirmAdditonalDropStop({required BuildContext context,required String address,required String subAddress}) {
    var theme = Theme.of(context);
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: theme.scaffoldBackgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (context) {
          return ConfirmAdditonalDropStop(
            address: address, subAddress: subAddress,);
        });
  }

  void openEstimatedTimeBottomSheet({required BuildContext context}){
    var theme = Theme.of(context);
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor:theme.scaffoldBackgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        context: context, builder: (context){
      return EstimatedTimeBottomSheet();
    });
  }

  void openPessengerRideCompletedBottomSheet({required BuildContext context}){
    var theme = Theme.of(context);
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor:theme.scaffoldBackgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        context: context, builder: (context){
      return PessengerRideCompletedBottomSheet();
    });
  }


  void openRepostIssueBottomSheet({required BuildContext context}){
    var theme = Theme.of(context);
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor:theme.scaffoldBackgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        context: context, builder: (context){
      return PessengerRepostIssue();
    });
  }


  void openCustomTipBottomSheet({required BuildContext context}){
    var theme = Theme.of(context);
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor:theme.scaffoldBackgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        context: context, builder: (context){
      return CustomTipBottomSheet();
    });
  }


  void openAddRiderToAvoriteBottomSheet({required BuildContext context}){
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
      return AddRiderToAvoriteBottomSheet();
    });
  }



}