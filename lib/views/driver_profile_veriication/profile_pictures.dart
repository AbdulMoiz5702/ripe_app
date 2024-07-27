import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/controllers/become_driver_controller.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

import 'face_veriication.dart';

class ProfilePictureScreen extends StatelessWidget {
  const ProfilePictureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSized(height: 0.02),
            largeText(title: 'Add profile picture',color:theme.colorScheme.primary),
            smallText(title: 'This image will be displayed on your profile',color: theme.colorScheme.onSecondaryContainer)
          ],
        ),
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Consumer<BecomeDriverProvider>(builder: (context, provider, _) {
              return Container(
                alignment: Alignment.center,
                height: MediaQuery.sizeOf(context).height * 0.6,
                width: MediaQuery.sizeOf(context).width * 0.6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: theme.colorScheme.surfaceContainerHighest),
                ),
                child: GestureDetector(
                  onTap: () {
                    provider.pickImage(imageType: 'profilePictureImage');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.sizeOf(context).height * 0.55,
                    width: MediaQuery.sizeOf(context).width * 0.55,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.colorScheme.surfaceContainerHighest,
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
                          Icons.camera_alt_rounded,
                          color: provider.profilePictureImage == null
                              ? dividerColor
                              : whiteColor,
                        ),
                        CustomSized(
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
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error,
                  size: 20,
                  color:theme.colorScheme.onSecondaryContainer,
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
                      color: theme.colorScheme.onSecondaryContainer,
                      fontFamily: 'Nunito Sans',
                    ),
                  ),
                ),
              ],
            ),
            CustomSized(height: 0.02),
            Consumer<BecomeDriverProvider>(builder: (context, provider, _) {
              return SecondaryAccessButton(
                isImagePath: true,
                imagePath: gallery,
                width: 1,
                title: 'Upload from gallery',
                onTap: () {
                  provider.pickImage(imageType: 'profilePictureImage',);
                },
                iconData: Icons.collections_outlined,
                titleColor: theme.primaryColor,
                color: theme.colorScheme.surfaceContainerHighest,
                borderRadius: 30,
                weight: FontWeight.w700,
              );
            }),
            CustomSized(height: 0.02),
            Consumer<BecomeDriverProvider>(builder: (context, provider, _) {
              return provider.profilePictureImage == null
                  ? SecondaryAccessButton(
                      color: theme.primaryColor,
                      isImagePath: true,
                      width: 1,
                      title: 'Camera',
                      onTap: () {
                        provider.pickImage(imageType: 'profilePictureImage',
                            isFaceVerification: true);
                      },
                      iconData: Icons.photo_camera_outlined,
                      titleColor: theme.colorScheme.inversePrimary,
                      borderRadius: 30,
                      weight: FontWeight.w700,
                    ): CustomButton(
                  width: 1,
                  borderRadius: 30,
                  title: 'Next',
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> FaceVerificationScreen()));
                  });
            }),
          ],
        ),
      ),
    );
  }
}
