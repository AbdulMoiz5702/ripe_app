import 'package:flutter/material.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/customTextFeild.dart';

import '../../../consts/colors.dart';
import '../../../resubale_widgets/Custom_Sized.dart';
import '../../../resubale_widgets/cutom_leading text_feild.dart';
import '../../../resubale_widgets/text_widgets.dart';

class MakeAddressFavorite extends StatelessWidget {
  final String address;
  final String subAddress;
  const MakeAddressFavorite({required this.address,required this.subAddress});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 5,
            width: MediaQuery.sizeOf(context).width * 0.3,
            decoration: BoxDecoration(
              color: dividerColor,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          CustomSized(height: 0.02,),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSized(height: 0.02,),
                largeText(title: 'Saved addresses'),
                CustomSized(height: 0.01,),
                smallText(title: 'This address will be displayed in search list when '),
                CustomSized(height: 0.01,),
                smallText(title: 'you’ll search with saved name.'),
                CustomSized(height: 0.03,),
                CustomLeadingTextField(
                  controller: controller,
                  keyBoardType: TextInputType.emailAddress,
                  obscureText: false,
                  hint: 'Saved address name',
                  onValidator: (value) {},
                  onFieldSubmittedValue: (value) {},
                  iconDataColor: whiteColor,
                  iconData: Icons.add,
                ),
                CustomSized(height: 0.02,),
                ListTile(
                  dense: true,
                  leading: Icon(Icons.location_on_outlined,color: checkBoxColor,),
                  title:smallText(title:address,color: primaryTextColor) ,
                  subtitle: smallText(title:subAddress,textSize: 11.0),
                  trailing: Icon(Icons.favorite,color: checkBoxColor,),
                ),
                CustomSized(height: 0.02,),
                LocationAccessButton(width:1,title: 'Save address',iconData: Icons.favorite_border,onTap: (){
                  Navigator.pop(context);
                },borderRadius: 30,),
                CustomSized(height: 0.02,),
                CustomButton(width:1,title: 'Don\'t save', onTap: (){
                  Navigator.pop(context);
                },borderRadius: 30,color: secondaryWhiteColor,titleColor: primaryTextColor,onBoard: false,),
                CustomSized(height: 0.002,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
