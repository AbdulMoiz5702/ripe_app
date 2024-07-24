import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/Bg_widget.dart';
import 'package:ride_app/resubale_widgets/LoginOptionButton.dart';
import 'package:ride_app/resubale_widgets/customTextFeild.dart';
import 'package:ride_app/resubale_widgets/signup_steps_count.dart';
import 'package:ride_app/views/auth_screen/Signup/Step3.dart';
import 'package:ride_app/views/role_selection_screen/select_role.dart';

import '../../../resubale_widgets/CustomButton.dart';
import '../../../resubale_widgets/Custom_Sized.dart';
import '../../../resubale_widgets/custom_leading.dart';
import '../../../resubale_widgets/divider_row.dart';
import '../../../resubale_widgets/login_options_row.dart';
import '../../../resubale_widgets/text_widgets.dart';

class Step2 extends StatelessWidget {
  const Step2({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    return BgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color(0xff029feb1f),
        appBar: AppBar(
          leading: const CustomLeading(),
          backgroundColor: Colors.transparent,
          actions: [
            SignupStepsCount(title: 2.toString()),
          ],
        ),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.68,
            width: MediaQuery.sizeOf(context).width * 1,
            decoration: const BoxDecoration(
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
                    const CustomSized(
                      height: 0.01,
                    ),
                    largeText(title: 'Enter your email', color: Colors.black),
                    const CustomSized(height: 0.01,),
                    smallText(title: 'By sharing your email, you agree to our Terms of',),
                    const CustomSized(height: 0.002,),
                    smallText(title: 'Services an Privacy Policy .',),
                    const CustomSized(
                      height: 0.03,
                    ),
                    CustomTextField(
                      controller: controller,
                      keyBoardType: TextInputType.emailAddress,
                      obscureText: false,
                      hint: 'Email',
                      onValidator: (value) {
                        return null;
                      },
                      onFieldSubmittedValue: (value) {},
                      iconPath: email,
                      iconData: Icons.mail_outline_sharp,

                    ),
                    Row(
                      children: [
                        Checkbox(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            activeColor: Colors.lightBlueAccent,
                            value: true,
                            onChanged: (value) {
                              value != value;
                            }),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CustomSized(
                              height: 0.005,
                            ),
                            smallText(
                                title: 'Sends me email notification for mentions',
                                color: primaryTextColor,
                                textSize: 14.0),
                            const CustomSized(
                              height: 0.001,
                            ),
                            smallText(
                                title: 'and direct messages',
                                color: primaryTextColor,
                                textSize: 14.0),
                          ],
                        ),
                      ],
                    ),
                    const CustomSized(height: 0.035),
                    CustomButton(
                      title: 'Continue',
                      onTap: () {
                        Navigator.push(context,
                            CupertinoPageRoute(builder: (context) => const Step3()));
                      },
                      borderRadius: 30,
                      width: 1,
                      height: 0.07,
                    ),
                    const CustomSized(height: 0.02),
                    dividerRow(context: context),
                    const CustomSized(height: 0.03),
                    const LoginOptionsRow(),
                    const CustomSized(height: 0.044),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const SelectRole()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          normalText(
                              title: 'Already a member ?  ', color: Colors.black),
                          smallText(title: 'Login', color: Colors.blue),
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
