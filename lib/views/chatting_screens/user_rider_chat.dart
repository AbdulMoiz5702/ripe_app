import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/new_colors.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/circle_avatar_widget.dart';
import 'package:ride_app/resubale_widgets/custom_leading.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import 'package:ride_app/views/chatting_screens/calls/outgoing_call_screen.dart';
import 'package:ride_app/views/chatting_screens/components/sender_bubble.dart';

// Main Chat Screen
class UserRiderChatScreen extends StatelessWidget {
  const UserRiderChatScreen({super.key});

  // Function to pick image from gallery
  Future<void> _pickImageFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      // Handle the selected image
      print('Image path: ${image.path}');
    }
  }


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: backgroundpaperColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        automaticallyImplyLeading: false,
        // scrolledUnderElevation: 10.0,
        elevation: 1.8,
        // shadowColor: primaryTextColor,

        title: Row(
          children: [
            CustomLeading(
            ),
            CustomSized(width: 0.03),
            CircleAvatar(
              backgroundColor: lightbackgroundpaperColor,
              child: Image.asset(
                'assets/images/person.png',
              ),
            ),
            CustomSized(width: 0.02),
            normalText(
              title: 'Peter Dian',
              weight: FontWeight.w700,
              textSize: 14.0,
              color: primaryTextColor,
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              InkWell(

                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => UserCallScreen()));
                  },
                  child
                  : SvgPicture.asset('assets/svg_pictures/call.svg')),
              CustomSized(width: 0.05),
              PopupMenuButton<int>(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)
                ),
                icon: SvgPicture.asset('assets/svg_pictures/menu.svg'),
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                  PopupMenuItem<int>(
                    value: 0,
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          SvgPicture.asset(
                              'assets/svg_pictures/bookmark_icon.svg'),
                          CustomSized(width: 0.02),
                          normalText(
                            title: 'Saved as favorite',
                            color: primaryTextColor,
                            weight: FontWeight.w400,
                            textSize: 14.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: InkWell(
                      onTap: () {
                        onSelected(context, 1);
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/svg_pictures/flag.svg'),
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(width: 8.0, color: whiteColor),
                        ),
                        child: Image.asset('assets/images/chatbackimage.jpg'),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.78,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: TextFormField(
                    cursorColor: primaryTextColor,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type your message',
                      hintStyle: TextStyle(
                        color: primaryTextColor,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Nunito Sans',
                      ),
                      suffixIcon: InkWell(
                        hoverColor: lightgreyColor,
                        onTap: () {
                          _pickImageFromGallery();
                        },
                        child: SvgPicture.asset(
                          'assets/svg_pictures/galleryicon.svg',
                        ),
                      ),
                      fillColor: lightgreyColorinchattingfield,
                      filled: true,
                      // focusColor: dividerColor,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(color: transparentColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(color: transparentColor)),
                    ),
                  ),
                ),
                CustomSized(
                  width: 0.01,
                ),
                CircleAvatar(
                  backgroundColor: primaryTextColor,
                  child: SvgPicture.asset(
                    'assets/svg_pictures/PaperPlaneRight.svg',
                  ),
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
  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
      // Handle menu item 1 action
        print('Menu Item 1 selected');
        break;
      case 1:
      // Handle menu item 2 action
        showDialog(
          context: context,
          builder: (BuildContext context) {

            return AlertDialog(
              titlePadding:  EdgeInsets.only(left: 20, top: 20.0, right: 20.0),
              contentPadding: EdgeInsets.only(left: 20, top: 4.0, right: 20.0, bottom: 6.0),
              actionsPadding:  EdgeInsets.only(left: 0, top: 4.0, right: 20.0, bottom: 15.0),
              backgroundColor: backgroundpaperColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)
              ),

              title: largeText(
                title: 'Report Chat',
                textSize: 18.0,
                weight: FontWeight.w700,
              ),
              content: normalText(
                  title: 'Are you sure you want to report this chat?',
                  textSize: 14.0,
                  weight: FontWeight.w400,
                  color: secondaryTextColor),

              actions: <Widget>[
                SecondaryCustomButton(
                  title: 'Cancel',
                  onBoard: false,
                  onTap: () {},
                  titleColor: primaryTextColor,
                  width: 0.2,
                  borderRadius: 25.0,
                  textsize: 15,
                  weight: FontWeight.w700,
                  color: lightgreyColorinchattingfield,
                ),
                SecondaryCustomButton(
                  title: 'Report Chat',
                  onBoard: false,
                  borderRadius: 25.0,
                  titleColor: whiteColor,
                  onTap: () {},
                  width: 0.3,
                  textsize: 15,
                  weight: FontWeight.w700,
                  color: primaryTextColor,
                ),
              ],

            );
          },
        );
        break;
    }
  }

}
