import 'package:flutter/material.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/Bg_widget.dart';
import 'package:ride_app/resubale_widgets/band_name.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import 'package:ride_app/views/upload_car_images/verification_not_successfull.dart';
import '../../resubale_widgets/CustomButton.dart';
import '../../resubale_widgets/Custom_Sized.dart';
import '../../resubale_widgets/custom_leading.dart';

class VerificationSuccessful extends StatelessWidget {
  const VerificationSuccessful({super.key});

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
                      largeText(title: 'Verification successful',color:theme.colorScheme.primary),
                      const CustomSized(height: 0.003),
                      smallText(
                          title: 'Your account has been verified successfully. You’re',color: theme.colorScheme.onSecondaryContainer),
                      const CustomSized(height: 0.003),
                      smallText(
                          title:
                          'now ready to drive with us and offer rides to',color: theme.colorScheme.onSecondaryContainer),
                      const CustomSized(height: 0.003),
                      smallText(title: 'travellers.',color: theme.colorScheme.onSecondaryContainer),
                      const CustomSized(height: 0.03),
                      Align(
                          alignment: Alignment.center,
                          child: Image(
                            image: const AssetImage(verificationSuccessful),
                            height: MediaQuery.sizeOf(context).height * 0.25,
                          )),
                      const CustomSized(height: 0.03),
                      Container(
                        padding: const EdgeInsets.all(15),
                        height: MediaQuery.sizeOf(context).height * 0.08,
                        width: MediaQuery.sizeOf(context).width * 1,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.scrim,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check_circle,
                              size: 25,
                              color: theme.colorScheme.surfaceVariant,
                            ),
                            CustomSized(
                              width: 0.03,
                            ),
                            Expanded(
                              child: Text(
                                'Your profile is verified successfully.',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: theme.colorScheme.onPrimary,
                                  fontFamily: 'Nunito Sans',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const CustomSized(height: 0.04),
                      CustomButton(width: 1,borderRadius: 30,title: 'Hit the Road!', onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> VerificationNotSuccessful()));
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
