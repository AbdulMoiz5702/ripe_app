import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/Bg_widget.dart';
import 'package:ride_app/resubale_widgets/LoginOptionButton.dart';
import 'package:ride_app/resubale_widgets/band_name.dart';
import 'package:ride_app/resubale_widgets/customTextFeild.dart';
import 'package:ride_app/resubale_widgets/go_to_login.dart';
import 'package:ride_app/resubale_widgets/signup_steps_count.dart';


import '../../../resubale_widgets/CustomButton.dart';
import '../../../resubale_widgets/Custom_Sized.dart';
import '../../../resubale_widgets/custom_leading.dart';
import '../../../resubale_widgets/divider_row.dart';
import '../../../resubale_widgets/login_options_row.dart';
import '../../../resubale_widgets/text_widgets.dart';
import 'Step5.dart';

class Step4 extends StatelessWidget {
  const Step4({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    var theme = Theme.of(context);
    return BgWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: CustomLeading(),
          backgroundColor: Colors.transparent,
          actions: [
            SignupStepsCount(title: 4.toString()),
          ],
        ),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.68,
            width: MediaQuery.sizeOf(context).width * 1,
            decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                )),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSized(
                      height: 0.020,
                    ),
                    BrandName(theme: theme),
                    CustomSized(
                      height: 0.02,
                    ),
                    largeText(title: 'Set your password',color:theme.primaryColor),
                    CustomSized(
                      height: 0.015,
                    ),
                    smallText(title: 'We are almost finished with you account',color: theme.colorScheme.onSecondaryContainer),
                    CustomSized(
                      height: 0.01,
                    ),
                    smallText(
                        title: 'registration process,',color: theme.colorScheme.onSecondaryContainer,),
                    CustomSized(
                      height: 0.03,
                    ),
                    CustomTextField(
                      isPassword: true,
                      controller: controller,
                      keyBoardType: TextInputType.emailAddress,
                      obscureText: false,
                      hint: 'Password',
                      onValidator: (value) {},
                      onFieldSubmittedValue: (value) {},
                      iconPath: lock,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomSized(
                          height: 0.008,
                        ),
                        smallText(
                            title: ' Password must contain at least 6 characters. Try to make it a',
                            color:theme.colorScheme.onSecondaryContainer,
                            textSize: 11.0),
                        CustomSized(
                          height: 0.001,
                        ),
                        smallText(
                            title: ' little difficult.',
                            color: theme.colorScheme.onSecondaryContainer,
                            textSize: 11.0),
                      ],
                    ),
                    CustomSized(height: 0.03),
                    CustomButton(
                      onBoard: false,
                      title: 'Confirm password',
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Step5()));
                      },
                      borderRadius: 30,
                      width: 1,
                    ),
                    CustomSized(height: 0.04),
                    dividerRow(context: context),
                    CustomSized(height: 0.03),
                    LoginOptionsRow(),
                    CustomSized(height: 0.043),
                    GoToLogin(theme: theme),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
