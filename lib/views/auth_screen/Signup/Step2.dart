import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/controllers/auth_provider.dart';
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
        backgroundColor: Color(0xff029FEB1F),
        appBar: AppBar(
          leading: CustomLeading(),
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
                    largeText(title: 'Enter your email', color: Colors.black),
                    CustomSized(height: 0.01,),
                    smallText(title: 'By sharing your email, you agree to our Terms of',),
                    CustomSized(height: 0.002,),
                    smallText(title: 'Services an Privacy Policy .',),
                    CustomSized(
                      height: 0.03,
                    ),
                    CustomTextField(
                      controller: controller,
                      keyBoardType: TextInputType.emailAddress,
                      obscureText: false,
                      hint: 'Email',
                      onValidator: (value) {},
                      onFieldSubmittedValue: (value) {},
                      iconPath: email,
                      iconData: Icons.mail_outline_sharp,

                    ),
                    Row(
                      children: [
                        Consumer<AuthProvider>(builder: (context,provider,_){
                          return Checkbox(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              activeColor: Colors.lightBlueAccent,
                              value: provider.isSelected,
                              onChanged: (value) {
                                provider.changeValue(value);
                              });
                        }),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomSized(
                              height: 0.005,
                            ),
                            smallText(
                                title: 'Sends me email notification for mentions',
                                color: primaryTextColor,
                                textSize: 14.0),
                            CustomSized(
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
                    CustomSized(height: 0.035),
                    CustomButton(
                      title: 'Continue',
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Step3()));
                      },
                      borderRadius: 30,
                      width: 1,
                    ),
                    CustomSized(height: 0.02),
                    dividerRow(context: context),
                    CustomSized(height: 0.03),
                    LoginOptionsRow(),
                    CustomSized(height: 0.044),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectRole()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          smallText(title: 'Already a member ?  ',color: primaryTextColor,weight:FontWeight.w700 ),
                          smallText(title: 'Login',color: checkBoxColor,textSize: 13.0),
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
