import 'dart:ui';

import 'package:flutter/material.dart';

class MyCustomPainter extends CustomPainter {
  final List<Offset?> points;
  final List<Color?> traces;
  Color brushColor = Colors.white;

  MyCustomPainter(this.points, this.traces);

  @override
  void paint(Canvas canvas, Size size) {
    Paint background = Paint()..color = Colors.black;
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, background);

    Paint paint = Paint();
    paint.strokeWidth = 3.0;
    paint.isAntiAlias = true;
    paint.strokeCap = StrokeCap.round;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] == null) continue;
      paint.color = traces[i]!;
      if (points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      } else {
        canvas.drawPoints(PointMode.points, [points[i]!], paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
