import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/consts/strings.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/band_name.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import '../../../consts/colors.dart';
import '../../../controllers/pessenger_ride_process_provider.dart';
import '../../../resubale_widgets/CustomButton.dart';
import '../../../resubale_widgets/custom_leading.dart';
import '../../../resubale_widgets/cutom_leading text_feild.dart';


class PessengerRateRiderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var controller = Provider.of<PessengerRideProcessProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: BrandName(theme: theme),
        actions: [
          CustomLeadingSecond(iconData: Icons.close,isHome: true,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(avatar), // Replace with your driver's image
              ),
              CustomSized(height: 0.02,),
              largeText(title: 'How was your ride with Peter?',color: theme.primaryColor,textSize: 17.0),
              CustomSized(height: 0.01,),
              smallText(title: 'Rate your experience with the driver.',color: theme.colorScheme.onSecondaryContainer),
              CustomSized(height: 0.02,),
              Consumer<PessengerRideProcessProvider>(builder: (context,provider,_){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index){
                    return provider.buildStar(index,context);
                  }),
                );
              }),
              Consumer<PessengerRideProcessProvider>(
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
              CustomSized(height: 0.01,),
              CustomLeadingTextField(
                  maxLines: true,
                  isHintChange: true,
                  leadingText: 'Tell us more about the rider',
                  controller: textController,
                  keyBoardType: TextInputType.text,
                  obscureText:false ,
                  hint: '',
                  onValidator: (value) {},
                  onFieldSubmittedValue: (value) {}),
              Container(height: 1,width: MediaQuery.sizeOf(context).width,color: greyColor,),
              CustomSized(height: 0.02,),
              largeText(title: 'Add a tip to the rider',color: theme.primaryColor,textSize: 17.0),
              CustomSized(height: 0.01,),
              smallText(title: 'We share the full tip amount to the driver',color: theme.colorScheme.onSecondaryContainer),
              CustomSized(height: 0.01,),
              Consumer<PessengerRideProcessProvider>(
                builder: (context, provider, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(tagsTip.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          switch(index){
                            case 0:
                              provider.changeIndexTagsTip(index);
                              break;
                            case 1:
                              provider.changeIndexTagsTip(index);
                              break;
                            case 2:
                              provider.changeIndexTagsTip(index);
                              break;
                            case 3:
                              provider.changeIndexTagsTip(index);
                              break;
                            case 4:
                              provider.changeIndexTagsTip(index);
                              break;
                            case 5:
                              provider.changeIndexTagsTip(index);
                              provider.openCustomTipBottomSheet(context: context);
                              break;
                          }
                        },
                        child: Chip(
                          backgroundColor: provider.indexTagsTip == index
                              ? theme.colorScheme.onTertiaryContainer
                              : theme.scaffoldBackgroundColor,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: provider.indexTagsTip == index
                                  ? Colors.transparent
                                  : theme.dividerColor,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          label: Text(
                            '\$${tagsTip[index]}',
                            style: TextStyle(
                              fontSize: 13.0,
                              color: provider.indexTagsTip == index
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
              CustomSized(height: 0.02,),
              SecondaryAccessButton(
                titleColor: theme.primaryColor,
                color: theme.colorScheme.surfaceContainerHighest,
                title: 'Report issue', onTap: (){
                controller.openRepostIssueBottomSheet(context: context);
              },borderRadius: 30,width: 1,),
              CustomSized(height: 0.02,),
              SecondaryCustomButton(title: 'Submit feedback', onTap: (){
              },borderRadius: 30,width: 1,onBoard: false,),
            ],
          ),
        ),
      ),
    );
  }
}
