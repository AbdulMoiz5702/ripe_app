import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/LoginOptionButton.dart';
import 'package:ride_app/resubale_widgets/customTextFeild.dart';
import 'package:ride_app/resubale_widgets/signup_steps_count.dart';
import 'package:ride_app/views/auth_screen/Signup/Step3.dart';
import 'package:ride_app/views/role_selection_screen/select_role.dart';

import '../../../resubale_widgets/CustomButton.dart';
import '../../../resubale_widgets/Custom_Sized.dart';
import '../../../resubale_widgets/custom_leading.dart';
import '../../../resubale_widgets/text_widgets.dart';



class Step2 extends StatelessWidget {
  const Step2({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        leading:CustomLeading(),
        backgroundColor: Colors.transparent,
        actions: [
          SignupStepsCount(title: 2.toString()),
        ],
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.65,
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
                  largeText(title: 'Enter your email',color: Colors.black),
                  CustomSized(height: 0.01,),
                  smallText(title: 'By sharing your email, you agree to our Terms of',color: Colors.black26),
                  CustomSized(height: 0.005,),
                  smallText(title: 'Services an Privacy Policy',color: Colors.black26),
                  CustomSized(height: 0.03,),
                  CustomTextField(controller: controller, keyBoardType: TextInputType.emailAddress, obscureText: false, hint: 'Email', onValidator: (value){}, onFieldSubmittedValue: (value){},iconData: Icons.mail_outline,),
                  Row(
                    children: [
                      Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)
                        ),
                        activeColor: Colors.blue,
                          value: true, onChanged: (value){
                        value!= value;
                      }),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomSized(height: 0.005,),
                          smallText(title: 'Sends me notification for mentions',color: Colors.black,textSize: 14.0),
                          CustomSized(height: 0.001,),
                          smallText(title: 'and direct message',color: Colors.black,textSize: 14.0),
                        ],
                      ),
                    ],
                  ),
                  CustomSized(height: 0.035),
                  CustomButton(title: 'Continue', onTap: (){
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=> Step3()));
                  },borderRadius: 30,width: 1,height:0.07,),
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
                      smallText(title: 'or register with',color: Colors.black26),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 3,
                        width: MediaQuery.sizeOf(context).width * 0.27,
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
                  CustomSized(height: 0.045),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (context)=> SelectRole()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        normalText(title: 'Already a member ?  ',color: Colors.black),
                        smallText(title: 'Login',color: Colors.blue),
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
