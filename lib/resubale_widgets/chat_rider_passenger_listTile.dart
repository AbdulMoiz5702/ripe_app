import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import '../consts/colors.dart';
import '../views/chatting_screens/user_rider_chat.dart';
import 'call_button.dart';

class ChatRiderListTIle extends StatelessWidget {
  const ChatRiderListTIle({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
      child: Row(
        children: [
          CircleAvatar(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/person.png')
                  )
              ),
            ),
            maxRadius: 24.0,
            backgroundColor: lightbackgroundpaperColor,
          ),



          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                normalText(title: 'Peter Dian', weight: FontWeight.w700, textSize: 14.0, color: theme.primaryColor),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/svg_pictures/Star.svg',),
                      normalText(title: ' 4.8', weight: FontWeight.w400, textSize: 11.0, color: theme.primaryColor),
                      normalText(title: ' (23)', weight: FontWeight.w400, textSize: 11.0, color: theme.colorScheme.onSecondaryContainer),
                    ],
                  ),
                ),

              ],
            ),
          ),

          Spacer(),
          CircleAvatar(
            child: CallButton(theme: theme,id: '3',name: 'Moiz',color: theme.colorScheme.inversePrimary,),
            backgroundColor: theme.colorScheme.primary,
            maxRadius: 24.0,
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => UserRiderChatScreen()));
            },
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 20.0),
                  child: CircleAvatar(
                    child: SvgPicture.asset('assets/svg_pictures/message.svg', color: theme.colorScheme.inversePrimary,),
                    backgroundColor: theme.colorScheme.primary,
                    maxRadius: 24.0,
                  ),
                ),
                Positioned(
                  right: 24.0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: theme.colorScheme.secondaryFixed,
                        border: Border.all(color: theme.primaryColor),
                        borderRadius: BorderRadius.circular(100)
                    ),
                    width: 11,
                    height: 11,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}