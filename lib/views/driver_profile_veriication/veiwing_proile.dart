import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/Bg_widget.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

import '../../resubale_widgets/CustomButton.dart';
import '../../resubale_widgets/Custom_Sized.dart';
import '../../resubale_widgets/custom_leading.dart';
import '../upload_car_images/verifiy_images_instruction_screen.dart';


class VeiwingProile extends StatelessWidget {
  const VeiwingProile({super.key});

  @override
  Widget build(BuildContext context) {
    return BgWidget(child:Scaffold(
      appBar: AppBar(
        leading:CustomLeading(),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.transparent,
      body:Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 0.8,
            width: MediaQuery.sizeOf(context).width * 1,
            decoration: const BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:  Radius.circular(20),),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
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
                  CustomSized(height: 0.02),
                  largeText(title: 'Hang tight! We’re verifying'),
                  CustomSized(height: 0.003),
                  largeText(title: 'your profile.'),
                  CustomSized(height: 0.02),
                  smallText(title: 'Your account verification as a driver has been'),
                  CustomSized(height: 0.003),
                  smallText(title: 'completed successfully. It will take a few minutes'),
                  CustomSized(height: 0.003),
                  smallText(title: 'to verify your account and you’ll be notified soon. '),
                  CustomSized(height: 0.003),
                  smallText(title: 'Meanwhile, you may set-up  your profile.'),
                  Align(alignment:Alignment.center,child: Image(image: AssetImage(check),height: MediaQuery.sizeOf(context).height * 0.25,)),
                  Container(
                    padding: EdgeInsets.all(15),
                    height: MediaQuery.sizeOf(context).height * 0.1,
                    width: MediaQuery.sizeOf(context).width * 1,
                    decoration: BoxDecoration(
                      color: secondayBlueColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error,size: 25,color: darkBlueColor,),
                        CustomSized(width: 0.02,),
                        Expanded(
                          child: Text('Almost there! Your profile is being reviewed.',style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: darkBlueColor,
                            fontFamily:'Nunito Sans',
                          ),),
                        ),
                      ],
                    ),
                  ),
                  CustomSized(height: 0.03),
                  CustomButton(
                      width: 1,
                      borderRadius: 30,
                      title: 'Upload car images',
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> VerifyImagesInstructionScreen()));
                      }),
                  CustomSized(height: 0.002),
                  const  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error,size: 20,),
                      CustomSized(width: 0.02,),
                      Expanded(
                        child: Text('We\'re almost there. Your profile is shaping up nicely!',style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: secondaryTextColor,
                          fontFamily:'Nunito Sans',
                        ),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
