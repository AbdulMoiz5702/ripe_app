import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/controllers/Rider_ride_process_provider.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/band_name.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import '../../../resubale_widgets/CustomButton.dart';
import '../../../resubale_widgets/custom_leading.dart';


class RatePessengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var controller = Provider.of<RiderRideProcessProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: BrandName(theme: theme),
        actions: [
          CustomLeadingSecond(iconData: Icons.close,isHome: true,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomSized(height: 0.13,),
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(avatar), // Replace with your driver's image
            ),
            CustomSized(height: 0.02,),
            largeText(title: 'How was your ride with Peter?',color: theme.primaryColor,textSize: 17.0),
            CustomSized(height: 0.01,),
            smallText(title: 'Rate your experience with the driver.',color: theme.colorScheme.onSecondaryContainer),
            CustomSized(height: 0.02,),
            Consumer<RiderRideProcessProvider>(builder: (context,provider,_){
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index){
                    return provider.buildStar(index,context);
                  }),
                );
            }),
            Consumer<RiderRideProcessProvider>(
              builder: (context, provider, _) {
                return Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(provider.tags.length, (index) {
                    String tag = provider.tags[index];
                    bool isSelected = provider.selectedTags.contains(tag);
                    return GestureDetector(
                      onTap: () {
                        provider.toggleTag(tag);
                      },
                      child: Chip(
                        backgroundColor: isSelected
                            ? theme.colorScheme.onTertiaryContainer
                            : theme.scaffoldBackgroundColor,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: isSelected
                                ? Colors.transparent
                                : theme.dividerColor,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        label: Text(
                          tag,
                          style: TextStyle(
                            fontSize: 13.0,
                            color: isSelected
                                ? theme.colorScheme.onTertiaryFixed
                                : theme.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
            CustomSized(height: 0.2,),
            SecondaryAccessButton(
              titleColor: theme.primaryColor,
              color: theme.colorScheme.surfaceContainerHighest,
              title: 'Report issue', onTap: (){
              controller.openRepostIssueBottomSheet(context: context);
            },borderRadius: 30,width: 1,),
            CustomSized(height: 0.02,),
            CustomButton(onBoard: false,title: 'Report issue', onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> RatePessengerScreen()));
            },borderRadius: 30,width: 1,),
          ],
        ),
      ),
    );
  }
}
