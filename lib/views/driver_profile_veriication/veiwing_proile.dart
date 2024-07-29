import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/Bg_widget.dart';
import 'package:ride_app/resubale_widgets/band_name.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import '../../resubale_widgets/CustomButton.dart';
import '../../resubale_widgets/Custom_Sized.dart';
import '../../resubale_widgets/custom_leading.dart';
import '../upload_car_images/verifiy_images_instruction_screen.dart';


class VeiwingProile extends StatelessWidget {
  const VeiwingProile({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BgWidget(child:Scaffold(
      appBar: AppBar(
        leading:CustomLeading(),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.transparent,
      body:Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 0.802,
            width: MediaQuery.sizeOf(context).width * 1,
            decoration:  BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:  Radius.circular(20),),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BrandName(theme: theme),
                  CustomSized(height: 0.02),
                  largeText(title: 'Hang tight! We’re verifying',color:theme.colorScheme.primary),
                  CustomSized(height: 0.003),
                  largeText(title: 'your profile.',color:theme.colorScheme.primary),
                  CustomSized(height: 0.01),
                  smallText(title: 'Your account verification as a driver has been',color: theme.colorScheme.onSecondaryContainer),
                  CustomSized(height: 0.003),
                  smallText(title: 'completed successfully. It will take a few minutes',color: theme.colorScheme.onSecondaryContainer),
                  CustomSized(height: 0.003),
                  smallText(title: 'to verify your account and you’ll be notified soon. ',color: theme.colorScheme.onSecondaryContainer),
                  CustomSized(height: 0.003),
                  smallText(title: 'Meanwhile, you may set-up  your profile.',color: theme.colorScheme.onSecondaryContainer),
                  Align(alignment:Alignment.center,child: Image(image: AssetImage(check),height: MediaQuery.sizeOf(context).height * 0.25,)),
                  Container(
                    padding: EdgeInsets.all(15),
                    height: MediaQuery.sizeOf(context).height * 0.1,
                    width: MediaQuery.sizeOf(context).width * 1,
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error,size: 25,color: theme.canvasColor,),
                        CustomSized(width: 0.02,),
                        Expanded(
                          child: Text('Almost there! Your profile is being reviewed.',style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: theme.canvasColor,
                            fontFamily:'Nunito Sans',
                          ),),
                        ),
                      ],
                    ),
                  ),
                  CustomSized(height: 0.03),
                  CustomButton(
                      width: 1,
                      borderRadius: 30,
                      title: 'Upload car images',
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> VerifyImagesInstructionScreen()));
                      }),
                  CustomSized(height: 0.002),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error,size: 20,color: theme.colorScheme.onSecondaryContainer,),
                      CustomSized(width: 0.02,),
                      Expanded(
                        child: Text('We\'re almost there. Your profile is shaping up nicely!',style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: theme.colorScheme.onSecondaryContainer,
                          fontFamily:'Nunito Sans',
                        ),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
