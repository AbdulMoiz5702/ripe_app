import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/LoginOptionButton.dart';
import 'package:ride_app/resubale_widgets/customTextFeild.dart';
import 'package:ride_app/views/role_selection_screen/select_role.dart';

import '../../resubale_widgets/CustomButton.dart';
import '../../resubale_widgets/Custom_Sized.dart';
import '../../resubale_widgets/custom_leading.dart';
import '../../resubale_widgets/text_widgets.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        leading:CustomLeading(),
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
              )
          ),
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
                  largeText(title: 'Hey there, Welcome Back',color: Colors.black),
                  CustomSized(height: 0.04,),
                  CustomTextField(controller: controller, keyBoardType: TextInputType.emailAddress, obscureText: false, hint: 'Email / Phone number', onValidator: (value){}, onFieldSubmittedValue: (value){},iconData: Icons.alternate_email_rounded,),
                  CustomSized(height: 0.04,),
                  CustomTextField(controller: controller, keyBoardType: TextInputType.emailAddress, obscureText: false, hint: 'Password', onValidator: (value){}, onFieldSubmittedValue: (value){},iconData: Icons.lock,),
                  Align(alignment: Alignment.centerRight, child: smallText(title: 'Forgot password ?' ,color: Colors.blue)),
                  CustomSized(height: 0.03),
                  CustomButton(title: 'Login', onTap: (){},borderRadius: 30,width: 1,height:0.07,onBoard: false,),
                  CustomSized(height: 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      normalText(title: 'Login with fingerprint',color: Colors.blue),
                      CustomSized(width: 0.01,),
                      Icon(Icons.fingerprint,color: Colors.blue,),
                    ],
                  ),
                  CustomSized(height: 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 3,
                        width: MediaQuery.sizeOf(context).width * 0.27,
                        color: Colors.black26,
                      ),
                      smallText(title: 'or login with',color: Colors.black26),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 3,
                        width: MediaQuery.sizeOf(context).width * 0.3,
                        color: Colors.black26,
                      )
                    ],
                  ),
                  CustomSized(height: 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      LoginOptionButton(title: 'Google', imagePath: google),
                      LoginOptionButton(title: 'Facebook', imagePath: facebook),
                    ],
                  ),
                  CustomSized(height: 0.03),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (context)=> SelectRole()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        normalText(title: 'Not a member ?  ',color: Colors.black),
                        smallText(title: 'Register now',color: Colors.blue),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
