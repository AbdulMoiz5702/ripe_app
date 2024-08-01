import 'package:flutter/material.dart';

import '../consts/colors.dart';

Widget largeText(
    {title,
    Color color = primaryTextColor,
    textSize = 24.0,
    FontWeight weight = FontWeight.w700}) {
  return Text(
    title,
    style: TextStyle(
      color: color,
      fontSize: textSize,
      fontWeight: weight,
      fontFamily: 'Nunito Sans',
    ),
  );
}

Widget normalText(
    {title,
    Color color = Colors.white,
    textSize = 16.0,
    FontWeight weight = FontWeight.w700}) {
  return Text(
    title,
    style: TextStyle(
      color: color,
      fontSize: textSize,
      fontWeight: weight,
      fontFamily: 'Nunito Sans',
    ),
  );
}

Widget smallText(
    {title,
    Color color = secondaryTextColor,
    textSize = 14.0,
    FontWeight weight = FontWeight.w400}) {
  return Text(
    title,
    maxLines: 1,
    style: TextStyle(
      color: color,
      fontSize: textSize,
      fontWeight: weight,
      wordSpacing: 0.01,
      letterSpacing: 0.01,
      fontFamily: 'Nunito Sans',
    ),
  );
}

Widget listTileText(
    {title, Color color = Colors.white, textSize, weight = FontWeight.bold}) {
  return Text(
    title,
    style: TextStyle(
        color: color,
        fontSize: textSize,
        fontWeight: weight,
        fontFamily: 'Nunito Sans',
        letterSpacing: 1),
  );
}

class TextStyles {
  static const TextStyle bulletPoint = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: primaryTextColor,
    fontFamily: 'Nunito Sans',
  );

  static const TextStyle bulletPointBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: primaryTextColor,
    fontFamily: 'Nunito Sans',
  );
}
