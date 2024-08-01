import 'package:flutter/material.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/Bg_widget.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/band_name.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import 'package:ride_app/views/bottom_screen/Main_bottom_Screen.dart';
import '../../resubale_widgets/Custom_Sized.dart';
import '../../resubale_widgets/custom_leading.dart';

class VerificationNotSuccessful extends StatelessWidget {
  const VerificationNotSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BgWidget(
        child: Scaffold(
          appBar: AppBar(
            leading: const CustomLeading(),
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.74,
                width: MediaQuery.sizeOf(context).width * 1,
                decoration:  BoxDecoration(
                  color: theme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BrandName(theme: theme),
                      const CustomSized(height: 0.02),
                      largeText(title: 'Verification not successful',color:theme.colorScheme.primary),
                      const CustomSized(height: 0.01),
                      smallText(
                          title: 'We\'re sorry to inform you but your profile couldn’t',color: theme.colorScheme.onSecondaryContainer),
                      const CustomSized(height: 0.003),
                      smallText(title: 'be verified. Please submit correct information your',color: theme.colorScheme.onSecondaryContainer),
                      const CustomSized(height: 0.003),
                      smallText(title: 'profile and try again. For more details check',color: theme.colorScheme.onSecondaryContainer),
                      const CustomSized(height: 0.03),
                      Align(
                          alignment: Alignment.center,
                          child: Image(
                            image: const AssetImage(underReview),
                            height: MediaQuery.sizeOf(context).height * 0.25,
                          )),
                      const CustomSized(height: 0.03),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(15),
                        height: MediaQuery.sizeOf(context).height * 0.11,
                        width: MediaQuery.sizeOf(context).width * 1,
                        decoration: BoxDecoration(
                          color: theme.cardColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.error,
                              size: 25,
                              color: theme.canvasColor,
                            ),
                            CustomSized(
                              width: 0.02,
                            ),
                            Expanded(
                              child: Text(
                                'We\'re sorry to inform you but your profile isn\'t verified. Please review your profile and try again',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: theme.canvasColor,
                                  fontFamily: 'Nunito Sans',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const CustomSized(height: 0.03),
                      CustomButton(title: 'Resubmit documents', onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> MainBottomScreen()));
                      },width: 1,borderRadius: 30,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
