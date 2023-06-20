import 'package:flutter/material.dart';

class Syllabus extends StatefulWidget {
  const Syllabus({super.key});

  @override
  State<Syllabus> createState() => _SyllabusState();
}

class _SyllabusState extends State<Syllabus> {
  Color customColor = Color(0xFF081035);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customColor,
        title: const Text('Syllabus'),
      ),
      body: const Center(
          child: Text(
            'Syllabus',
            style: TextStyle(fontSize: 24),
          ),
        ),
     
    );
  }
}

