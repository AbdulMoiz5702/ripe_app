import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/controllers/rider_ride_request_provider.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

import '../../../alert_dialogs/selection_alert_dialg.dart';

class MainRequestScreen extends StatelessWidget {
  const MainRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            largeText(
                title: 'Welcome Daniel 👋',
                color: theme.primaryColor,
                textSize: 18.0),
            Row(
              children: [
                smallText(title: 'Online', color: theme.primaryColor),
                Consumer<RiderRideRequestProvider>(builder: (context,provider,_){
                  return Transform.scale(
                    scale: 0.6,
                    child: CupertinoSwitch(
                        activeColor: theme.colorScheme.secondary,
                        value: provider.isOnline,
                        onChanged: (value) {
                          provider.changeValue(value);
                          AlertDialogClass().showRiderStatusConfirmationDialog(context);
                        }),
                  );
                }),
              ],
            ),
          ],
        ),
        bottom: PreferredSize(
            preferredSize: Size(MediaQuery.sizeOf(context).width, 40),
            child: Consumer<RiderRideRequestProvider>(builder: (context,provider,_){
              return Row(
                children: List.generate(2, (index){
                  return GestureDetector(
                    onTap: (){
                      provider.changeScreen(index);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(8),
                      width: MediaQuery.sizeOf(context).width * 0.5,
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: provider.currentIndex == index ? theme.colorScheme.secondary : theme.dividerColor))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(index == 0 ? Icons.podcasts_outlined : Icons.calendar_month_rounded ,color: provider.currentIndex == index ? theme.primaryColor : theme.colorScheme.onSecondaryContainer),
                          CustomSized(height: 0,width: 0.02,),
                          smallText(title:index == 0 ? 'Live Requests' : 'Bookings',weight: provider.currentIndex == index ?FontWeight.w700 : FontWeight.w400,color: provider.currentIndex == index ? theme.primaryColor : theme.colorScheme.onSecondaryContainer),
                        ],
                      ),
                    ),
                  );
                }),
              );
            })
        ),
      ),
      body: Consumer<RiderRideRequestProvider>(builder: (context,provider,_){
        return provider.screens[provider.currentIndex];
      }),
    );
  }
}
