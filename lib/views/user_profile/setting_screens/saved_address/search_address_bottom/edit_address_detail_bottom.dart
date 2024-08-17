import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/consts/strings.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/customTextFeild.dart';
import '../../../../../consts/colors.dart';
import '../../../../../consts/images_path.dart';
import '../../../../../controllers/profile_provider.dart';
import '../../../../../resubale_widgets/Custom_Sized.dart';
import '../../../../../resubale_widgets/bottom_sheets_leading.dart';
import '../../../../../resubale_widgets/home_screen_Text_Feild.dart';
import '../../../../../resubale_widgets/text_widgets.dart';
import '../saved_address_screen.dart';

class EditAddressDetailBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BottomSheetsLeadings(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSized(
                  height: 0.02,
                ),
                largeText(
                    title: 'Edit/Add address details',
                    textSize: 20.0,
                    color: theme.primaryColor),
                CustomSized(
                  height: 0.01,
                ),
                smallText(title: 'Move map to change the location',textSize: 14.0,color: theme.colorScheme.onSecondaryContainer),
                CustomSized(
                  height: 0.02,
                ),
                largeText(title: 'Building type',textSize: 12.0,color:  theme.colorScheme.onSecondaryContainer),
                Row(
                  children: List.generate(4, (index){
                    return Container(
                      margin:const  EdgeInsets.all(5),
                      height: 40,
                      width: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: theme.dividerColor),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(building[index],color: theme.colorScheme.onSecondaryContainer,),
                    );
                  }),
                ),
                CustomSized(
                  height: 0.01,
                ),
                CustomTextField(controller: textController, keyBoardType: TextInputType.text, obscureText: false, hint: 'Address title', onValidator: (value){}, onFieldSubmittedValue: (value){}),
                CustomSized(
                  height: 0.02,
                ),
                CustomButton(title: 'Save address', onTap: (){
                  Navigator.pop(context);
                },borderRadius: 30,width:1 ,onBoard: false,),
              ],
            ),
          )
        ],
      ),
    );
  }
}