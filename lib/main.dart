import 'package:flutter/material.dart';
import 'package:physics/pages/home.dart';

void main() {
  runApp(const Physics());
}

class Physics extends StatefulWidget {
  const Physics({super.key});

  @override
  State<Physics> createState() => _PhysicsState();
}

class _PhysicsState extends State<Physics> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Physics',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(title: 'Physics'),
    );
  }
}