import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/custom_leading.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import 'package:ride_app/views/auth_screen/Signup/Step1.dart';
import 'package:ride_app/views/auth_screen/login_screen.dart';

import '../../resubale_widgets/CustomButton.dart';
import '../../resubale_widgets/RoleSelectionConatiner.dart';
import '../../resubale_widgets/signup_steps_count.dart';


class SelectRole extends StatefulWidget {
  const SelectRole({super.key});

  @override
  State<SelectRole> createState() => _SelectRoleState();
}

class _SelectRoleState extends State<SelectRole> {

  bool passengerSelection = false;
  bool driverSelection = false ;

  selectPassenger(){
    passengerSelection= true;
    driverSelection = false;
    setState(() {

    });
  }

  selectDriver(){
    passengerSelection= false;
    driverSelection = true;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        leading:CustomLeading(),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 0.6,
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
                  largeText(title: 'Choose Your Role',color: Colors.black),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RoleSelectionConatiner(title: 'Driver',onTap: (){
                        selectDriver();
                      },description: 'if you want to become the Driver tap on the driver button so you can fill the details',imagePath: driver,isSelected: driverSelection,),
                      RoleSelectionConatiner(title: 'Passenger',onTap: (){
                        selectPassenger();
                      },description: 'if you want to become the Driver tap on the driver button so you can fill the details',imagePath: pessenger,isSelected: passengerSelection,),
                    ],
                  ),
                  CustomButton(title: 'Next', onTap: (){
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=> Step1()));
                  },borderRadius: 30,width: 1,),
                  CustomSized(height: 0.03),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (context)=> LoginScreen()));
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
          )
        ],
      ),
    );
  }
}
