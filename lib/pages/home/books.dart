import 'package:flutter/material.dart';

class Books extends StatefulWidget {
  const Books({super.key});

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  Color customColor = Color(0xFF081035);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customColor,
        title: const Text('Books'),
      ),
      body: const Center(
        child: Text(
          'Books',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}