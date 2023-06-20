import 'package:flutter/material.dart';
import 'package:physics/pages/home/syllabus.dart';

class Cardbox extends StatefulWidget {
  final String text;
  
  const Cardbox({super.key, required this.text});

  @override
  State<Cardbox> createState() => _CardboxState();
}

class _CardboxState extends State<Cardbox> {
  @override
  Widget build(BuildContext context) {
    return Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                    )
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Syllabus(),
                        ),
                      );
                      
                    },
                    splashColor: Colors.orange,
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      
                      child: Center(
                        child: Text(
                          '${widget.text}',
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF081035),
                          ),
                        ),
                      ),
                    ),
                  )
                );
  }

  
}