import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/consts/images_path.dart';


import '../../consts/colors.dart';
import '../../controllers/become_driver_controller.dart';
import '../../resubale_widgets/CustomButton.dart';
import '../../resubale_widgets/Custom_Sized.dart';
import '../../resubale_widgets/text_widgets.dart';
import 'upload_car_Back_interior_image.dart';



class UploadFrontInteriorImage extends StatelessWidget {
  const UploadFrontInteriorImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        automaticallyImplyLeading: true,
        title: largeText(title: 'Front interior image'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<BecomeDriverProvider>(builder: (context, provider, _) {
              return Container(
                height: MediaQuery.sizeOf(context).height * 0.35,
                width: MediaQuery.sizeOf(context).width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: provider.carFrontSeatsImagePath == null
                          ? AssetImage(carFrontSeats)
                          : FileImage(
                          File(provider.carFrontSeatsImagePath.toString()))
                      as ImageProvider,
                      fit: BoxFit.cover),
                ),
              );
            }),
            CustomSized(),
            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(20),
              height: MediaQuery.sizeOf(context).height * 0.11,
              width: MediaQuery.sizeOf(context).width * 1,
              decoration: BoxDecoration(
                color: secondayBlueColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.error,
                    size: 25,
                    color: darkBlueColor,
                  ),
                  CustomSized(
                    width: 0.02,
                  ),
                  Expanded(
                    child: Text(
                      'Capture image like this from the side angle.',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: darkBlueColor,
                        fontFamily: 'Nunito Sans',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Consumer<BecomeDriverProvider>(builder: (context, provider, _) {
              return Column(
                children: [
                  LocationAccessButton(
                    width: 1,
                    height: 0.07,
                    title: provider.carFrontSeatsImagePath == null
                        ? 'Upload from gallery'
                        : 'Retake',
                    onTap: () {
                      provider.pickImage(
                        imageType: 'carFrontSeatsImagePath',
                      );
                    },
                    iconData: Icons.collections_outlined,
                    titleColor: primaryTextColor,
                    borderRadius: 30,
                    color: secondaryWhiteColor,
                    weight: FontWeight.w700,
                  ),
                  CustomSized(height: 0.02),
                  provider.carFrontSeatsImagePath == null
                      ? LocationAccessButton(
                    width: 1,
                    height: 0.07,
                    title:'Camera',
                    onTap: () {
                      provider.pickImage(
                          imageType: 'carFrontSeatsImagePath',
                          isFaceVerification: true);
                    },
                    iconData: Icons.camera_alt,
                    borderRadius: 30,
                    color: buttonColor,
                    weight: FontWeight.w700,
                  )
                      : CustomButton(
                      onBoard: false,
                      width: 1,
                      height: 0.07,
                      borderRadius: 30,
                      title: 'Confirm',
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => UploadCarBackInteriorImage()));
                      }),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
