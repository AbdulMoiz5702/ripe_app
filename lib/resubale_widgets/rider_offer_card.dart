import 'package:flutter/material.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

import '../views/pessenger_rider_process/pessenger_rider_comming.dart';




class RideOfferCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.inversePrimary,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(avatar), // Use a local image asset
                        radius: 30,
                      ),
                      CustomSized(height: 0.02,width: 0.04,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          largeText(
                              title:  'Peter Dian',
                              textSize: 14.0,
                              color: theme.primaryColor
                          ),
                          CustomSized(height: 0.01,width: 0.04,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.star, color: Colors.orange, size: 16),
                              smallText(
                                  title:  '4.8 (23)',
                                  textSize: 11.0,
                                  color: theme.colorScheme.onSecondaryContainer
                              ),
                            ],
                          ),

                        ],
                      ),
                    ],
                  ),
                  CustomSized(height: 0.035,width: 0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.watch_later_outlined,color: theme.colorScheme.secondary,size: 15.0,),
                      CustomSized(width: 0.01,height: 0,),
                      smallText(title: '2 min.',color: theme.colorScheme.onSecondaryContainer,textSize: 11.0),
                      CustomSized(width: 0.01,height: 0,),
                      Container(width: 1,height: MediaQuery.sizeOf(context).height * 0.02,color: theme.dividerColor,),
                      CustomSized(width: 0.01,height: 0,),
                      Icon(Icons.social_distance_outlined,color: theme.colorScheme.secondary,size: 15.0,),
                      CustomSized(width: 0.01,height: 0,),
                      smallText(title: '0.2mile',color: theme.colorScheme.onSecondaryContainer,textSize: 11.0),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  CustomSized(height: 0.02,width: 0,),
                  Image.asset(wagon),
                  CustomSized(height: 0.01,width: 0,),
                  smallText(
                      title:   'Suzuki Hustler G',
                      textSize: 11.0,
                      color: theme.colorScheme.onSecondaryContainer
                  ),
                  CustomSized(height: 0.01,width: 0,),
                  CustomButton(
                    onBoard: false,
                    borderRadius: 30,
                      width: 0.4,
                      title: 'Accept offer', onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> PessengerRiderComing()));

                  })
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}