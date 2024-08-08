import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_app/resubale_widgets/band_name.dart';
import '../../../consts/images_path.dart';
import '../../../resubale_widgets/Bg_widget.dart';
import '../../../resubale_widgets/Custom_Sized.dart';
import '../../../resubale_widgets/custom_leading.dart';
import '../../../resubale_widgets/text_widgets.dart';

class QuizUnderReview extends StatelessWidget {
  const QuizUnderReview({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BgWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: CustomLeading(),
          backgroundColor: Colors.transparent,
        ),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.55,
            width: MediaQuery.sizeOf(context).width * 1,
            decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                )),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BrandName(theme: theme),
                    CustomSized(
                      height: 0.02,
                    ),
                    largeText(title: 'Thanks for your cooperation!',color:theme.primaryColor),
                    CustomSized(height: 0.01,),
                    largeText(title: 'We shall respond you soon.',color:theme.primaryColor),
                    CustomSized(
                      height: 0.01,
                    ),
                    smallText(
                        title: 'We’ve received your answers submitted in the',color: theme.colorScheme.onSecondaryContainer),
                    CustomSized(
                      height: 0.002,
                    ),
                    smallText(
                        title: 'quiz. It’ll take a while to anlyze the answers and give you feedback.',color: theme.colorScheme.onSecondaryContainer),
                    CustomSized(
                      height: 0.002,
                    ),
                    smallText(
                        title: 'give you feedback.',color: theme.colorScheme.onSecondaryContainer),
                    CustomSized(
                      height: 0.02,
                    ),
                    Center(
                      child: Image(
                        alignment: Alignment.center,
                        image: AssetImage(stopWatch),
                        isAntiAlias: true,
                        height: MediaQuery.sizeOf(context).height * 0.3,
                        width: MediaQuery.sizeOf(context).width * 0.6,
                        fit:BoxFit.cover,
                      ),
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
