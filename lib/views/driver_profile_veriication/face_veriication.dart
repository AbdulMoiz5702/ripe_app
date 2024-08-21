import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/views/driver_profile_veriication/veiwing_proile.dart';
import '../../consts/colors.dart';
import '../../consts/images_path.dart';
import '../../controllers/become_driver_controller.dart';
import '../../resubale_widgets/CustomButton.dart';
import '../../resubale_widgets/Custom_Sized.dart';
import '../../resubale_widgets/text_widgets.dart';


class FaceVerificationScreen extends StatelessWidget {
  const FaceVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        automaticallyImplyLeading: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSized(height: 0.02),
            largeText(title: 'Face verification',color:theme.colorScheme.primary),
            CustomSized(height: 0.01),
            smallText(title: 'Please take a well-lit selfie to verify your',color: theme.colorScheme.onSecondaryContainer),
            CustomSized(height: 0.01),
            smallText(title: 'identity.',color: theme.colorScheme.onSecondaryContainer)
          ],
        ),
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Consumer<BecomeDriverProvider>(builder: (context,provider,_){
              return  GestureDetector(
                onTap: (){
                  provider.pickImage(imageType: 'facePictureImage');
                },
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.sizeOf(context).height * 0.56,
                  width:MediaQuery.sizeOf(context).width * 0.56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.colorScheme.surfaceContainerHighest,
                    image: provider.facePictureImage == null ?  null : DecorationImage(image: FileImage(File(provider.facePictureImage.toString())),fit: BoxFit.cover),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.camera_alt,color: provider.facePictureImage == null ? dividerColor : whiteColor,),
                      CustomSized(height: 0.002,),
                      smallText(title: 'Upload you photo',textSize: 11.0 , color: provider.facePictureImage == null ? dividerColor : whiteColor,),
                    ],
                  ),
                ),
              );
            }),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error,size: 20,color:theme.colorScheme.onSecondaryContainer),
                CustomSized(width: 0.02,),
                Expanded(
                  child: Text('Keep your face clearly visible in the circle and picture should not be blurry',style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: theme.colorScheme.onSecondaryContainer,
                    fontFamily:'Nunito Sans',
                  ),),
                ),
              ],
            ),
            CustomSized(height: 0.02),
            Consumer<BecomeDriverProvider>(builder: (context, provider, _) {
              return SecondaryAccessButton(
                titleColor: theme.primaryColor,
                color: theme.colorScheme.surfaceContainerHighest,
                isImagePath: true,
                imagePath: gallery,
                width:1 ,title: 'Retake', onTap: (){
                provider.pickImage(imageType: 'facePictureImage',isFaceVerification: true);
              },iconData: Icons.collections_outlined,borderRadius: 30,weight: FontWeight.w700,);
            }),
            CustomSized(height: 0.02),
         CustomButton(
           onBoard: false,
          width: 1,
          borderRadius: 30,
          title: 'Confirm',
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> VeiwingProile()));
          }),
          ],
        ),
      ),
    );
  }
}
