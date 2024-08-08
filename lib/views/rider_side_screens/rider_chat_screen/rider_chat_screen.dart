import 'package:flutter/material.dart';
import 'package:ride_app/consts/images_path.dart';

import '../../../resubale_widgets/text_widgets.dart';


class RiderChatScreen extends StatelessWidget {
  const RiderChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: largeText(title: 'Chats',textSize: 20.0,color: theme.primaryColor),
      ),
      body: ListView.builder(
          itemCount: 30,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          cacheExtent: 0,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context,index){
          return Container(
            margin: EdgeInsets.only(top: 5),
            child: ListTile(
              onTap: (){},
              leading: const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(avatar),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  smallText(title: 'Jane Smith',color: theme.primaryColor),
                  smallText(title: '12:13AM',color: theme.dividerColor,textSize: 11.0),
                ],
              ),
              subtitle: smallText(title: 'Porem ipsum dolor sit amet, consectetur adipiscing elit.',color: theme.colorScheme.onSecondaryContainer,textSize: 11.0),
            ),
          );
          }),
    );
  }
}
