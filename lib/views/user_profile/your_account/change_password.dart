import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/custom_leading.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

import '../../../consts/colors.dart';
import '../../../controllers/custom_leading_feild_provider.dart';
import '../../../resubale_widgets/cutom_leading text_feild.dart';


class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: CustomLeading(isHome: true,),
        title: largeText(title: 'Change password ',textSize: 20.0,color: theme.primaryColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Consumer<CustomLeadingFieldProvider>(builder: (context,provider,_){
              return CustomLeadingTextField(
                onTap: (){
                  provider.changeCurrentPasswordIcon();
                },
                showPassword: provider.currentPassword,
                isPassword: true,
                isHintChange: true,
                leadingText: 'Current password',
                controller: controller,
                keyBoardType: TextInputType.emailAddress,
                obscureText: provider.currentPassword,
                hint: 'Current password',
                onValidator: (value) {},
                onFieldSubmittedValue: (value) {},
              );
            }),
            CustomSized(height: 0.02),
            Consumer<CustomLeadingFieldProvider>(builder: (context,provider,_){
              return CustomLeadingTextField(
                onTap: (){
                  provider.changeNewPasswordIcon();
                },
                showPassword: provider.newPassword,
                isPassword: true,
                isHintChange: true,
                leadingText: 'New password',
                controller: controller,
                keyBoardType: TextInputType.emailAddress,
                obscureText: provider.newPassword,
                hint: 'New password',
                onValidator: (value) {},
                onFieldSubmittedValue: (value) {},
              );
            }),
            CustomSized(height: 0.02),
            Consumer<CustomLeadingFieldProvider>(builder: (context,provider,_){
              return CustomLeadingTextField(
                onTap: (){
                  provider.changeConfirmNewPasswordIcon();
                },
                showPassword: provider.confirmNewPassword,
                isPassword: true,
                isHintChange: true,
                leadingText: 'Confirm new password',
                controller: controller,
                keyBoardType: TextInputType.emailAddress,
                obscureText: provider.confirmNewPassword,
                hint: 'Confirm new password',
                onValidator: (value) {},
                onFieldSubmittedValue: (value) {},
              );
            }),
            CustomSized(height: 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error,
                  size: 20,
                ),
                CustomSized(
                  width: 0.02,
                ),
                Expanded(
                  child: Text(
                    'Your password must be at least 6 characters. Try to make your password a little difficult.',
                    style: TextStyle(
                      fontSize: 11.0,
                      fontWeight: FontWeight.w400,
                      color: theme.colorScheme.onSecondaryContainer,
                      fontFamily: 'Nunito Sans',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
