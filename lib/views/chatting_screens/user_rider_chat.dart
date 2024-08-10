import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/new_colors.dart';
import 'package:ride_app/controllers/chat_provider.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/custom_leading.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import 'package:ride_app/views/chatting_screens/components/sender_bubble.dart';
import '../../alert_dialogs/selection_alert_dialg.dart';
import '../../resubale_widgets/call_button.dart';

// Main Chat Screen
class UserRiderChatScreen extends StatefulWidget {

  const UserRiderChatScreen({super.key});

  @override
  State<UserRiderChatScreen> createState() => _UserRiderChatScreenState();
}

class _UserRiderChatScreenState extends State<UserRiderChatScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        leading: CustomLeading(),
        elevation: 1.8,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: lightbackgroundpaperColor,
              child: Image.asset(
                'assets/images/person.png',
              ),
            ),
            CustomSized(width: 0.02),
            smallText(
              title: 'Peter Dian',
              weight: FontWeight.w700,
              color: theme.primaryColor,
            ),

          ],
        ),
        actions: [
          Row(
            children: [
              CallButton(theme: theme,id: '3',name: 'Moiz',color: theme.primaryColor,),
              CustomSized(width: 0.05),
              PopupMenuButton<int>(
                color: theme.scaffoldBackgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)
                ),
                icon: SvgPicture.asset('assets/svg_pictures/menu.svg',color: theme.primaryColor,),
                itemBuilder: (context) => [
                  PopupMenuItem<int>(
                    value: 0,
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          SvgPicture.asset(
                              'assets/svg_pictures/bookmark_icon.svg',color: theme.primaryColor,),
                          CustomSized(width: 0.02),
                          smallText(
                            title: 'Saved as favorite',
                            color: theme.primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: InkWell(
                      onTap: () {
                        AlertDialogClass().showChatRepostAlertDialog(context);
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/svg_pictures/flag.svg',color: theme.colorScheme.secondaryFixed,),
                          CustomSized(width: 0.02),
                          normalText(
                            title: 'Report Chat',
                            color: theme.colorScheme.secondaryFixed,
                            weight: FontWeight.w400,
                            textSize: 14.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              CustomSized(width: 0.03),
            ],
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                ChatBubble(
                  message: "Where are you exactly?",
                  timestamp: DateTime.now().subtract(Duration(minutes: 10)),
                  isSender: false,
                  monthbool: true,
                  month: 'Yesterday',
                ),
                ChatBubble(
                  message: "Giga mall",
                  timestamp: DateTime.now().subtract(Duration(minutes: 5)),
                  isSender: true,
                ),
                ChatBubble(
                  message: "Will be there in 5",
                  timestamp: DateTime.now(),
                  isSender: true,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
                    child: Material(
                      elevation: 7.0,
                      shadowColor: Colors.black45,
                      color: transparentColor,
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(width: 8.0, color: theme.colorScheme.inversePrimary),
                        ),
                        child: Image.asset('assets/images/chatbackimage.jpg',isAntiAlias: true,),
                      ),
                    ),
                  ),
                ),
                ChatBubble(
                  message: "I'm here!!",
                  timestamp: DateTime.now(),
                  isSender: false,
                ),
                CustomSized(
                  width: 0.01,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0, left: 20.0, right: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Consumer<ChatProvider>(builder: (context,provider,_){
                  return TextFormField(
                    cursorColor: theme.primaryColor,
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      hintText: 'Type your message',
                      hintStyle: TextStyle(
                        color: theme.primaryColor,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Nunito Sans',
                      ),
                      suffixIcon: InkWell(
                        hoverColor: lightgreyColor,
                        onTap: () {
                          provider.pickImageFromGallery();
                        },
                        child: SvgPicture.asset(
                          'assets/svg_pictures/galleryicon.svg',
                          color: theme.primaryColor,
                        ),
                      ),
                      fillColor: theme.colorScheme.surfaceContainerHighest,
                      filled: true,
                      // focusColor: dividerColor,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: transparentColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: transparentColor)),
                    ),
                  );
                })),
                CustomSized(
                  width: 0.03,
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: theme.primaryColor,
                  child: SvgPicture.asset(
                    'assets/svg_pictures/PaperPlaneRight.svg',
                    color: theme.colorScheme.inversePrimary,
                  ),
                ),
                CustomSized(
                  width: 0.03,
                ),
              ],
            ),
          ),
          CustomSized(
            height: 0.01,
          )
        ],
      ),
    );
  }
}

