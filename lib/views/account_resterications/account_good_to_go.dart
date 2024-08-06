import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/band_name.dart';
import '../../../consts/images_path.dart';
import '../../../resubale_widgets/Bg_widget.dart';
import '../../../resubale_widgets/Custom_Sized.dart';
import '../../../resubale_widgets/custom_leading.dart';
import '../../../resubale_widgets/text_widgets.dart';

class AccountGoodToGo extends StatelessWidget {
  const AccountGoodToGo({super.key});

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
            height: MediaQuery.sizeOf(context).height * 0.72,
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
                    largeText(title: 'Ready to Roll',color:theme.primaryColor),
                    CustomSized(
                      height: 0.01,
                    ),
                    smallText(
                        title: 'Congratulations! You’ve passed the assessment',color: theme.colorScheme.onSecondaryContainer),
                    CustomSized(
                      height: 0.002,
                    ),
                    smallText(
                        title: 'with flying colors. Your account is now',color: theme.colorScheme.onSecondaryContainer),
                    CustomSized(
                      height: 0.002,
                    ),
                    smallText(
                        title: 'unrestricted, and you’re good to go. Buckle up,',color: theme.colorScheme.onSecondaryContainer),
                    CustomSized(
                      height: 0.002,
                    ),
                    smallText(
                        title: 'focus on the road, and provide those top-notch',color: theme.colorScheme.onSecondaryContainer),
                    CustomSized(
                      height: 0.002,
                    ),
                    smallText(
                        title: 'Remember, safety comes first, and we appreciate',color: theme.colorScheme.onSecondaryContainer),
                    CustomSized(
                      height: 0.002,
                    ),
                    smallText(
                        title: 'your commitment to responsible driving. Rest up,',color: theme.colorScheme.onSecondaryContainer),
                    CustomSized(
                      height: 0.002,
                    ),
                    smallText(
                        title: 'rides. Remember, every journey matters, and your',color: theme.colorScheme.onSecondaryContainer),
                    CustomSized(
                      height: 0.002,
                    ),
                    smallText(
                        title: 'well-being matters too. Safe travels!',color: theme.colorScheme.onSecondaryContainer),
                    CustomSized(
                      height: 0.02,
                    ),
                    Center(
                      child: Image(
                        alignment: Alignment.center,
                        image: AssetImage(rocket),
                        isAntiAlias: true,
                        height: MediaQuery.sizeOf(context).height * 0.3,
                        width: MediaQuery.sizeOf(context).width * 0.6,
                        fit:BoxFit.cover,
                      ),
                    ),
                    CustomButton(title: 'Hit the road', onTap: (){},width: 1,borderRadius: 30,)
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
