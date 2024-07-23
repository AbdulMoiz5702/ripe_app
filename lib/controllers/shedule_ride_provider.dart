import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:ride_app/consts/colors.dart';
import '../views/tourist_ride_booking/bottom_sheet/air_port_pick_up.dart';
import '../views/tourist_ride_booking/bottom_sheet/confirm_pick_up.dart';
import '../views/tourist_ride_booking/bottom_sheet/make_address_favorite.dart';
import '../views/tourist_ride_booking/bottom_sheet/route_details_bottom.dart';



class ScheduleRideProvider extends ChangeNotifier {

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  bool value = false;
  int index = 0;
  bool isExpanded = false ;
  bool preRide = false ;

  changePreRide (v){
    preRide = v;
    notifyListeners();
  }

  onChange(v){
    value = v ;
    notifyListeners();
  }

  changeValue(){
    isExpanded =! isExpanded;
    notifyListeners();
  }

  selectedIndex(n){
    index = n ;
    notifyListeners();
  }

  makeValueFalse(){
    value = false ;
    notifyListeners();
  }

  openAirPortPickupBottomSheet(context){
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
        context: context, builder: (context){
      return AirPortPickUpBottomSheet();
    });
  }

  void onRouteDetailsInit({required BuildContext context}){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      openRouteDetailsBottomBottomSheet(context: context);
    });
  }


  void openRouteDetailsBottomBottomSheet({required BuildContext context}){
     showModalBottomSheet(
         isScrollControlled: true,
         backgroundColor: whiteColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        context: context, builder: (context){
      return RouteDetailsBottom();
    });
  }

  openMarkAddressFavoriteBottomSheet({required BuildContext context,required String address,required String suBbAddress}){
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        context: context, builder: (context){
      return MakeAddressFavorite(address: address,subAddress: suBbAddress,);
    });
  }


  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: checkBoxColor, // Header background color
              onPrimary: whiteColor, // Header text color
              surface: whiteColor, // Background color of calendar picker
              onSurface: primaryTextColor, // Text color
            ),
            dialogBackgroundColor: whiteColor,
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      notifyListeners();
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: Theme(
            data: ThemeData.light().copyWith(
              timePickerTheme: TimePickerThemeData(
                backgroundColor: Colors.white,
                hourMinuteTextColor: Colors.black,
                dialHandColor: checkBoxColor,
                dialBackgroundColor:secondaryWhiteColor,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(16),
                ),
                dayPeriodColor: MaterialStateColor.resolveWith(
                      (states) => Colors.white, // Set to white
                ),
                dayPeriodTextColor: MaterialStateColor.resolveWith(
                      (states) => Colors.black,
                ),
                dayPeriodShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero, // Remove the border radius
                  side: BorderSide.none, // Remove the border
                ),
                hourMinuteColor: MaterialStateColor.resolveWith(
                      (states) => Colors.white, // Change this to white
                ),
                hourMinuteShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                inputDecorationTheme: InputDecorationTheme(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                dayPeriodTextStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                ),
              ),
            ),
            child: child!,
          ),
        );
      },
    );

    if (picked != null && picked != selectedTime) {
      selectedTime = TimeOfDay(
        hour: picked.hour,
        minute: (picked.minute ~/ 5) * 5,
      );
      notifyListeners();
    }
  }

  bool isSelectedTimeValid(TimeOfDay selectedTime) {
    final now = DateTime.now();
    final selectedDateTime = DateTime(now.year, now.month, now.day, selectedTime.hour, selectedTime.minute);
    final thresholdTime = now.add(Duration(minutes: 30));
    return selectedDateTime.isAfter(thresholdTime);
  }

  String formatTime() {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, selectedTime.hour, selectedTime.minute);
    final format = DateFormat.jm(); // '9:04 AM'
    return format.format(dt);
  }

  void onInIt({required BuildContext context}){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showBottomSheet(context: context);
    });
  }

  void showBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return ConfirmPickUp(selectedTime: selectedTime,selectedDate: DateFormat('d MMM, E').format(selectedDate).toString(),);
      },
    );
  }






}