
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

import '../consts/colors.dart';


Widget dividerRow({required BuildContext context,String title= 'register'}){
  var theme = Theme.of(context);
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        height: 1,
        width: MediaQuery.sizeOf(context).width * 0.28,
        color: theme.colorScheme.surface,
      ),
      smallText(
          title:'or $title with',color: theme.colorScheme.surface),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        height: 1,
        width: MediaQuery.sizeOf(context).width * 0.28,
        color: theme.colorScheme.surface,
      )
    ],
  );
}