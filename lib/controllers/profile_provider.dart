import 'package:flutter/material.dart';

import '../views/user_profile/setting_screens/saved_address/search_address_bottom/edit_address_detail_bottom.dart';
import '../views/user_profile/setting_screens/saved_address/search_address_bottom/search_address_bottom.dart';


class ProfileProvider extends ChangeNotifier {


  void onSearchAddressBottomInit({required BuildContext context}){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      openSearchAddressBottom(context: context);
    });
  }

  void openSearchAddressBottom({required BuildContext context}){
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
      return SearchAddressBottom();
    });
  }

  void openEditAddressDetailBottom({required BuildContext context}){
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
      return EditAddressDetailBottom();
    });
  }





}