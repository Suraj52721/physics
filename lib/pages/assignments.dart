import 'package:flutter/material.dart';

class Assignments extends StatefulWidget {
  const Assignments({super.key});

  @override
  State<Assignments> createState() => _AssignmentsState();
}

class _AssignmentsState extends State<Assignments> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xFF081035),
      child: Stack(
        children: [Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: const Text(
            'You have no assignments due!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            onPressed: () {
              
            },
            child: const Icon(Icons.add),
          ),
        ),
        ]
      ),
    );
  }
}