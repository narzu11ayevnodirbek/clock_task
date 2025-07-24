import 'dart:async';

import 'package:clock_task/screens/clock_painter.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DateTime date;

  @override
  void initState() {
    super.initState();
    date = DateTime.now();

    Timer.periodic(Duration(seconds: 1), (_) {
      date = DateTime.now();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final String hour = date.hour.toString().padLeft(2, "0");
    final String minute = date.minute.toString().padLeft(2, "0");
    final String second = date.second.toString().padLeft(2, "0");
    return Scaffold(
      backgroundColor: Color(0xFF2b2f41),
      appBar: AppBar(
        title: Text(
          "Custom clock",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 20,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 10),
                ),
                child: CustomPaint(
                  size: Size(300, 300),
                  painter: ClockPainter(date),
                ),
              ),
            ),
            Text(
              "$hour : $minute : $second",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
