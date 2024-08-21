import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

class RoleSelectionConatiner extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;
  final String description;
  final bool isSelected;
  const RoleSelectionConatiner(
      {required this.title,
      required this.onTap,
      required this.imagePath,
      required this.description,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.sizeOf(context).height * 0.31,
        width: MediaQuery.sizeOf(context).width * 0.43,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 0.41,
              decoration: BoxDecoration(
                color: isSelected == true ? theme.colorScheme.primary : theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(15),
                border:isSelected == true ?null :  Border.all(color:theme.dividerColor),
              ),
              child: Column(
                children: [
                  CustomSized(
                    height: 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      height: MediaQuery.sizeOf(context).height * 0.12,
                      width: MediaQuery.sizeOf(context).width * 0.22,
                      child: SvgPicture.asset(imagePath,color: isSelected == true ? theme.colorScheme.secondary : theme.colorScheme.primary,),
                    ),
                  ),
                  CustomSized(
                    height: 0.01,
                  ),
                  smallText(
                      title: title,
                      color: isSelected == true ?  theme.colorScheme.secondary : theme.colorScheme.primary,),
                  CustomSized(
                    height: 0.01,
                  ),
                ],
              ),
            ),
            CustomSized(
              height: 0.01,
            ),
            Expanded(child: Text(description,style:  TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: theme.colorScheme.primary,
              fontFamily:'Nunito Sans',
            ),)),
            CustomSized(
              height: 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
