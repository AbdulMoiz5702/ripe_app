import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ride_app/consts/images_path.dart';
import '../views/tourist_ride_booking/bottom_sheet/ai_suggested_route_bottom_sheet.dart';
import '../views/tourist_ride_booking/bottom_sheet/air_port_pick_up.dart';
import '../views/tourist_ride_booking/bottom_sheet/confirm_pick_up.dart';
import '../views/tourist_ride_booking/bottom_sheet/credit_card_bottom.dart';
import '../views/tourist_ride_booking/bottom_sheet/make_address_favorite.dart';
import '../views/tourist_ride_booking/bottom_sheet/rearch_driver_cancel_conormation_sheet.dart';
import '../views/tourist_ride_booking/bottom_sheet/route_details_bottom.dart';
import '../views/tourist_ride_booking/bottom_sheet/search_for_rider_bottom.dart';



class ScheduleRideProvider extends ChangeNotifier {

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  bool value = false;
  int index = 0;
  bool isExpanded = false ;
  bool preRide = false ;
  int selectedValue = -1;
  String iconsPath = aiBot ;
  String title = ' AI suggested route';

  changeTitle({required String value}){
    title = value ;
    notifyListeners();
  }

  onAiRouteSelected({required String newPath}){
    iconsPath = newPath;
    notifyListeners();

  }

  void handleRadioValueChange(value) {
      selectedValue = value;
      notifyListeners();
  }

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




  openSearchDriverCancelConformationSheet(context){
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        context: context, builder: (context){
      return SearchDriverCancelConformationSheet();
    });
  }


  openAiSuggestedRouteBottomSheet(context){
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        context: context, builder: (context){
      return AiSuggestedRouteBottomSheet();
    });
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

  void openCreditCardBottomSheet({required BuildContext context}){
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
        context: context, builder: (context){
      return CreditCardBottomSheet();
    });
  }


  void openRouteDetailsBottomBottomSheet({required BuildContext context}){
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
    var theme = Theme.of(context);
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            datePickerTheme: DatePickerThemeData(
              dividerColor: theme.dividerColor,
              confirmButtonStyle: ButtonStyle(
                foregroundColor: WidgetStateProperty.all<Color>(theme.scaffoldBackgroundColor),
                backgroundColor: WidgetStateProperty.all<Color>(theme.primaryColor),
              ),
              cancelButtonStyle: ButtonStyle(
                foregroundColor: WidgetStateProperty.all<Color>(theme.primaryColor),
                backgroundColor: WidgetStateProperty.all<Color>(theme.scaffoldBackgroundColor),
              ),
            ),
            colorScheme:  ColorScheme.light(
              primary: theme.colorScheme.secondary, // Header background color
              onPrimary: theme.scaffoldBackgroundColor, // Header text color
              surface: theme.scaffoldBackgroundColor, // Background color of calendar picker
              onSurface: theme.primaryColor, // Text color
            ),
            dialogBackgroundColor: theme.scaffoldBackgroundColor,
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
    var theme = Theme.of(context);
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: Theme(
            data: ThemeData.light().copyWith(
              timePickerTheme: TimePickerThemeData(
                entryModeIconColor: theme.colorScheme.secondary,
                helpTextStyle: TextStyle(color: theme.primaryColor),
                dayPeriodBorderSide: BorderSide(color: theme.scaffoldBackgroundColor),
                  confirmButtonStyle: ButtonStyle(
                    foregroundColor: WidgetStateProperty.all<Color>(theme.scaffoldBackgroundColor),
                    backgroundColor: WidgetStateProperty.all<Color>(theme.primaryColor),
                  ),
                cancelButtonStyle: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all<Color>(theme.primaryColor),
                  backgroundColor: WidgetStateProperty.all<Color>(theme.scaffoldBackgroundColor),
                ),
                dialTextColor: theme.primaryColor,
                backgroundColor: theme.scaffoldBackgroundColor,
                hourMinuteTextColor: theme.primaryColor,
                dialHandColor: theme.colorScheme.secondary,
                dialBackgroundColor:theme.colorScheme.surfaceContainerHighest,
                shape: RoundedRectangleBorder(
                  side:  BorderSide(color: theme.scaffoldBackgroundColor),
                  borderRadius: BorderRadius.circular(16),
                ),
                dayPeriodColor: WidgetStateColor.resolveWith(
                      (states) => theme.scaffoldBackgroundColor, // Set to white
                ),
                dayPeriodTextColor: WidgetStateColor.resolveWith(
                      (states) => theme.primaryColor,
                ),
                dayPeriodShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero, // Remove the border radius
                  side: BorderSide.none, // Remove the border
                ),
                hourMinuteColor: WidgetStateColor.resolveWith(
                      (states) => theme.scaffoldBackgroundColor, // Change this to white
                ),
                hourMinuteShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                inputDecorationTheme: InputDecorationTheme(
                  fillColor: theme.scaffoldBackgroundColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                dayPeriodTextStyle:  TextStyle(
                  color: theme.colorScheme.secondary,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
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
    final thresholdTime = now.add(const Duration(minutes: 30));
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