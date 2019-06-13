import 'package:flutter/material.dart';

class TimelineBoxDecoration extends Decoration {
  final bool isFirst, isLast;
  final Color dotColor;
  final Size media;

  TimelineBoxDecoration(this.isFirst, this.isLast, this.dotColor, this.media);

  @override
  BoxPainter createBoxPainter([onChanged]) {
    return TimelinePainter(isFirst, isLast, dotColor, media);
  }
}

class TimelinePainter extends BoxPainter {
  final bool isFirst, isLast;
  final Color dotColor;
  final Size media;

  TimelinePainter(this.isFirst, this.isLast, this.dotColor, this.media);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final linePaint = Paint()
      ..color = Color(0xFFDFDFDF)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;
    final circlePaint = Paint()
      ..color = dotColor ?? Colors.grey
      ..style = PaintingStyle.fill;

    final bool target = media.height > 600;

    final leftOffset = configuration.size.topCenter(Offset(target ? 17.0 : 20.0, 40.0));
    final top = configuration.size.topCenter(Offset(target ? 17.0 : 20.0, -24.0));

    final Offset center =
        configuration.size.centerLeft(Offset(leftOffset.dx, leftOffset.dy * 5));
    final Offset end =
        configuration.size.bottomLeft(Offset(leftOffset.dx, leftOffset.dy));

    // LINE isFirst & Middle
    if (!isLast) canvas.drawLine(center, end, linePaint);

    // LINE isLast
    canvas.drawLine(leftOffset, top, linePaint);

    // Dot Circle
    final Offset offsetCenter = configuration.size.centerLeft(leftOffset);
    canvas.drawCircle(offsetCenter, 8.0, circlePaint);
  }
}
