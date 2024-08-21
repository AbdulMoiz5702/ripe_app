import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/controllers/auth_provider.dart';
import 'package:ride_app/resubale_widgets/Bg_widget.dart';
import 'package:ride_app/resubale_widgets/customTextFeild.dart';
import 'package:ride_app/resubale_widgets/login_options_row.dart';
import 'package:ride_app/views/bottom_screen/Main_bottom_Screen.dart';
import 'package:ride_app/views/role_selection_screen/select_role.dart';

import '../../resubale_widgets/CustomButton.dart';
import '../../resubale_widgets/Custom_Sized.dart';
import '../../resubale_widgets/band_name.dart';
import '../../resubale_widgets/custom_leading.dart';
import '../../resubale_widgets/divider_row.dart';
import '../../resubale_widgets/text_widgets.dart';
import 'forgot_password/forgot_Step1.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
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
                    CustomSized(
                      height: 0.020,
                    ),
                    BrandName(theme: theme),
                    CustomSized(
                      height: 0.02,
                    ),
                    largeText(
                        title: 'Hey there, Welcome Back', color: theme.primaryColor),
                    CustomSized(
                      height: 0.04,
                    ),
                    CustomTextField(
                      controller: controller,
                      keyBoardType: TextInputType.emailAddress,
                      obscureText: false,
                      hint: 'Email / Phone number',
                      onValidator: (value) {},
                      onFieldSubmittedValue: (value) {},
                      iconPath: email,
                    ),
                    CustomSized(
                      height: 0.03,
                    ),
                    CustomTextField(
                      controller: controller,
                      keyBoardType: TextInputType.emailAddress,
                      obscureText: false,
                      hint: 'Password',
                      onValidator: (value) {},
                      onFieldSubmittedValue: (value) {},
                      iconPath: lock,
                      isPassword: true,
                    ),
                    CustomSized(height: 0.01),
                    Align(alignment: Alignment.centerRight, child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotStep1()));
                      },
                        child: smallText(title: 'Forgot password ?', color: theme.colorScheme.secondary,textSize: 13.0))),
                    CustomSized(height: 0.03),
                    CustomButton(
                      title: 'Login',
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainBottomScreen()));
                      },
                      borderRadius: 30,
                      width: 1,
                      onBoard: false,
                    ),
                    CustomSized(height: 0.03),
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
                              color: theme.colorScheme.secondary),
                          CustomSized(
                            width: 0.01,
                          ),
                          Icon(
                            Icons.fingerprint,
                            color: theme.colorScheme.secondary,
                          ),
                        ],
                      ),
                      );
                    }),
                    CustomSized(height: 0.03),
                    dividerRow(context: context,title: 'login',),
                    CustomSized(height: 0.035),
                    LoginOptionsRow(),
                    CustomSized(height: 0.05),
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
                          smallText(title: 'Not a member ?  ',color: theme.primaryColor,weight:FontWeight.w700 ),
                          smallText(title: 'Register now',color: theme.colorScheme.secondary,textSize: 13.0),
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
