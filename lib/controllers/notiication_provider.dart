import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/local_storage_strings.dart';

class NotificationProvider extends ChangeNotifier {
// RIDER MESSAGES Notification
  bool riderPush = true;
  bool riderEmail = true;
// PAYMENT NOTIFICATIONS  Notification
  bool paymentPush = true;
  bool paymentEmail = true;
  bool paymentSMS = true;
  // SCHEDULED RIDES Notification
  bool schedulePush = true;
  bool scheduleEmail = true;
// SCHEDULED RIDES Notification
  bool onGoingPush = true;
  bool onGoingEmails = true;

  NotificationProvider() {
    loadPreferences();
  }

  void loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // RIDER MESSAGES Notification
    riderPush = prefs.getBool(LocalStorageStrings.riderPush) ?? true;
    riderEmail = prefs.getBool(LocalStorageStrings.riderEmail) ?? true;
    // PAYMENT NOTIFICATIONS  Notification
    paymentPush = prefs.getBool(LocalStorageStrings.paymentPush) ?? true;
    paymentEmail = prefs.getBool(LocalStorageStrings.paymentEmail) ?? true;
    paymentSMS = prefs.getBool(LocalStorageStrings.paymentSMS) ?? true;
    // SCHEDULED RIDES Notification
    schedulePush = prefs.getBool(LocalStorageStrings.schedulePush) ?? true;
    scheduleEmail = prefs.getBool(LocalStorageStrings.scheduleEmail) ?? true;
    // SCHEDULED RIDES Notification
    onGoingPush = prefs.getBool(LocalStorageStrings.onGoingPush) ?? true;
    onGoingEmails = prefs.getBool(LocalStorageStrings.onGoingEmails) ?? true;
    notifyListeners();
  }


  void savePreference(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }



  changeValue(value,String switchCase){
    switch(switchCase){
      case 'riderPush':
        riderPush = value;
        savePreference(LocalStorageStrings.riderPush, value);
      case 'riderEmail':
        riderEmail = value;
        savePreference(LocalStorageStrings.riderEmail, value);
      case 'paymentPush':
        paymentPush = value;
        savePreference(LocalStorageStrings.paymentPush, value);
      case 'paymentSMS':
        paymentSMS = value;
        savePreference(LocalStorageStrings.paymentSMS, value);
      case 'paymentEmail':
        paymentEmail = value;
        savePreference(LocalStorageStrings.paymentEmail, value);
      case 'schedulePush':
        schedulePush = value;
        savePreference(LocalStorageStrings.schedulePush, value);
      case 'scheduleEmail':
        scheduleEmail = value;
        savePreference(LocalStorageStrings.scheduleEmail, value);
      case 'onGoingPush':
        onGoingPush = value;
        savePreference(LocalStorageStrings.onGoingPush, value);
      case 'onGoingEmails':
        onGoingEmails = value;
        savePreference(LocalStorageStrings.onGoingEmails, value);
    }
    notifyListeners();
  }

}