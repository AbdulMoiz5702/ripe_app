import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

class BookingCard extends StatelessWidget {
  final String date;
  final String time;
  final double price;
  final List<String> locations;
  final double distance;
  final VoidCallback onTap;
  const BookingCard({
    Key? key,
    required this.date,
    required this.time,
    required this.price,
    required this.locations,
    required this.distance,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Card(
        surfaceTintColor:theme.colorScheme.inversePrimary ,
        shadowColor: theme.colorScheme.inversePrimary,
        margin: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
        color: theme.colorScheme.surfaceContainerHighest,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  smallText(title:  '$date, $time',weight: FontWeight.w700,color: theme.primaryColor),
                  smallText(title:  '\$${price.toStringAsFixed(2)}',weight: FontWeight.w700,color: theme.colorScheme.secondary,textSize: 17.0),
                ],
              ),
              CustomSized(height: 0.02),
              Row(
                children: [
                  SvgPicture.asset(normalRoute,color: theme.colorScheme.secondary,),
                  CustomSized(width: 0.02,height: 0,),
                  smallText(title: '${distance.toStringAsFixed(1)} miles',color: theme.colorScheme.onSecondaryContainer,textSize: 11.0,
                  ),
                ],
              ),
              CustomSized(height: 0.02),
               ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                   itemCount: locations.length,
                   cacheExtent: 0,
                   reverse: true,
                   shrinkWrap: true,
                   itemBuilder: (context,index){
                     return Column(
                       mainAxisAlignment: MainAxisAlignment.end,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Row(
                           children: [
                             Icon(
                               index == 0 ? Icons.circle :  Icons.circle_outlined,
                               color: index == 0  ?  theme.colorScheme.secondaryFixed:  theme.colorScheme.secondary,
                               size: 20,
                             ),
                             CustomSized(width: 0.02,height: 0,),
                             Expanded(
                               child: Text(
                                 locations[index],style: TextStyle(
                                   color: theme.colorScheme.onSecondaryContainer,fontSize: 11.0,fontWeight: FontWeight.w400,fontFamily: 'Nunito Sans',
                               ),
                               ),
                             ),
                           ],
                         ),
                         if (index != 0) // Add line for all items except the first one
                           Container(
                             margin: EdgeInsets.only(left: 10,bottom: 2,top: 2),
                             height: MediaQuery.sizeOf(context).height * 0.015,
                             width: 1,
                             color: theme.dividerColor,
                           ),
                       ],
                     );
                   })
            ],
          ),
        ),
      ),
    );
  }
}