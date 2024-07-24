import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/cutom_leading%20text_feild.dart';
import 'package:ride_app/views/auth_screen/login_screen.dart';

import '../../../consts/colors.dart';
import '../../../resubale_widgets/Bg_widget.dart';
import '../../../resubale_widgets/CustomButton.dart';
import '../../../resubale_widgets/Custom_Sized.dart';
import '../../../resubale_widgets/customTextFeild.dart';
import '../../../resubale_widgets/custom_leading.dart';
import '../../../resubale_widgets/text_widgets.dart';

class ForgotStep3 extends StatelessWidget {
  const ForgotStep3({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
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
                      height: 0.01,
                    ),
                    largeText(title: 'Reset password',),
                    CustomSized(
                      height: 0.01,
                    ),
                    smallText(
                      title: 'You can change your password now.',),
                    CustomSized(
                      height: 0.02,
                    ),
                    Center(
                      child: Image(
                        alignment: Alignment.center,
                        image: AssetImage(keyImage),
                        isAntiAlias: true,
                        height: MediaQuery.sizeOf(context).height * 0.29,
                        width: MediaQuery.sizeOf(context).width * 0.6,
                        fit:BoxFit.cover,
                      ),
                    ),
                    CustomSized(
                      height: 0.02,
                    ),
                    CustomLeadingTextField(
                      isPassword: true,
                      controller: controller,
                      keyBoardType: TextInputType.emailAddress,
                      obscureText: false,
                      hint: 'Password',
                      onValidator: (value) {},
                      onFieldSubmittedValue: (value) {},
                      iconPath: lock,
                    ),
                    CustomSized(
                      height: 0.02,
                    ),
                    CustomLeadingTextField(
                      isPassword: true,
                      controller: controller,
                      keyBoardType: TextInputType.emailAddress,
                      obscureText: false,
                      hint: 'Confirm password',
                      onValidator: (value) {},
                      onFieldSubmittedValue: (value) {},
                      iconPath: lock,
                    ),
                    CustomSized(
                      height: 0.027,
                    ),
                    CustomButton(
                      onBoard: false,
                      title: 'Update password',
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
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
