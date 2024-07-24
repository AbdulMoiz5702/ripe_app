import 'package:flutter/material.dart';
import '../consts/images_path.dart';
import 'LoginOptionButton.dart';

class LoginOptionsRow extends StatelessWidget {
  const LoginOptionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        LoginOptionButton(title: 'Google', imagePath: google),
        LoginOptionButton(title: 'Facebook', imagePath: facebook),
      ],
    );
  }
}
