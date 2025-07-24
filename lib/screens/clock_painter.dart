import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  final DateTime date;

  ClockPainter(this.date);

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.white
          ..strokeWidth = 10
          ..style = PaintingStyle.stroke;

    final paintSecond = Paint();
    paintSecond.color = Colors.blue;
    paintSecond.style = PaintingStyle.stroke;
    paintSecond.strokeWidth = 8;

    final paintMinute = Paint();
    paintMinute.color = Colors.red;
    paintMinute.style = PaintingStyle.stroke;
    paintMinute.strokeWidth = 8;

    final paintHour = Paint();
    paintHour.color = Colors.amber;
    paintHour.style = PaintingStyle.stroke;
    paintHour.strokeWidth = 8;

    final paintLine = Paint();
    paintLine.color = Colors.orange;
    paintLine.style = PaintingStyle.stroke;
    paintLine.strokeWidth = 10;

    final second = date.second;
    final minute = date.minute;
    final hour = date.hour;
    final startX = size.width / 2;
    final startY = size.height / 2;

    final endXSecond = size.width / 2 + sin((pi / 30) * second) * 140;
    final endYSecond = 150 - cos((pi / 30) * second) * 140;

    final endXMinute = size.width / 2 + sin((pi / 30) * minute) * 120;
    final endYMinute = 150 - cos((pi / 30) * minute) * 120;

    final endXHour = size.width / 2 + sin((pi / 30) * hour) * 100;
    final endYHour = 150 - cos((pi / 30) * hour) * 100;

    canvas.drawLine(
      Offset(startX, startY),
      Offset(endXSecond, endYSecond),
      paintSecond,
    );
    canvas.drawLine(
      Offset(startX, startY),
      Offset(endXMinute, endYMinute),
      paintMinute,
    );

    canvas.drawLine(
      Offset(startX, startY),
      Offset(endXHour, endYHour),
      paintHour,
    );
    canvas.drawCircle(Offset(startX, startY), 3, paint);
  }

  @override
  bool shouldRepaint(covariant ClockPainter oldPainter) {
    return oldPainter.date != date;
  }
}
