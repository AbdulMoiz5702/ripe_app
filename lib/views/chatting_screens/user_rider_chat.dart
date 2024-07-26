import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/custom_leading.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

// Custom painter to draw the triangle
class BubbleTrianglePainter extends CustomPainter {
  final bool isSender;
  final Color color;

  BubbleTrianglePainter({required this.isSender, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path();
    if (isSender) {
      path.moveTo(0, 0);
      path.lineTo(size.width, size.height / 2);
      path.lineTo(0, size.height);
    } else {
      path.moveTo(size.width, 0);
      path.lineTo(0, size.height / 2);
      path.lineTo(size.width, size.height);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

// Modified ChatBubble widget
class ChatBubble extends StatelessWidget {
  final String message;
  final DateTime timestamp;
  final bool isSender;

  ChatBubble({
    required this.message,
    required this.timestamp,
    required this.isSender,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Row(
          mainAxisAlignment:
          isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if (!isSender)
              Material(
                elevation: 5,
                shadowColor: Colors.black,
                child: CustomPaint(
                  size: Size(10, 10),
                  painter: BubbleTrianglePainter(
                    isSender: isSender,
                    color: whiteColor,
                  ),
                ),
              ),
            Material(
              elevation: 5,
              shadowColor: isSender ? Colors.black45 : Colors.black,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isSender ? lightPrimaryTextColor : whiteColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      message,
                      style: TextStyle(
                        color: isSender ? Colors.white : Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '${timestamp.hour}:${timestamp.minute}',
                      style: TextStyle(
                        color: isSender ? Colors.white70 : Colors.black54,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (isSender)
              Material(
                elevation: 5,
                shadowColor: Colors.black45,
                child: CustomPaint(
                  size: Size(10, 10),
                  painter: BubbleTrianglePainter(
                    isSender: isSender,
                    color: lightPrimaryTextColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Main Chat Screen
class UserRiderChatScreen extends StatelessWidget {
  const UserRiderChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundpaperColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 5.0,
        leading: const CustomLeading(),
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: lightbackgroundpaperColor,
              child: Image.asset(
                'assets/images/person.png',
              ),
            ),
            SizedBox(width: 10),
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
              SvgPicture.asset('assets/svg_pictures/call_icon.svg'),
              CustomSized(width: 0.05),
              SvgPicture.asset('assets/svg_pictures/menu.svg'),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          ChatBubble(
            message: "Where are you exactly?",
            timestamp: DateTime.now().subtract(Duration(minutes: 10)),
            isSender: false,
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
        ],
      ),
    );
  }
}
