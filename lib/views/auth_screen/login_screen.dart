import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/controllers/auth_provider.dart';
import 'package:ride_app/resubale_widgets/Bg_widget.dart';
import 'package:ride_app/resubale_widgets/customTextFeild.dart';
import 'package:ride_app/resubale_widgets/login_options_row.dart';
import 'package:ride_app/views/bottom_screen/Main_bottom_Screen.dart';
import 'package:ride_app/views/role_selection_screen/select_role.dart';

import '../../resubale_widgets/CustomButton.dart';
import '../../resubale_widgets/Custom_Sized.dart';
import '../../resubale_widgets/custom_leading.dart';
import '../../resubale_widgets/divider_row.dart';
import '../../resubale_widgets/text_widgets.dart';
import 'forgot_password/forgot_Step1.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    return BgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: const CustomLeading(),
          backgroundColor: Colors.transparent,
        ),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.78,
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
                    const CustomSized(
                      height: 0.020,
                    ),
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
                        title: 'Hey there, Welcome Back', color: Colors.black),
                    const CustomSized(
                      height: 0.04,
                    ),
                    CustomTextField(
                      controller: controller,
                      keyBoardType: TextInputType.emailAddress,
                      obscureText: false,
                      hint: 'Email / Phone number',
                      onValidator: (value) {
                        return null;
                      },
                      onFieldSubmittedValue: (value) {},
                      iconPath: email,
                    ),
                    const CustomSized(
                      height: 0.03,
                    ),
                    CustomTextField(
                      controller: controller,
                      keyBoardType: TextInputType.emailAddress,
                      obscureText: false,
                      hint: 'Password',
                      onValidator: (value) {
                        return null;
                      },
                      onFieldSubmittedValue: (value) {},
                      iconPath: lock,
                      isPassword: true,
                    ),
                    const CustomSized(height: 0.003),
                    Align(alignment: Alignment.centerRight, child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const ForgotStep1()));
                      },
                        child: smallText(title: 'Forgot password ?', color: lightPrimaryTextColor,textSize: 13.0))),
                    const CustomSized(height: 0.03),
                    CustomButton(
                      title: 'Login',
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const MainBottomScreen()));
                      },
                      borderRadius: 30,
                      width: 1,
                      height: 0.07,
                      onBoard: false,
                    ),
                    const CustomSized(height: 0.03),
                    Consumer<AuthProvider>(builder: (context,provider,_){
                      return GestureDetector(
                      onTap: (){
                        provider.authenticateWithBiometrics();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          normalText(
                              title: 'Login with fingerprint',
                              color: Colors.blue),
                          const CustomSized(
                            width: 0.01,
                          ),
                          const Icon(
                            Icons.fingerprint,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      );
                    }),
                    const CustomSized(height: 0.03),
                    dividerRow(context: context,title: 'login',),
                    const CustomSized(height: 0.035),
                    const LoginOptionsRow(),
                    const CustomSized(height: 0.03),
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
                              title: 'Not a member ?  ', color: Colors.black),
                          smallText(title: 'Register now', color: Colors.blue),
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
