import 'package:flutter/material.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

import '../views/auth_screen/login_screen.dart';
import '../views/role_selection_screen/select_role.dart';

class GoToLogin extends StatelessWidget {
  const GoToLogin({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SelectRole()));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          smallText(title: 'Already a member?  ',color: theme.primaryColor,weight:FontWeight.w700 ),
          smallText(title: 'Login',color: theme.colorScheme.secondary,textSize: 13.0),
        ],
      ),
    );
  }
}

class WentToLogin extends StatelessWidget {
  const WentToLogin({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => LoginScreen()));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          smallText(title: 'Go back to',color: theme.primaryColor,weight:FontWeight.w700 ),
          smallText(title: '   Login',color: theme.colorScheme.secondary,textSize: 13.0),
        ],
      ),
    );
  }
}