import 'package:flutter/material.dart';

class BrandName extends StatelessWidget {
  const BrandName({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text:  TextSpan(children: [
          TextSpan(
              text: 'Logo',
              style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          TextSpan(
              text: 'ipsum',
              style: TextStyle(
                  color: theme.colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18))
        ]));
  }
}