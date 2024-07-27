import 'package:flutter/material.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';



class LoginOptionButton extends StatelessWidget {
  final String imagePath ;
  final String title ;
  const LoginOptionButton({super.key, required this.title,required this.imagePath});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.sizeOf(context).width * 0.4,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.surface),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(imagePath),fit: BoxFit.cover),
            ),
          ),
          const CustomSized(width: 0.02,),
          normalText(title: title,color: theme.primaryColor, textSize: 15.0, ),
        ],
      ),
    );
  }
}
