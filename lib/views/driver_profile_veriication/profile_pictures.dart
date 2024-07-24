import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/controllers/become_driver_controller.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

import 'face_veriication.dart';

class ProfilePictureScreen extends StatelessWidget {
  const ProfilePictureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSized(height: 0.02),
            largeText(title: 'Add profile picture'),
            smallText(title: 'This image will be displayed on your profile')
          ],
        ),
      ),
      backgroundColor: whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Consumer<BecomeDriverProvider>(builder: (context, provider, _) {
              return Container(
                alignment: Alignment.center,
                height: MediaQuery.sizeOf(context).height * 0.55,
                width: MediaQuery.sizeOf(context).width * 0.55,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: secondaryWhiteColor),
                ),
                child: GestureDetector(
                  onTap: () {
                    provider.pickImage(imageType: 'profilePictureImage');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.sizeOf(context).height * 0.5,
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: secondaryWhiteColor,
                      image: provider.profilePictureImage == null
                          ? null
                          : DecorationImage(
                              image: FileImage(File(
                                  provider.profilePictureImage.toString())),
                              fit: BoxFit.cover),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.camera_enhance,
                          color: provider.profilePictureImage == null
                              ? dividerColor
                              : whiteColor,
                        ),
                        const CustomSized(
                          height: 0.002,
                        ),
                        smallText(
                          title: 'Upload you photo',
                          textSize: 11.0,
                          color: provider.profilePictureImage == null
                              ? dividerColor
                              : whiteColor,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error,
                  size: 20,
                ),
                CustomSized(
                  width: 0.02,
                ),
                Expanded(
                  child: Text(
                    'Your face must be clearly visible and image must not be too far or too closed',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: secondaryTextColor,
                      fontFamily: 'Nunito Sans',
                    ),
                  ),
                ),
              ],
            ),
            const CustomSized(height: 0.02),
            Consumer<BecomeDriverProvider>(builder: (context, provider, _) {
              return LocationAccessButton(
                width: 1,
                height: 0.07,
                title: 'Upload from gallery',
                onTap: () {
                  provider.pickImage(imageType: 'profilePictureImage',);
                },
                iconData: Icons.collections_outlined,
                titleColor: primaryTextColor,
                borderRadius: 30,
                color: secondaryWhiteColor,
                weight: FontWeight.w700,
              );
            }),
            const CustomSized(height: 0.02),
            Consumer<BecomeDriverProvider>(builder: (context, provider, _) {
              return provider.profilePictureImage == null
                  ? LocationAccessButton(
                      width: 1,
                      height: 0.07,
                      title: 'Camera',
                      onTap: () {
                        provider.pickImage(
                            imageType: 'profilePictureImage',
                            isFaceVerification: true);
                      },
                      iconData: Icons.photo_camera_outlined,
                      titleColor: whiteColor,
                      borderRadius: 30,
                      weight: FontWeight.w700,
                    ): CustomButton(
                  width: 1,
                  height: 0.07,
                  borderRadius: 30,
                  title: 'Next',
                  onTap: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=> const FaceVerificationScreen()));
                  });
            }),
          ],
        ),
      ),
    );
  }
}
