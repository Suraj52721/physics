import 'package:flutter/material.dart';

class Practicals extends StatefulWidget {
  const Practicals({super.key});

  @override
  State<Practicals> createState() => _PracticalsState();
}

class _PracticalsState extends State<Practicals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practicals'),
      ),
      body: const Center(
        child: Text(
          'Practicals',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}