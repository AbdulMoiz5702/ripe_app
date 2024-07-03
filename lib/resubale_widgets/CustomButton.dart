import 'package:flutter/material.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';



class CustomButton extends StatelessWidget {
  final String title ;
  final VoidCallback onTap ;
  final double width ;
  final Color color ;
  final double height ;
  final double borderRadius ;
  final bool onBoard ;
  const CustomButton({required this.title, required this.onTap,this.width = 0.7,this.color = Colors.black,this.height = 0.05,this.borderRadius = 10,this.onBoard = true});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius:BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: color,
        ),
        width: MediaQuery.sizeOf(context).width * width,
        height:MediaQuery.sizeOf(context).height * height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title,style: TextStyle(color :Colors.white),),
            CustomSized(width: 0.03,),
           onBoard == true ? Icon(Icons.arrow_forward,color: Colors.white,) : Container(height: 1,width: 1,),
          ],
        ),
      ),
    );
  }
}
