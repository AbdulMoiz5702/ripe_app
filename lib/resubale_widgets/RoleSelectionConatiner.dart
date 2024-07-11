import 'package:flutter/material.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';



class RoleSelectionConatiner extends StatelessWidget {
  final String title ;
  final String imagePath ;
  final VoidCallback onTap ;
  final String description ;
  final bool isSelected ;
  const RoleSelectionConatiner({required this.title,required this.onTap,required this.imagePath,required this.description,this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.sizeOf(context).height * 0.31,
        width: MediaQuery.sizeOf(context).width * 0.43 ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 0.43,
              decoration: BoxDecoration(
                color: isSelected == true ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black12),
              ),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.1,
                    width: MediaQuery.sizeOf(context).width * 0.25 ,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(imagePath),fit: BoxFit.cover,invertColors:isSelected== true ? true :false),
                    ),
                  ),
                  normalText(title: title,color: isSelected == true ? Colors.blue  :Colors.black ),
                  CustomSized(height: 0.01,),
                ],
              ),
            ),
            CustomSized(height: 0.01,),
            smallText(title: description,color: Colors.black38,textSize: 10.0),
            CustomSized(height: 0.02,),
          ],
        ),
      ),
    );
  }
}
