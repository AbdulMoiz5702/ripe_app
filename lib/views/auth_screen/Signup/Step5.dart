import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';
import 'package:otp_text_field_v2/otp_text_field_v2.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/LoginOptionButton.dart';
import 'package:ride_app/resubale_widgets/customTextFeild.dart';
import 'package:ride_app/resubale_widgets/signup_steps_count.dart';
import 'package:ride_app/views/auth_screen/Signup/Step3.dart';
import 'package:ride_app/views/role_selection_screen/select_role.dart';

import '../../../main.dart';
import '../../../resubale_widgets/CustomButton.dart';
import '../../../resubale_widgets/Custom_Sized.dart';
import '../../../resubale_widgets/custom_leading.dart';
import '../../../resubale_widgets/text_widgets.dart';



class Step5 extends StatelessWidget {
  const Step5({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = OtpFieldControllerV2();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xff029FEB1F),
      appBar: AppBar(
        leading:CustomLeading(),
        backgroundColor: Colors.transparent,
        actions: [
          SignupStepsCount(title: 5.toString()),
        ],
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.72,
          width: MediaQuery.sizeOf(context).width * 1,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              )
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSized(height: 0.020,),
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
                  CustomSized(height: 0.01,),
                  largeText(title: 'Enter 6-digit code',color: Colors.black),
                  CustomSized(height: 0.01,),
                  smallText(title: 'Verification code has sent to your account at',color: Colors.black45,textSize: 12.0),
                  CustomSized(height: 0.005,),
                  smallText(title: 'mr**********@gmail.com.Kindly enter 6-digit code',color: Colors.black45,textSize: 12.0),
                  CustomSized(height: 0.005,),
                  smallText(title: 'to verify your account',color: Colors.black45,textSize: 12.0),
                  CustomSized(height: 0.03,),
                  Container(
                    height: 200,
                    width: MediaQuery.sizeOf(context).width * 1,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(mail),fit: BoxFit.cover),
                    ),
                  ),
                  CustomSized(height: 0.03,),

                  OTPTextFieldV2(
                      controller: controller,
                      cursorColor: Colors.lightBlueAccent,
                      length: 6,
                      autoFocus: true,
                      width: MediaQuery.of(context).size.width,
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldWidth: 45,
                      fieldStyle: FieldStyle.box,
                      outlineBorderRadius: 30,
                      style: TextStyle(fontSize: 17),
                      onChanged: (pin) {
                        print("Changed: " + pin);
                      },
                      onCompleted: (pin) {
                        print("Completed: " + pin);
                      }),
                  CustomSized(height: 0.01,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      smallText(title: '[ 1:00 ] ',color: Colors.black,weight: FontWeight.w500),
                      smallText(title: 'Resend code',color: Colors.blue , weight: FontWeight.w500),
                    ],
                  ),
                  CustomSized(height: 0.03,),
                  CustomButton(title: 'Verify Code', onTap: (){
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=>MyHomePage(title: 'Zego cloud',)));
                  },borderRadius: 30,width: 1,height:0.07,),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
