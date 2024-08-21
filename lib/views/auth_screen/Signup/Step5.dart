import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/Bg_widget.dart';
import 'package:ride_app/resubale_widgets/band_name.dart';
import 'package:ride_app/resubale_widgets/signup_steps_count.dart';
import 'package:ride_app/views/auth_screen/Signup/Step6.dart';
import '../../../resubale_widgets/CustomButton.dart';
import '../../../resubale_widgets/Custom_Sized.dart';
import '../../../resubale_widgets/custom_leading.dart';
import '../../../resubale_widgets/otp_Feild_custom.dart';
import '../../../resubale_widgets/text_widgets.dart';

class Step5 extends StatelessWidget {
  const Step5({super.key});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BgWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: CustomLeading(),
          backgroundColor: Colors.transparent,
          actions: [
            SignupStepsCount(title: 5.toString()),
          ],
        ),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.8,
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
                    BrandName(theme: theme),
                    CustomSized(
                      height: 0.02,
                    ),
                    largeText(title: 'Enter 6-digit code',color:theme.primaryColor),
                    CustomSized(
                      height: 0.015,
                    ),
                    smallText(
                        title: 'Verification code has sent to your account at',color: theme.colorScheme.onSecondaryContainer),
                    CustomSized(
                      height: 0.01,
                    ),
                    smallText(
                        title: 'mr**********@gmail.com.Kindly enter 6-digit code',color: theme.colorScheme.onSecondaryContainer),
                    CustomSized(
                      height: 0.01,
                    ),
                    smallText(
                        title: 'to verify your account',color: theme.colorScheme.onSecondaryContainer),
                    CustomSized(
                      height: 0.02,
                    ),
                    Center(
                      child: Image(
                        alignment: Alignment.center,
                          image: AssetImage(mail),
                          isAntiAlias: true,
                          height: MediaQuery.sizeOf(context).height * 0.3,
                          width: MediaQuery.sizeOf(context).width * 0.6,
                          fit:BoxFit.cover,
                      ),
                    ),
                    CustomSized(
                      height: 0.02,
                    ),
                    CustomOtpField(),
                    CustomSized(
                      height: 0.01,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        smallText(
                            title: '( 1:00 ) ',
                            color: theme.primaryColor,
                        ),
                        smallText(
                            title: 'Resend code',
                            color: theme.colorScheme.secondary,
                        ),
                      ],
                    ),
                    CustomSized(
                      height: 0.035,
                    ),
                    CustomButton(
                      title: 'Verify Code',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Step6()));
                      },
                      borderRadius: 30,
                      width: 1,
                    ),
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
