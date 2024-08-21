import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/controllers/become_driver_controller.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import 'package:ride_app/views/upload_car_images/upload_front_image.dart';


class VerifyImagesInstructionScreen extends StatelessWidget {
  const VerifyImagesInstructionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: largeText(title: 'Vehicle images',color: theme.primaryColor),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                smallText(title: '🔆  Capture images in a well-lit area with indirect',color: theme.primaryColor),
                CustomSized(height: 0.01),
                smallText(title: '       light. Avoid harsh shadows or glares.',color: theme.primaryColor)
              ],
            ),
          ),
          CustomSized(height: 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:List.generate(30, (index){
              return Text('_ ',style: TextStyle(color: dividerColor),);
            }),
          ),
          CustomSized(height: 0.01),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSized(height: 0.005,),
                smallText(title: '🚘  Include only the vehicle in the frame—no other ',color: theme.primaryColor),
                CustomSized(height: 0.01),
                smallText(title: '       objects or people.',color: theme.primaryColor)
              ],
            ),
          ),
          CustomSized(height: 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:List.generate(30, (index){
              return Text('_ ',style: TextStyle(color: dividerColor),);
            }),
          ),
          CustomSized(height: 0.01),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                smallText(title: '🧐  Ensure the entire vehicle is visible, including',color: theme.primaryColor),
                CustomSized(height: 0.01),
                smallText(title: '       license plates.',color: theme.primaryColor)
              ],
            ),
          ),
          CustomSized(height: 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:List.generate(30, (index){
              return Text('_ ',style: TextStyle(color: dividerColor),);
            }),
          ),
          CustomSized(height: 0.01),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                smallText(title: '📐  Take photos from different angles (front, back,',color: theme.primaryColor),
                CustomSized(height: 0.01),
                smallText(title: '        sides).',color: theme.primaryColor)
              ],
            ),
          ),
          CustomSized(height: 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:List.generate(30, (index){
              return Text('_ ',style: TextStyle(color: dividerColor),);
            }),
          ),
          CustomSized(height: 0.01),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                smallText(title: '😵  Allow your camera to focus before capturing',color: theme.primaryColor),
                CustomSized(height: 0.01),
                smallText(title: '        the image to avoid bluriness.',color: theme.primaryColor)
              ],
            ),
          ),
          CustomSized(height: 0.004,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:List.generate(30, (index){
              return Text('_ ',style: TextStyle(color: dividerColor),);
            }),
          ),
          CustomSized(),
          Consumer<BecomeDriverProvider>(builder: (context,provider,_){
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                          activeColor: theme.colorScheme.secondary,
                          value: provider.value, onChanged: (value){
                        provider.changeValue(value);
                      }),
                      CustomSized(width: 0.02,),
                      smallText(title: 'I\'ve read all the instructions.',color: theme.primaryColor),
                    ],
                  ),
                  CustomSized(height: 0.004,),
                  SecondaryCustomButton(title: 'Continue', onTap: (){
                    if( provider.value == true){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> UploadFrontImageScreen()));
                    }else{

                    }
                  },borderRadius: 30,titleColor: provider.value == true ? theme.colorScheme.inversePrimary : theme.colorScheme.onSecondaryContainer,color: provider.value == true ?  theme.primaryColor  : theme.colorScheme.surfaceContainerHighest,width: 1,),
                  CustomSized(width: 0.02,),
                ],
              ),
            );
          })
        ],
      ),
    );
  }

}
