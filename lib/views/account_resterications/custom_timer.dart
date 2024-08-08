import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

class Custom3DCircularTimer extends StatefulWidget {
  @override
  _Custom3DCircularTimerState createState() => _Custom3DCircularTimerState();
}

class _Custom3DCircularTimerState extends State<Custom3DCircularTimer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(minutes: 2),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String get timeString {
    Duration duration = _controller.duration! * _controller.value;
    return '${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.2;
    var theme = Theme.of(context);
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _Circular3DTimerPainter(_controller.value, context),
          size: Size(size, size),
          child: Center(
            child: largeText(
              title: timeString,
              color: theme.primaryColor,
            ),
          ),
        );
      },
    );
  }
}

class _Circular3DTimerPainter extends CustomPainter {
  final double progress;
  final BuildContext context;
  _Circular3DTimerPainter(this.progress, this.context);

  @override
  void paint(Canvas canvas, Size size) {
    var theme = Theme.of(context);
    Paint baseCirclePaint = Paint()
      ..color = theme.colorScheme.surfaceContainerHighest
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0; // Adjust stroke width as needed

    Paint progressCirclePaint = Paint()
      ..shader = LinearGradient(
        colors: [theme.colorScheme.secondary, theme.colorScheme.secondary],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0; // Adjust stroke width as needed

    Paint shadowPaint = Paint()
      ..color = theme.primaryColor.withOpacity(0.3)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12.0; // Slightly larger than progress circle

    double arcAngle = 2 * pi * progress;
    // Draw shadow arc with slight offset
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2 + 2, size.height / 2 + 2), radius: size.width / 2),
      -pi / 2,
      arcAngle,
      false,
      shadowPaint,
    );

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2, baseCirclePaint);

    // Draw actual progress arc on top of shadow arc
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2),
      -pi / 2,
      arcAngle,
      false,
      progressCirclePaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
