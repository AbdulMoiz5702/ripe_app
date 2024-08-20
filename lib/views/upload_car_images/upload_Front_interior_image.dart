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
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: largeText(title: 'Front interior image',color:theme.colorScheme.primary),
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
            CustomSized(height: 0.002,),
            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              height: MediaQuery.sizeOf(context).height * 0.12,
              width: MediaQuery.sizeOf(context).width * 1,
              decoration: BoxDecoration(
                color:  theme.cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CustomSized(
                        height: 0.01,
                        width: 0,
                      ),
                      Icon(
                        Icons.error,
                        size: 27,
                        color: theme.canvasColor,
                      ),
                    ],
                  ),
                  CustomSized(
                    width: 0.03,
                  ),
                  Expanded(
                    child: Text(
                      'Capture image like this from the    side angle.',
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.7,
                        fontWeight: FontWeight.w400,
                        color: theme.canvasColor,
                        fontFamily: 'Nunito Sans',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomSized(),
            Consumer<BecomeDriverProvider>(builder: (context, provider, _) {
              return Column(
                children: [
                  SecondaryAccessButton(
                    titleColor: theme.primaryColor,
                    color: theme.colorScheme.surfaceContainerHighest,
                    width: 1,
                    title: provider.carFrontSeatsImagePath == null
                        ? 'Upload from gallery'
                        : 'Retake',
                    onTap: () {
                      provider.pickImage(
                        imageType: 'carFrontSeatsImagePath',
                      );
                    },
                    iconData: Icons.collections_outlined,
                    borderRadius: 30,
                    weight: FontWeight.w700,
                  ),
                  CustomSized(height: 0.02),
                  provider.carFrontSeatsImagePath == null
                      ? SecondaryAccessButton(
                    color: theme.primaryColor,
                    titleColor: theme.colorScheme.inversePrimary,
                    width: 1,
                    title:'Camera',
                    onTap: () {
                      provider.pickImage(
                          imageType: 'carFrontSeatsImagePath',
                          isFaceVerification: true);
                    },
                    iconData: Icons.camera_alt,
                    borderRadius: 30,
                    weight: FontWeight.w700,
                  )
                      : CustomButton(
                      onBoard: false,
                      width: 1,
                      borderRadius: 30,
                      title: 'Confirm',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
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
