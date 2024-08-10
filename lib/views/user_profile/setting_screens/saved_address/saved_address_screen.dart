import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/custom_leading.dart';
import 'package:ride_app/views/user_profile/setting_screens/saved_address/add_address_screen.dart';
import '../../../../resubale_widgets/text_widgets.dart';


class SavedAddressScreen extends StatelessWidget {
  const SavedAddressScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: CustomLeading(isHome: true,),
        title: largeText(title: 'Saved addresses', textSize: 20.0,color: theme.primaryColor),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              savedAddress,
              height: MediaQuery.sizeOf(context).height * 0.4,
            ),
          ),
          largeText(title: 'No address have been saved yet.', textSize: 17.0,color: theme.primaryColor),
          const CustomSized(height: 0.02),
          smallText(title: 'Qorem ipsum dolor sit amet, consectetur',color: theme.colorScheme.onSecondaryContainer),
          smallText(title: ' adipiscing elit. Nunc vulputate libero et velit',color: theme.colorScheme.onSecondaryContainer),
          smallText(title: ' interdum, ac aliquet odio mattis.',color: theme.colorScheme.onSecondaryContainer),
          const CustomSized(height: 0.2),
          CustomButton(title: 'Add new address', onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> AddAddressScreen()));
          },onBoard: false,width: 0.9,borderRadius: 30,),
        ],
      ),
    );
  }
}
