import 'package:flutter/material.dart';

class DottedLine extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;

  DottedLine({required this.color, required this.strokeWidth, required this.gap});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + strokeWidth, 0), paint);
      startX += strokeWidth + gap;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class DottedDivider extends StatelessWidget {
  final double height;
  final Color color;
  final double strokeWidth;
  final double gap;

  DottedDivider({
    this.height = 1,
    this.color = Colors.black,
    this.strokeWidth = 2,
    this.gap = 4,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return CustomPaint(
      painter: DottedLine(color: theme.dividerColor, strokeWidth: strokeWidth, gap: gap),
      child: SizedBox(
        height: height,
        width: double.infinity,
      ),
    );
  }
}