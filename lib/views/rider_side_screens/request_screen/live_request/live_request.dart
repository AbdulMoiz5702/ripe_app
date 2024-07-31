import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/doted_divider.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import 'veiw_and_send_bid_screen.dart';


class LiveRequestScreen extends StatelessWidget {
  const LiveRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListView.builder(
        itemCount: 30,
        cacheExtent: 0,
        scrollDirection: Axis.vertical,
        physics:const  BouncingScrollPhysics(),
        itemBuilder:(context,index){
          return Card(
            elevation: 5,
            margin: EdgeInsets.all(15),
            color: theme.colorScheme.secondaryContainer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSized(height: 0.004,),
                  smallText(title: 'Pick-up location',color: theme.colorScheme.onSecondaryContainer,textSize: 11.0),
                  CustomSized(height: 0.004,),
                  Row(
                    children: [
                      SvgPicture.asset(currentLocationSVG,color: theme.colorScheme.secondary,),
                      CustomSized(height: 0,width: 0.02,),
                      Expanded(
                        child: Text('Askari 11, Rawalpindi, Punjab 46000, Pakistan',style: TextStyle(color: theme.primaryColor, fontSize: 14.0, fontWeight: FontWeight.w700,wordSpacing:0.01,letterSpacing: 0.01,
                          fontFamily: 'Nunito Sans',),softWrap: true,overflow: TextOverflow.visible,maxLines: 1,),
                      ),

                    ],
                  ),
                  CustomSized(height: 0.01,),
                  DottedDivider(),
                  CustomSized(height: 0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          smallText(title: 'Pick-up location',color: theme.colorScheme.onSecondaryContainer,textSize: 11.0),
                          CustomSized(height: 0.01,),
                          smallText(title: '12 min',color: theme.primaryColor,weight:FontWeight.w700 ),
                        ],
                      ),
                      CustomSized(height: 0.0,width: 0.2,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          smallText(title: 'Est pick-up distance',color: theme.colorScheme.onSecondaryContainer,textSize: 11.0),
                          CustomSized(height: 0.01,),
                          smallText(title: '6miles',color: theme.primaryColor,weight:FontWeight.w700 ),
                        ],
                      ),
                    ],
                  ),
                  CustomSized(height: 0.02,),
                  DottedDivider(),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(avatar),
                    ),
                    title: smallText(title: 'Jonas Smith',color: theme.primaryColor),
                    subtitle: Row(
                      children: [
                        Row(
                          children: [
                            const  Icon(Icons.star, color: Colors.amber, size: 18.0),
                            smallText(textSize: 11.0,title:'4.8',color: theme.primaryColor,),
                            smallText(textSize: 11.0,title:' ( 43 )',color: theme.colorScheme.onSecondaryContainer,),
                          ],
                        ),
                      ],
                    ),
                    trailing: largeText(title: '\$34',textSize:17.0,color: theme.colorScheme.secondary),
                  ),
                  DottedDivider(),
                  CustomSized(height: 0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SecondaryCustomButton(
                        titleColor: theme.colorScheme.secondaryFixed,
                        title: 'Decline',
                        onTap: () {
                        },
                        onBoard: false,
                        borderRadius: 30,
                        width: 0.42,
                        color: theme.colorScheme.secondaryFixedDim,
                      ),
                      CustomButton(title: 'Send bid', onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> VeiwAndSendBidScreen()));
                      },borderRadius: 30,width: 0.42,onBoard: false,),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
