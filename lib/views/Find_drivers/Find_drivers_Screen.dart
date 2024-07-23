import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/strings.dart';
import 'package:ride_app/resubale_widgets/custom_leading.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

import '../../consts/images_path.dart';
import '../../resubale_widgets/Custom_Sized.dart';
import '../../resubale_widgets/driver_list_tile.dart';
import '../../resubale_widgets/home_screen_Text_Feild.dart';
import 'find_rider_detail_screen.dart';

class FindDriversScreen extends StatelessWidget {
  const FindDriversScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        leading: CustomLeading(
          isHome: true,
        ),
        title: largeText(title: 'Find a driver', textSize: 20.0),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: HomeScreenTextField(
                color: textfieldColorSecond,
                controller: controller,
                hintColor: primaryTextColor,
                hint: 'Search a driver',
                onValidator: (value) {},
                onFieldSubmittedValue: (value) {},
                iconPath: searchBlack),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: names.length,
                  itemBuilder: (context, index) {
                    return DriverListItem(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => FindRiderDetailScreen(
                                    riderName: names[index],
                                    rating: rating[index].toString(),
                                    totalRides: '255',
                                    totalDrivingTime: '7',
                                    role: role[index],
                                    reviews: reviews[index].toString(),
                                    carDetails: 'Honda_New',
                                    avatarUrl: avatar,
                                    carAvatarUrl: images[index],
                                    carIcon: icons[index])));
                      },
                      name: names[index],
                      rating: rating[index],
                      reviews: reviews[index],
                      carDetails: 'Honda_New',
                      avatarUrl: avatar,
                      role: role[index],
                      carType: images[index],
                      iconData: icons[index],
                    );
                  })),
        ],
      ),
    );
  }
}
