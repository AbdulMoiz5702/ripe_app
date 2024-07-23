import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

class LicencePicturesButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final String  ? imagePath;
  const LicencePicturesButton({required this.title,required this.onTap,this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.155,
        width: MediaQuery.sizeOf(context).width * 1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            smallText(title: title, textSize: 12.0,weight: FontWeight.w700),
            CustomSized(height: 0.008,),
            Container(
              height: MediaQuery.sizeOf(context).height * 0.1,
              width: MediaQuery.sizeOf(context).width * 1,
              decoration: BoxDecoration(
                color: secondaryWhiteColor,
                borderRadius: BorderRadius.circular(10),
                image: imagePath != null ?  DecorationImage(image: FileImage(File(imagePath.toString())),fit: BoxFit.contain): null
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.file_upload_outlined,color: dividerColor,size: 35,),
                  smallText(title: 'Upload file(jpg,png,pdf)', textSize: 11.0,),
                ],
              ),
            ),
            CustomSized(height: 0.002,),
            Row(
              children: [
                Icon(Icons.error,size: 20,),
                smallText(title: ' Max file size:2MB', textSize: 11.0,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
