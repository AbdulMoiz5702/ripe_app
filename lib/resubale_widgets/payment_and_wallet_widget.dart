import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/new_colors.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

import '../views/user_profile/activity/edit_credit_card.dart';

class PaymentAndWalletWidget extends StatelessWidget {
  final String title;
  final String svgs;
  final String cardTitle;
  final String buttontitle;
  final String cardDetails;
  final Color? colorofSVG;
  final bool iscolorofSVG;
  final VoidCallback ontap;
  const PaymentAndWalletWidget(
      {super.key,
      required this.title,
      required this.svgs,
      required this.cardTitle,
      required this.buttontitle,
      required this.cardDetails,
      this.colorofSVG,
      this.iscolorofSVG = false,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      // height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: TextStyle(
              color: theme.colorScheme.onSecondaryContainer,
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              fontFamily: 'Nunito Sans',
            ),
          ),
          CustomSized(
            height: 0.01,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: theme.colorScheme.surfaceBright.withOpacity(0.2),
                ),
                borderRadius: BorderRadius.circular(12.0)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        minRadius: 30.0,
                        backgroundColor: greyColor.withOpacity(0.12),
                        child: SvgPicture.asset(svgs,
                            color: iscolorofSVG ? colorofSVG : null),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          // padding: const EdgeInsets.only(left: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              largeText(
                                  title: cardTitle,
                                  color: theme.primaryColor,
                                  textSize: 14.0),
                              CustomSized(
                                height: 0.012,
                              ),
                              Text(
                                cardDetails,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color:
                                      theme.colorScheme.onSecondaryContainer,
                                  fontWeight: FontWeight.w400,
                                  wordSpacing: 0.02,
                                  height: 1.5,
                                  letterSpacing: 0.2,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    bottom: 16.0,
                  ),
                  child: SecondaryCustomButton(
                      onBoard: false,
                      // borderColor: theme.colorScheme.surfaceBright.withOpacity(0),
                      widthbetweentextandicon: 0.0,
                      title: buttontitle,
                      onTap: ontap,
                      borderColor:
                          theme.colorScheme.surfaceBright.withOpacity(0.0001),
                      titleColor: theme.colorScheme.primary,
                      textsize: 15.0,
                      isBorder: true,
                      weight: FontWeight.w700,
                      width: 0.9,
                      borderRadius: 24,
                      color:
                          theme.colorScheme.surfaceBright.withOpacity(0.2)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PaymentDoneAndWalletWidget extends StatelessWidget {
  final String title;
  final String svgs;
  final String cardTitle;
  final String cardDetails;
  final Color? colorofSVG;
  final bool iscolorofSVG;
  final bool isdivider;
  final bool istitle;
  final bool isEditButton;
  final bool isEditCardScreen;
  final VoidCallback onEdit;
  final VoidCallback? onEditCardScreen;
  const PaymentDoneAndWalletWidget({
    super.key,
    required this.title,
    required this.svgs,
    required this.cardTitle,
    required this.cardDetails,
    this.colorofSVG,
    this.iscolorofSVG = false,
    this.isdivider = false,
    this.istitle = false,
    this.isEditButton = false,
    this.isEditCardScreen = false,
    required this.onEdit,
    this.onEditCardScreen,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      // height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          istitle
              ? Text(
                  title.toUpperCase(),
                  style: TextStyle(
                    color: theme.colorScheme.onSecondaryContainer,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Nunito Sans',
                  ),
                )
              : CustomSized(
                  width: 0,
                  height: 0,
                ),
          istitle
              ? CustomSized(
                  height: 0.01,
                )
              : CustomSized(
                  width: 0,
                  height: 0,
                ),
          istitle
              ? CustomSized(
                  height: 0,
                )
              : CustomSized(
                  height: 0.01,
                ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                minRadius: 25.0,
                backgroundColor: greyColor.withOpacity(0.12),
                child: SvgPicture.asset(svgs,
                    color: iscolorofSVG ? colorofSVG : null),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  // padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      largeText(
                          title: cardTitle,
                          color: theme.primaryColor,
                          textSize: 14.0,
                          weight: FontWeight.w700),
                      CustomSized(
                        height: 0.002,
                      ),
                      Text(
                        cardDetails,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: theme.colorScheme.onSecondaryContainer,
                          fontWeight: FontWeight.w400,
                          wordSpacing: 0.02,
                          height: 1.5,
                          letterSpacing: 0.2,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              isEditButton == true
                  ? isEditCardScreen == true
                      ? SecondaryAccessButton(
                          borderColor: theme.dividerColor,
                          color: theme.scaffoldBackgroundColor,
                         isBorder: true,
                         titleColor: theme.primaryColor,
                         borderRadius: 30.0,
                          title:'Edit' ,
                          onTap: onEditCardScreen!,
                          iconData: Icons.edit,
                          width: 0.25,
                        )
                      : SecondaryCustomButton(
                          title: 'Edit',
                          onTap: onEdit,
                          width: 0.2,
                          height: 0.05,
                          isBorder: true,
                          borderColor: theme.dividerColor,
                          color: theme.scaffoldBackgroundColor,
                          titleColor: theme.primaryColor,
                          borderRadius: 30.0,
                          onBoard: false,
                          widthbetweentextandicon: 0.0,
                        )
                  : SecondaryCustomButton(
                      title: 'Remove',
                      onTap: () {},
                      width: 0.25,
                      height: 0.05,
                      color: theme.colorScheme.secondaryFixedDim,
                      titleColor: theme.colorScheme.secondaryFixed,
                      borderRadius: 30.0,
                      onBoard: false,
                      widthbetweentextandicon: 0.0,
                    )
            ],
          ),
          isdivider
              ? CustomSized(
                  height: 0.02,
                )
              : CustomSized(
                  width: 0,
                  height: 0,
                ),
          isdivider
              ? Divider(
                  color: theme.colorScheme.onSecondaryContainer,
                )
              : CustomSized(
                  width: 0,
                  height: 0,
                ),
        ],
      ),
    );
  }
}
