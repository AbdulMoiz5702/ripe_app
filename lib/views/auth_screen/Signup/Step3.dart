import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/Bg_widget.dart';
import 'package:ride_app/resubale_widgets/customTextFeild.dart';
import 'package:ride_app/resubale_widgets/signup_steps_count.dart';
import 'package:ride_app/views/role_selection_screen/select_role.dart';

import '../../../resubale_widgets/CustomButton.dart';
import '../../../resubale_widgets/Custom_Sized.dart';
import '../../../resubale_widgets/custom_leading.dart';
import '../../../resubale_widgets/divider_row.dart';
import '../../../resubale_widgets/login_options_row.dart';
import '../../../resubale_widgets/text_widgets.dart';
import 'Step4.dart';

class Step3 extends StatelessWidget {
  const Step3({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    return BgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: const CustomLeading(),
          backgroundColor: Colors.transparent,
          actions: [
            SignupStepsCount(title: 3.toString()),
          ],
        ),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.66,
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
                    const CustomSized(height: 0.020,),
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
                    largeText(
                        title: 'Enter your Phone Number',),
                    const CustomSized(
                      height: 0.01,
                    ),
                    smallText(title: 'Add to recovery phone to help keep your account',),
                    const CustomSized(
                      height: 0.001,
                    ),
                    smallText(title: 'secure',),
                    const CustomSized(
                      height: 0.04,
                    ),
                    CustomTextField(
                      controller: controller,
                      keyBoardType: TextInputType.emailAddress,
                      obscureText: false,
                      hint: 'Phone Number',
                      onValidator: (value) {
                        return null;
                      },
                      onFieldSubmittedValue: (value) {},
                      iconPath: phone,
                    ),
                    const CustomSized(height: 0.03),
                    CustomButton(
                      title: 'Continue',
                      onTap: () {
                        Navigator.push(context,
                            CupertinoPageRoute(builder: (context) => const Step4()));
                      },
                      borderRadius: 30,
                      width: 1,
                      height: 0.07,
                    ),
                    const CustomSized(height: 0.03),
                    dividerRow(context: context),
                    const CustomSized(height: 0.04),
                    const LoginOptionsRow(),
                    const CustomSized(height: 0.045),
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
