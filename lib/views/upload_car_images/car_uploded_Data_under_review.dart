import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/Bg_widget.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import '../../resubale_widgets/Custom_Sized.dart';
import '../../resubale_widgets/custom_leading.dart';

class CarUploadedDataUnderReview extends StatelessWidget {
  const CarUploadedDataUnderReview({super.key});

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
            height: MediaQuery.sizeOf(context).height * 0.7,
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
                  largeText(title: 'Thanks for waiting! We’re'),
                  CustomSized(height: 0.003),
                  largeText(title: ' checking your details.'),
                  CustomSized(height: 0.02),
                  smallText(title: 'We’ve collected all your data for verification'),
                  CustomSized(height: 0.003),
                  smallText(title: 'purposes. It’ll take a little time for us to verify your '),
                  CustomSized(height: 0.003),
                  smallText(title: 'profile. Be patient with us.'),
                  CustomSized(height: 0.03),
                  Align(alignment:Alignment.center,child: Image(image: AssetImage(underReview),height: MediaQuery.sizeOf(context).height * 0.25,)),
                  CustomSized(height: 0.03),
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
                          child: Text('Your profile is under review. You\'ll be notified shortly.',style: TextStyle(
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
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
