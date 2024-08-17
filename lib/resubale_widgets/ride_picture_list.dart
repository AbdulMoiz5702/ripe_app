import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_app/consts/strings.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import 'package:scroll_indicator/scroll_indicator.dart';
import '../consts/colors.dart';
import '../consts/images_path.dart';

class RideDetailsScreen extends StatefulWidget {
  const RideDetailsScreen({super.key});

  @override
  _RideDetailsScreenState createState() => _RideDetailsScreenState();
}

class _RideDetailsScreenState extends State<RideDetailsScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      color: theme.colorScheme.onBackground,


      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            smallText(
              title: '  Vehicle details',
              color: theme.colorScheme.onSecondaryContainer),
            const CustomSized(
              height: 0.010,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: 40,
                  width: 60,
                  decoration:const BoxDecoration(
                    image: DecorationImage(image: AssetImage(car)),
                  ),
                  child: Container(
                    height: 22,
                    width: 22,
                    alignment: Alignment.center,
                    decoration:  BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.colorScheme.secondary,
                    ),
                    child:  SvgPicture.asset(diamondSVG,color: theme.colorScheme.inversePrimary,),
                  ),
                ),
                largeText(title: 'Honda - Grey Corolla', textSize: 14.0,color: theme.primaryColor),
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  padding: const EdgeInsets.all(12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: textFieldHintColor.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(
                        10,
                      )),
                  child: largeText(title: 'RIR-19-467', textSize: 14.0,color:theme.primaryColor, weight: FontWeight.w500),
                ),
              ],
            ),
            const CustomSized(
              height: 0.010,
            ),
            SizedBox(
              height: 64,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                itemCount: vechile.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(2),
                    width: MediaQuery.of(context).size.width * 0.18, // Adjust the width as needed
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(vechile[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            const CustomSized(
              height: 0.010,
            ),
            ScrollIndicator(
              scrollController: scrollController,
              width: MediaQuery.sizeOf(context).width *1 ,
              height: 10,
              indicatorWidth: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: lightgreyColor.withOpacity(0.85)),
              indicatorDecoration: BoxDecoration(
                  color: darkSecondaryTextColors,
                  borderRadius: BorderRadius.circular(10)),
            ),


            const CustomSized(
              height: 0.010,
            ),

          ],
        ),
      ),
    );
  }
}
