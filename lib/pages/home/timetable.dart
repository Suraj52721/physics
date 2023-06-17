import 'package:flutter/material.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({super.key});

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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