import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/band_name.dart';
import 'package:ride_app/resubale_widgets/cutom_leading%20text_feild.dart';
import '../../../resubale_widgets/Bg_widget.dart';
import '../../../resubale_widgets/CustomButton.dart';
import '../../../resubale_widgets/Custom_Sized.dart';
import '../../../resubale_widgets/custom_leading.dart';
import '../../../resubale_widgets/go_to_login.dart';
import '../../../resubale_widgets/text_widgets.dart';
import 'forgot_Step2.dart';


class ForgotStep1 extends StatelessWidget {
  const ForgotStep1({super.key});

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
            height: MediaQuery.sizeOf(context).height * 0.77,
            width: MediaQuery.sizeOf(context).width * 1,
            decoration: BoxDecoration(
                color:  theme.scaffoldBackgroundColor,
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
                    largeText(title: 'Forgot password',color: theme.primaryColor),
                    CustomSized(
                      height: 0.015,
                    ),
                    smallText(
                      title: 'A 6-digit code will be sent to your account in order to reset your account',color: theme.colorScheme.onSecondaryContainer),
                    CustomSized(
                      height: 0.01,
                    ),
                    smallText(
                        title: 'to reset your account',color: theme.colorScheme.onSecondaryContainer),
                    CustomSized(
                      height: 0.02,
                    ),
                    Center(
                      child: Image(
                        alignment: Alignment.center,
                        image: AssetImage(lockPassword),
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
                      controller: controller,
                      keyBoardType: TextInputType.emailAddress,
                      obscureText: false,
                      hint: 'Email',
                      onValidator: (value) {},
                      onFieldSubmittedValue: (value) {},
                      iconPath: email,
                      iconData: Icons.mail_outline_sharp,
                    ),
                    CustomSized(
                      height: 0.03,
                    ),
                    CustomButton(
                      onBoard: false,
                      title: 'Submit',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotStep2()));
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


