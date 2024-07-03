import 'package:flutter/material.dart';

Widget largeText(
    {title,
      Color color = Colors.white,
      textSize = 20.0,
      FontWeight weight = FontWeight.bold}) {
  return Text(
    title,
    style: TextStyle(color: color, fontSize: textSize, fontWeight: weight, fontFamily: "Poppins"),
  );
}

Widget normalText(
    {title,
      Color color = Colors.white,
      textSize = 16.0,
      FontWeight weight = FontWeight.w700}) {
  return Text(
    title,
    style: TextStyle(color: color, fontSize: textSize, fontWeight: weight, fontFamily: "Poppins",),
  );
}


Widget smallText(
    {title,
      Color color = Colors.white,
      textSize = 12.0,
      FontWeight weight = FontWeight.w500}) {
  return Text(
    title,
    style: TextStyle(color: color, fontSize: textSize, fontWeight: weight, fontFamily: "Poppins"),
  );
}


Widget listTileText(
    {title, Color color = Colors.white, textSize, weight = FontWeight.bold}) {
  return Text(
    title,
    style: TextStyle(color: color, fontSize: textSize, fontWeight: weight, fontFamily: "Poppins",letterSpacing:1),
  );
}