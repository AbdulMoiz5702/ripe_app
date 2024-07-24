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
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        automaticallyImplyLeading: true,
        title: largeText(title: 'Vehicle images'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                smallText(title: '🔆  Capture images in a well-lit area with indirect',color: primaryTextColor),
                const CustomSized(height: 0.002,),
                smallText(title: '       light. Avoid harsh shadows or glares.',color: primaryTextColor)
              ],
            ),
          ),
          const CustomSized(height: 0.004,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:List.generate(30, (index){
              return const Text('_ ',style: TextStyle(color: dividerColor),);
            }),
          ),
          const CustomSized(height: 0.006,),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomSized(height: 0.005,),
                smallText(title: '🚘  Include only the vehicle in the frame—no other ',color: primaryTextColor),
                const CustomSized(height: 0.002,),
                smallText(title: '       objects or people.',color: primaryTextColor)
              ],
            ),
          ),
          const CustomSized(height: 0.004,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:List.generate(30, (index){
              return const Text('_ ',style: TextStyle(color: dividerColor),);
            }),
          ),
          const CustomSized(height: 0.006,),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                smallText(title: '🧐  Ensure the entire vehicle is visible, including',color: primaryTextColor),
                const CustomSized(height: 0.002,),
                smallText(title: '       license plates.',color: primaryTextColor)
              ],
            ),
          ),
          const CustomSized(height: 0.004,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:List.generate(30, (index){
              return const Text('_ ',style: TextStyle(color: dividerColor),);
            }),
          ),
          const CustomSized(height: 0.006,),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                smallText(title: '📐  Take photos from different angles (front, back,.',color: primaryTextColor),
                const CustomSized(height: 0.002,),
                smallText(title: '        sides)',color: primaryTextColor)
              ],
            ),
          ),
          const CustomSized(height: 0.004,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:List.generate(30, (index){
              return const Text('_ ',style: TextStyle(color: dividerColor),);
            }),
          ),
          const CustomSized(height: 0.006,),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                smallText(title: '😵  Allow your camera to focus before capturing',color: primaryTextColor),
                const CustomSized(height: 0.002,),
                smallText(title: '        the image to avoid bluriness.',color: primaryTextColor)
              ],
            ),
          ),
          const CustomSized(height: 0.004,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:List.generate(30, (index){
              return const Text('_ ',style: TextStyle(color: dividerColor),);
            }),
          ),
          const CustomSized(),
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
                          activeColor: checkBoxColor,
                          value: provider.value, onChanged: (value){
                        provider.changeValue(value);
                      }),
                      const CustomSized(width: 0.02,),
                      smallText(title: 'I\'ve read all the instructions.',color: primaryTextColor),
                    ],
                  ),
                  const CustomSized(height: 0.004,),
                  CustomButton(title: 'Continue', onTap: (){
                    if( provider.value == true){
                      Navigator.push(context, CupertinoPageRoute(builder: (context)=> const UploadFrontImageScreen()));
                    }else{

                    }
                  },borderRadius: 30,height: 0.07,titleColor: provider.value == true ? whiteColor : dividerColor,color: provider.value == true ? buttonColor : secondaryWhiteColor,width: 1,),
                ],
              ),
            );
          })
        ],
      ),
    );
  }

}
