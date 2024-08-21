import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

class LicencePicturesButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final String  ? imagePath;
  const LicencePicturesButton({super.key, required this.title,required this.onTap,this.imagePath});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
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
            smallText(title: title, textSize: 12.0,weight: FontWeight.w700,color:theme.colorScheme.onSecondaryContainer ),
            const CustomSized(height: 0.008,),
            DottedBorder(
              borderType: BorderType.RRect,
              color: theme.colorScheme.surfaceBright.withOpacity(0.8),
              radius: Radius.circular(15),
              strokeWidth: 0.5,
              dashPattern: [5],
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.095,
                width: MediaQuery.sizeOf(context).width * 1,
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(15),
                  image: imagePath != null ?  DecorationImage(image: FileImage(File(imagePath.toString())),fit: BoxFit.contain): null
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.file_upload_outlined,color: dividerColor,size: 35,),
                    smallText(title: 'Upload file(jpg,png,pdf)', textSize: 11.0,color:theme.colorScheme.surfaceBright),
                  ],
                ),
              ),
            ),
            const CustomSized(height: 0.003,),
            Row(
              children: [
                const CustomSized(width: 0.02,height: 0,),
                const Icon(Icons.error,size: 20,),
                const CustomSized(width: 0.002,height: 0,),
                smallText(title: ' Max file size:2MB', textSize: 11.0,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
