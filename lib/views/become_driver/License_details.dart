import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/controllers/become_driver_controller.dart';
import 'package:ride_app/resubale_widgets/Bg_widget.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/band_name.dart';
import 'package:ride_app/views/become_driver/vechile_details.dart';

import '../../resubale_widgets/Custom_Sized.dart';
import '../../resubale_widgets/customTextFeild.dart';
import '../../resubale_widgets/custom_leading.dart';
import '../../resubale_widgets/licence_pictures_button.dart';
import '../../resubale_widgets/text_widgets.dart';


class LicenseDetailsScreen extends StatelessWidget {
  const LicenseDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BgWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading:CustomLeading(),
          backgroundColor: Colors.transparent,
        ),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.9,
            width: MediaQuery.sizeOf(context).width * 1,
            decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                )
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
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
                      height: 0.01,
                    ),
                    largeText(title: 'Driver’s ID & License',color: theme.primaryColor),
                    CustomSized(
                      height: 0.020,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 30,
                          decoration:  BoxDecoration(
                            shape: BoxShape.circle,
                            color: theme.colorScheme.secondary,
                          ),
                          child: largeText(title: '1',color: theme.scaffoldBackgroundColor,textSize: 14.0),
                        ),
                        Container(height:1 ,width: MediaQuery.sizeOf(context).width * 0.2,color: dividerColor,margin: EdgeInsets.symmetric(horizontal: 8),),
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: countContainerBackGround,
                          ),
                          child: largeText(title: '2',color: theme.colorScheme.onSecondaryContainer,textSize: 14.0),
                        ),
                        Container(height:1 ,width: MediaQuery.sizeOf(context).width * 0.2,color: dividerColor,margin: EdgeInsets.symmetric(horizontal: 8),),
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: countContainerBackGround
                          ),
                          child: largeText(title: '3',color: theme.colorScheme.onSecondaryContainer,textSize: 14.0),
                        ),
                      ],
                    ),
                    CustomSized(
                      height: 0.020,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          largeText(title: 'Licence details',textSize: 14.0,color: theme.colorScheme.primary),
                          largeText(title: 'Vehicle details',color: theme.colorScheme.surfaceBright,textSize: 14.0),
                          largeText(title: 'Car insurance',color: theme.colorScheme.surfaceBright,textSize: 14.0),
                        ],
                      ),
                    ),
                    CustomSized(
                      height: 0.020,
                    ),
                    CustomTextField(
                      controller: textController,
                      keyBoardType: TextInputType.emailAddress,
                      obscureText: false,
                      hint: 'Driver\'s license number',
                      onValidator: (value) {},
                      onFieldSubmittedValue: (value) {},
                      iconPath:driverLicenceNumber,
                    ),
                    CustomSized(height: 0.02),
                    CustomTextField(
                      controller: textController,
                      keyBoardType: TextInputType.emailAddress,
                      obscureText: false,
                      hint: 'Date of expire',
                      onValidator: (value) {},
                      onFieldSubmittedValue: (value) {},
                      iconData: Icons.calendar_today_outlined,
                    ),
                    CustomSized(
                      height: 0.020,
                    ),
                    Consumer<BecomeDriverProvider>(builder: (context,provider,_){
                      return LicencePicturesButton(title: 'Upload a picture car’s license plate',onTap: (){
                        provider.pickImage(imageType:'carLicencePlateImage');
                      },imagePath:provider.carLicencePlateImage,);
                    }),
                    CustomSized(height: 0.02),
                    Consumer<BecomeDriverProvider>(builder: (context,provider,_){
                      return LicencePicturesButton(title: 'Upload your driver’s license',onTap: (){
                        provider.pickImage(imageType:'drivingLicenceImage');
                      },imagePath: provider.drivingLicenceImage,);
                    }),
                    CustomSized(
                      height: 0.020,
                    ),
                    CustomButton(title: 'Next', onTap:(){
                      Navigator.push(context,CupertinoPageRoute(builder: (context)=> VehicleDetails()));
                    },width: 1,borderRadius: 30,),
                    CustomSized(height: 0.02),
                    Align(alignment:Alignment.center,child: largeText(title: 'Become a passenger instead',textSize: 15.0,color: dividerColor)),
                          
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
