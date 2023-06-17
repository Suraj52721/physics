import 'package:flutter/material.dart';

class Syllabus extends StatefulWidget {
  const Syllabus({super.key});

  @override
  State<Syllabus> createState() => _SyllabusState();
}

class _SyllabusState extends State<Syllabus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syllabus'),
      ),
      body: Container(
        child: const Center(
          child: Text(
            'Syllabus',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}

