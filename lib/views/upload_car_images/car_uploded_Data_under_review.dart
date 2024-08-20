import 'package:flutter/material.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/Bg_widget.dart';
import 'package:ride_app/resubale_widgets/band_name.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import '../../resubale_widgets/Custom_Sized.dart';
import '../../resubale_widgets/custom_leading.dart';

class CarUploadedDataUnderReview extends StatelessWidget {
  const CarUploadedDataUnderReview({super.key});

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
            height: MediaQuery.sizeOf(context).height * 0.72,
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
                  largeText(title: 'Thanks for waiting! We’re',color:theme.colorScheme.primary),
                  const CustomSized(height: 0.003),
                  largeText(title: ' checking your details.',color:theme.colorScheme.primary),
                  const CustomSized(height: 0.01),
                  smallText(
                      title: 'We’ve collected all your data for verification',color: theme.colorScheme.onSecondaryContainer),
                  const CustomSized(height: 0.003),
                  smallText(
                      title:
                          'purposes. It’ll take a little time for us to verify your ',color: theme.colorScheme.onSecondaryContainer),
                  const CustomSized(height: 0.003),
                  smallText(title: 'profile. Be patient with us.',color: theme.colorScheme.onSecondaryContainer),
                  const CustomSized(height: 0.03),
                  Align(
                      alignment: Alignment.center,
                      child: Image(
                        image: const AssetImage(underReview),
                        height: MediaQuery.sizeOf(context).height * 0.25,
                      )),
                  const CustomSized(height: 0.03),
                  Container(
                    padding: const EdgeInsets.all(15),
                    height: MediaQuery.sizeOf(context).height * 0.1,
                    width: MediaQuery.sizeOf(context).width * 1,
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error,
                          size: 27,
                          color: theme.canvasColor,
                        ),
                        CustomSized(
                          width: 0.02,
                        ),
                        Expanded(
                          child: Text(
                            'Your profile is under review. You\'ll be notified shortly.',
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
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
