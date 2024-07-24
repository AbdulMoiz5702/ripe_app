import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/views/become_driver/Car_insurance_details.dart';
import '../../consts/colors.dart';
import '../../controllers/become_driver_controller.dart';
import '../../resubale_widgets/Bg_widget.dart';
import '../../resubale_widgets/CustomButton.dart';
import '../../resubale_widgets/Custom_Sized.dart';
import '../../resubale_widgets/custom_leading.dart';
import '../../resubale_widgets/cutom_leading text_feild.dart';
import '../../resubale_widgets/licence_pictures_button.dart';
import '../../resubale_widgets/text_widgets.dart';


class VehicleDetails extends StatelessWidget {
  const VehicleDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BgWidget(
      child: Scaffold(
        appBar: AppBar(
          leading:const CustomLeading(),
          backgroundColor: Colors.transparent,
        ),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.75,
            width: MediaQuery.sizeOf(context).width * 1,
            decoration: const BoxDecoration(
                color: Colors.white,
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
                    const CustomSized(
                      height: 0.020,
                    ),
                    RichText(
                        text: const TextSpan(children: [
                          TextSpan(
                              text: 'Logo',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0)),
                          TextSpan(
                              text: 'ipsum',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0))
                        ])),
                    const CustomSized(
                      height: 0.020,
                    ),
                    largeText(title: 'Vehicle details',),
                    const CustomSized(
                      height: 0.020,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: checkColor,
                          ),
                          child: const Icon(Icons.check,color: checkBoxColor,),
                        ),
                        Container(height:1 ,width: MediaQuery.sizeOf(context).width * 0.2,color: dividerColor,margin: const EdgeInsets.symmetric(horizontal: 8),),
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: checkBoxColor
                          ),
                          child: largeText(title: '2',color: whiteColor,textSize: 14.0),
                        ),
                        Container(height:1 ,width: MediaQuery.sizeOf(context).width * 0.2,color: dividerColor,margin: const EdgeInsets.symmetric(horizontal: 8),),
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: dividerColor
                          ),
                          child: largeText(title: '3',color: whiteColor,textSize: 14.0),
                        ),
                      ],
                    ),
                    const CustomSized(
                      height: 0.020,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          largeText(title: 'Licence details',textSize: 14.0),
                          largeText(title: 'Vehicle details',textSize: 14.0),
                          largeText(title: 'Car insurance',color: dividerColor,textSize: 14.0),
                        ],
                      ),
                    ),
                    const CustomSized(
                      height: 0.020,
                    ),
                    CustomLeadingTextField(
                      controller: controller,
                      keyBoardType: TextInputType.emailAddress,
                      obscureText: false,
                      hint: 'Car Number',
                      onValidator: (value) {
                        return null;
                      },
                      onFieldSubmittedValue: (value) {},
                      iconData: Icons.commute_outlined,
                    ),
                    const CustomSized(height: 0.023),
                    CustomLeadingTextField(
                      controller: controller,
                      keyBoardType: TextInputType.emailAddress,
                      obscureText: false,
                      hint: 'Car ownership form Number',
                      onValidator: (value) {
                        return null;
                      },
                      onFieldSubmittedValue: (value) {},
                      iconData: Icons.calendar_today_outlined,
                    ),
                    const CustomSized(
                      height: 0.023,
                    ),
                    CustomLeadingTextField(
                      controller: controller,
                      keyBoardType: TextInputType.emailAddress,
                      obscureText: false,
                      hint: 'Date of expire',
                      onValidator: (value) {
                        return null;
                      },
                      onFieldSubmittedValue: (value) {},
                      iconData: Icons.calendar_today_outlined,
                    ),
                    const CustomSized(
                      height: 0.023,
                    ),
                    Consumer<BecomeDriverProvider>(builder: (context,provider,_){
                      return LicencePicturesButton(title: 'Upload your car ownership form',onTap: (){
                        provider.pickImage(imageType:'ownerShipFormImage');
                      },imagePath: provider.ownerShipFormImage.toString(),);
                    }),

                    const CustomSized(height: 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          titleColor: primaryTextColor,
                          color: secondaryWhiteColor,
                          title: 'Back',onBoard: false, onTap:(){
                          Navigator.pop(context);
                        },width: 0.27,borderRadius: 30,),
                        CustomButton(title: 'Next', onTap:(){
                          Navigator.push(context,CupertinoPageRoute(builder: (context)=> const CarInsuranceDetailsScreen()));
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
