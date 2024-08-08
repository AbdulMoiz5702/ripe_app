import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/customTextFeild.dart';
import 'package:ride_app/resubale_widgets/custom_leading.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _radioValue = 0;

  void _handleRadioValueChange(int? value) {
    setState(() {
      _radioValue = value ?? 0; // Handle null safety for _radioValue
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        // backgroundColor: theme.appBarTheme
        leading: CustomLeading(
          isHome: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: DottedBorder(

                      padding: EdgeInsets.zero,
                      borderType: BorderType.RRect,
                      radius: Radius.circular(500),
                      dashPattern: [6, 2],
                      color: theme.colorScheme.onSecondaryContainer.withOpacity(0.4),
                      strokeWidth: 1.5,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.469,
                        height: MediaQuery.of(context).size.height * 0.21,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500),

                          border: Border.all(
                            color: theme.colorScheme.inverseSurface,
                            width: 10,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(500),
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/chatgirlimage.png',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                              // Container(
                              //     color: theme.colorScheme.onPrimaryFixed
                              //         .withOpacity(0.75)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 70,
                    top: 70,
                    child:
                        SvgPicture.asset('assets/svg_pictures/camericon.svg', color: theme.colorScheme.inversePrimary,),
                  ),
                  Positioned(
                    left: 50,
                    top: 103,
                    child: normalText(
                      textSize: 11.0,
                      color: theme.colorScheme.inversePrimary,
                      title: 'Update Photo',
                    ),
                  ),
                ],
              ),
            ),

            OutlineCustomTextField(

                controller: textController,
                keyBoardType: TextInputType.text,
                svgs: profileSVG,
                label: 'Full Name',

                hint: '',
              onValidator: (value) {},
              onFieldSubmittedValue: (value) {},

            ),


            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 24.0, top: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: normalText(title: 'Gender', textSize: 12.0, color: theme.colorScheme.primaryFixed,),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: <Widget>[
                          Radio<int>(

                            activeColor: theme.colorScheme.secondary,
                            value: 0,
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange,

                          ),
                          normalText(title: 'Male', textSize: 14.0, color: theme.colorScheme.primary, weight: FontWeight.w400),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<int>(
                            activeColor: theme.colorScheme.secondary,
                            value: 1,
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange,
                          ),
                          normalText(title: 'Female', textSize: 14.0, color: theme.colorScheme.primary, weight: FontWeight.w400),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<int>(
                            activeColor: theme.colorScheme.secondary,
                            value: 2,
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange,
                          ),
                          normalText(title: 'Other', textSize: 14.0, color: theme.colorScheme.primary, weight: FontWeight.w400),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            OutlineCustomTextField(

                controller: textController,
                keyBoardType: TextInputType.text,
                svgs: callSVG,
                label: 'Mobile Number',
                hint: '',
              onValidator: (value) {},
              onFieldSubmittedValue: (value) {},

            ),
            OutlineCustomTextField(

                controller: textController,
                keyBoardType: TextInputType.text,
                svgs: mailSVG,
                label: 'Email',
              weightSVG: 15.0,
              heightSVG: 15.0,
                hint: '',
              onValidator: (value) {},
              onFieldSubmittedValue: (value) {},

            ),
            OutlineCustomTextField(

                controller: textController,
                keyBoardType: TextInputType.text,

                svgs: calenderSVG,
                label: 'Date of Birth',
                weightSVG: 15.0,
                heightSVG: 15.0,
                hint: '',
              onValidator: (value) {},
              onFieldSubmittedValue: (value) {},

            ),
            CustomSized(
              height: 0.15,
            ),
            SecondaryCustomButton(
              onBoard: false,
              // isImagePath: false,
              widthbetweentextandicon: 0.0,

              title: 'Update Changes',

              onTap: () {
                Navigator.pop(context);
              },
              titleColor: theme.colorScheme.inversePrimary,
              width: 0.9,
              borderRadius: 24,
              color: theme.primaryColor,
              // weight: ,
            ),
          ],
        ),
      ),
    );
  }
}
