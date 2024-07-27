import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_app/resubale_widgets/band_name.dart';
import 'package:ride_app/resubale_widgets/go_to_login.dart';

import '../../../consts/colors.dart';
import '../../../consts/images_path.dart';
import '../../../resubale_widgets/Bg_widget.dart';
import '../../../resubale_widgets/CustomButton.dart';
import '../../../resubale_widgets/Custom_Sized.dart';
import '../../../resubale_widgets/custom_leading.dart';
import '../../../resubale_widgets/otp_Feild_custom.dart';
import '../../../resubale_widgets/text_widgets.dart';
import '../login_screen.dart';
import 'forgot_Step3.dart';

class ForgotStep2 extends StatelessWidget {
  const ForgotStep2({super.key});

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
                    largeText(title: 'Enter 6-digit code',color: theme.primaryColor),
                    CustomSized(
                      height: 0.01,
                    ),
                    smallText(
                      title: 'Verification code has sent to your account at',color: theme.colorScheme.onSecondaryContainer),
                    CustomSized(
                      height: 0.005,
                    ),
                    smallText(
                      title: 'mr**********@gmail.com.Kindly enter 6-digit code',color: theme.colorScheme.onSecondaryContainer),
                    CustomSized(
                      height: 0.005,
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
                        height: MediaQuery.sizeOf(context).height * 0.29,
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
                            title: 'Resend code',
                            color: theme.colorScheme.secondary,
                            weight: FontWeight.w500),
                      ],
                    ),
                    CustomSized(
                      height: 0.02,
                    ),
                    CustomButton(
                      onBoard: false,
                      title: 'Verify Code',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotStep3()));
                      },
                      borderRadius: 30,
                      width: 1,
                    ),
                    CustomSized(
                      height: 0.02,
                    ),
                    WentToLogin(theme: theme),
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
