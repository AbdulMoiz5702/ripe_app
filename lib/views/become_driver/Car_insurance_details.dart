import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/band_name.dart';
import '../../consts/colors.dart';
import '../../controllers/become_driver_controller.dart';
import '../../resubale_widgets/Bg_widget.dart';
import '../../resubale_widgets/CustomButton.dart';
import '../../resubale_widgets/Custom_Sized.dart';
import '../../resubale_widgets/custom_leading.dart';
import '../../resubale_widgets/cutom_leading text_feild.dart';
import '../../resubale_widgets/licence_pictures_button.dart';
import '../../resubale_widgets/text_widgets.dart';
import '../driver_profile_veriication/profile_pictures.dart';


class CarInsuranceDetailsScreen extends StatelessWidget {
  const CarInsuranceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BgWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading:CustomLeading(),
          backgroundColor: Colors.transparent,
        ),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.75,
            width: MediaQuery.sizeOf(context).width * 1,
            decoration: BoxDecoration(
                color:theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                )
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSized(
                      height: 0.020,
                    ),
                    BrandName(theme: theme),
                    CustomSized(
                      height: 0.020,
                    ),
                    largeText(title: 'Car insurance details',color: theme.primaryColor),
                    CustomSized(
                      height: 0.020,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 30,
                          decoration:  BoxDecoration(
                            shape: BoxShape.circle,
                            color: theme.colorScheme.surfaceContainerLow,
                          ),
                          child: Icon(Icons.check,color: theme.colorScheme.secondary,),
                        ),
                        Container(height:1 ,width: MediaQuery.sizeOf(context).width * 0.2,color: dividerColor,margin: EdgeInsets.symmetric(horizontal: 8),),
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 30,
                          decoration:  BoxDecoration(
                              shape: BoxShape.circle,
                              color: theme.colorScheme.surfaceContainerLow
                          ),
                          child: Icon(Icons.check,color: theme.colorScheme.secondary,),
                        ),
                        Container(height:1 ,width: MediaQuery.sizeOf(context).width * 0.2,color: dividerColor,margin: EdgeInsets.symmetric(horizontal: 8),),
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 30,
                          decoration:  BoxDecoration(
                              shape: BoxShape.circle,
                              color: theme.colorScheme.secondary,
                          ),
                          child: largeText(title: '3',color: theme.scaffoldBackgroundColor,textSize: 14.0),
                        ),
                      ],
                    ),
                    CustomSized(
                      height: 0.020,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          largeText(title: 'Licence details',textSize: 14.0,color:theme.colorScheme.primary ),
                          largeText(title: 'Vehicle details',textSize: 14.0,color:theme.colorScheme.primary ),
                          largeText(title: 'Car insurance',textSize: 14.0,color:theme.colorScheme.primary),
                        ],
                      ),
                    ),
                    CustomSized(
                      height: 0.020,
                    ),
                    CustomLeadingTextField(
                      controller: textController,
                      keyBoardType: TextInputType.emailAddress,
                      obscureText: false,
                      hint: 'Car insurance number',
                      onValidator: (value) {},
                      onFieldSubmittedValue: (value) {},
                      iconPath: hash,
                    ),
                    CustomSized(height: 0.023),
                    CustomLeadingTextField(
                      isHintChange: true,
                      leadingText: 'Date of issue',
                      controller: textController,
                      keyBoardType: TextInputType.emailAddress,
                      obscureText: false,
                      hint: 'dd/mm/yyyy',
                      onValidator: (value) {},
                      onFieldSubmittedValue: (value) {},
                      iconData: Icons.calendar_today_outlined,
                    ),
                    CustomSized(
                      height: 0.023,
                    ),
                    CustomLeadingTextField(
                      isHintChange: true,
                      leadingText: 'Date of expire',
                      controller: textController,
                      keyBoardType: TextInputType.emailAddress,
                      obscureText: false,
                      hint: 'dd/mm/yyyy',
                      onValidator: (value) {},
                      onFieldSubmittedValue: (value) {},
                      iconData: Icons.calendar_today_outlined,
                    ),
                    CustomSized(
                      height: 0.023,
                    ),
                    Consumer<BecomeDriverProvider>(builder: (context,provider,_){
                      return LicencePicturesButton(title: 'Upload your car insurance form',onTap: (){
                        provider.pickImage(imageType:'insuranceShipFormImage');
                      },imagePath: provider.insuranceShipFormImage.toString(),);
                    }),
                    CustomSized(height: 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SecondaryCustomButton(
                          titleColor: theme.colorScheme.primary,
                          color: theme.colorScheme.surfaceContainerHighest,
                          title: 'Back',onBoard: false, onTap:(){
                          Navigator.pop(context);
                        },width: 0.27,borderRadius: 30,),
                        CustomButton(
                          onBoard: false,
                          title: 'Submit', onTap:(){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=> ProfilePictureScreen()));
                        },width: 0.55,borderRadius: 30,),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
