import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return BgWidget(
      child: Scaffold(
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
                color: Colors.white,
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

                    RichText(
                        text: const TextSpan(children: [
                          TextSpan(
                              text: 'Logo',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                          TextSpan(
                              text: 'ipsum',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18))
                        ])),
                    CustomSized(
                      height: 0.02,
                    ),
                    largeText(title: 'Enter 6-digit code',),
                    CustomSized(
                      height: 0.01,
                    ),
                    smallText(
                      title: 'Verification code has sent to your account at',),
                    CustomSized(
                      height: 0.005,
                    ),
                    smallText(
                      title: 'mr**********@gmail.com.Kindly enter 6-digit code',),
                    CustomSized(
                      height: 0.005,
                    ),
                    smallText(
                      title: 'to verify your account',),
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
                            color: Colors.blue,
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
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          smallText(title: 'Go back to',color: primaryTextColor,weight:FontWeight.w700 ),
                          smallText(title: '   Login',color: checkBoxColor,textSize: 13.0),
                        ],
                      ),
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
