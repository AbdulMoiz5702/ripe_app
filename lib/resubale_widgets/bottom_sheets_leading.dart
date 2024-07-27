import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';


class BottomSheetsLeadings extends StatelessWidget {
  const BottomSheetsLeadings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 5,
        width: MediaQuery.sizeOf(context).width * 0.3,
        decoration: BoxDecoration(
          color: lightBottomSheetLeadingColor,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}