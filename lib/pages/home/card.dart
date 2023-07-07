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
    return Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(0, 39, 4, 105).withOpacity(0.35),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                    ),
                    shape: BoxShape.rectangle,
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
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                );
  }

  
}