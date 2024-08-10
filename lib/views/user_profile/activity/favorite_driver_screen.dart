import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/custom_leading.dart';
import '../../../../resubale_widgets/text_widgets.dart';
import '../../../consts/strings.dart';
import '../../../resubale_widgets/driver_list_tile.dart';
import '../../Find_drivers/find_rider_detail_screen.dart';


class FavoriteDriverScreen extends StatefulWidget {
  const FavoriteDriverScreen({super.key});

  @override
  State<FavoriteDriverScreen> createState() => _FavoriteDriverScreenState();
}

class _FavoriteDriverScreenState extends State<FavoriteDriverScreen> {
  bool showList = false;

  showRiderHistory() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        showList = true;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showRiderHistory();
  }
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(20),
        child: CustomButton(title: 'Add favourite drivers', onTap: (){
        },onBoard: false,width: 0.9,borderRadius: 30,),
      ),
      appBar: AppBar(
        leading: CustomLeading(isHome: true,),
        title: largeText(title: 'Favourite riders', textSize: 20.0,color: theme.primaryColor),
      ),
      body:showList == true ? ListView.builder(
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
              imagePath: icons[index],
            );
          })
          : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              bookMark,
              height: MediaQuery.sizeOf(context).height * 0.4,
            ),
          ),
          largeText(title: 'No favourite riders ', textSize: 17.0,color: theme.primaryColor),
          const CustomSized(height: 0.02),
          smallText(title: 'You didn’t have saved any riders yet.Let’s do',color: theme.colorScheme.onSecondaryContainer),
          smallText(title: ' something about that.',color: theme.colorScheme.onSecondaryContainer),
        ],
      ),
    );
  }
}
