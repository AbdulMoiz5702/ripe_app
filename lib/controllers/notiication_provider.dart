

import 'package:flutter/cupertino.dart';

class NotificationProvider extends ChangeNotifier {

  bool riderPush = true;
  bool riderEmail = true;

  bool paymentPush = true;
  bool paymentEmail = true;
  bool paymentSMS = true;

  bool schedulePush = true;
  bool scheduleEmail = true;

  bool onGoingPush = true;
  bool onGoingEmails = true;



  changeValue(value,String switchCase){
    switch(switchCase){
      case 'riderPush':
        riderPush = value;
      case 'riderEmail':
        riderEmail = value;
      case 'paymentPush':
        paymentPush = value;
      case 'paymentSMS':
        paymentSMS = value;
      case 'paymentEmail':
        paymentEmail = value;
      case 'schedulePush':
        schedulePush = value;
      case 'scheduleEmail':
        scheduleEmail = value;
      case 'onGoingPush':
        onGoingPush = value;
      case 'onGoingEmails':
        onGoingEmails = value;
    }
    notifyListeners();
  }

}