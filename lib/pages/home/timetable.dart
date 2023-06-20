import 'package:flutter/material.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({super.key});

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  Color customColor = Color(0xFF081035);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customColor,
        title: const Text('TimeTable'),
      ),
      body: const Center(
        child: Text(
          'TimeTable',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}