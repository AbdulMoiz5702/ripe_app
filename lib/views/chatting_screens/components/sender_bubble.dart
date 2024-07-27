import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/new_colors.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
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
  final String month;
  final bool monthbool;

  ChatBubble({
    required this.message,
    required this.timestamp,
    required this.isSender,
    this.month = 'yesterday',
     this.monthbool  = false,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 18.0),
        child: Column(
          children: [
            monthbool ? Container(

              width: MediaQuery.of(context).size.width*0.2,
              decoration: BoxDecoration(
                  color: lightgreyColorinchattingdayfield,
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: normalText(
                    title: month,
                    textSize: 12.0,
                    color: primaryTextColor
                  ),
                ),
              ),
            ) :
                Container(width: 0, height: 0,),
            Row(
              mainAxisAlignment:
              isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                Material(
                  elevation: 7.0,
                  shadowColor: isSender ? Colors.black45 :Colors.black45,
                  color: transparentColor,
                  borderRadius: BorderRadius.circular(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!isSender)
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: CustomPaint(
                            size: Size(6, 8),
                            painter: BubbleTrianglePainter(
                              isSender: isSender,
                              color: whiteColor,
                            ),
                          ),
                        ),

                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isSender ? lightPrimaryTextColor : whiteColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end, // Ensures the text aligns correctly
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            normalText(
                             title:  message,
                                color: isSender ? Colors.white : Colors.black,
                              weight: FontWeight.w400,
                              textSize: 14.0

                            ),
                            CustomSized(height: 0.006,),
                            normalText(
                              title: '${timestamp.hour}:${timestamp.minute}',

                                color: isSender ? Colors.white70 : Colors.black54,
                                weight: FontWeight.w400,
                                textSize: 12.0

                            ),
                          ],
                        ),
                      ),
                      if (isSender)
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: CustomPaint(
                            size: Size(6, 8),
                            painter: BubbleTrianglePainter(
                              isSender: isSender,
                              color: lightPrimaryTextColor,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
