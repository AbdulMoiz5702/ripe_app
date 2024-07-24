import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/controllers/role_selection_provider.dart';
import 'package:ride_app/resubale_widgets/Bg_widget.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/custom_leading.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import 'package:ride_app/views/auth_screen/Signup/Step1.dart';
import 'package:ride_app/views/auth_screen/login_screen.dart';

import '../../resubale_widgets/CustomButton.dart';
import '../../resubale_widgets/RoleSelectionConatiner.dart';
import '../../resubale_widgets/signup_steps_count.dart';


class SelectRole extends StatelessWidget {
  const SelectRole({super.key});
  @override
  Widget build(BuildContext context) {
    return BgWidget(
      child: Scaffold(
        appBar: AppBar(
          leading:CustomLeading(),
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.62,
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
                    CustomSized(
                      height: 0.020,
                    ),
                    largeText(title: 'Choose Your Role',),
                    CustomSized(
                      height: 0.020,
                    ),
                    Consumer<RoleSelectionProvider>(builder: (context,provider,_){
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RoleSelectionConatiner(title: 'Driver',onTap: (){
                            provider.selectDriver();
                          },description: 'If you’re looking to offer rides and share your journey with others.',imagePath: driverSvg,isSelected: provider.driverSelection,),
                          RoleSelectionConatiner(title: 'Passenger',onTap: (){
                            provider.selectPassenger();
                          },description: 'If you need a ride and want to find a fellow traveler.',imagePath: passengerSvg,isSelected: provider.passengerSelection,),
                        ],
                      );
                    }),
                    CustomButton(title: 'Next', onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Step1()));
                    },borderRadius: 30,width: 1,),
                    CustomSized(height: 0.03),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          smallText(title: 'Already a member?  ',color: primaryTextColor,weight:FontWeight.w700 ),
                          smallText(title: 'Login',color: checkBoxColor,textSize: 13.0),
                        ],
                      ),
                    ),
      
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
