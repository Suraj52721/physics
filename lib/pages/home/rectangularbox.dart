import 'package:flutter/material.dart';
import 'package:physics/pages/home/card.dart';
import 'package:physics/pages/home/header.dart';
import 'package:physics/pages/home/timetable.dart';
import 'package:physics/pages/home/practicals.dart';
import 'package:physics/pages/home/books.dart';

class Rbox extends StatefulWidget {
  const Rbox({super.key});

  @override
  State<Rbox> createState() => _RboxState();
}

class _RboxState extends State<Rbox> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF081035),
          ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10),
            const Header(),
            SizedBox(
            height: 150,
            child: Container(
              margin: const EdgeInsets.only(left: 20, bottom: 10),
              //padding: const EdgeInsets.only(top: 80),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  
                  Text(
                    'Select an option below to get started',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )),
            Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
              const Cardbox(text: 'Syllabus'),
              Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                    )
                  ),
                  child: InkWell(
                    splashColor: Colors.orange,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Books(),
                        ),
                      );
                    },
                    child: const SizedBox(
                      width: 150,
                      height: 150,
                      
                      child: Center(
                        child: Text(
                          'Books',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF081035),
                          ),
                        ),
                      ),
                    ),
                  )
                )


              ],
            ),

            Column(
              children: <Widget>[
                Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                    )
                  ),
                  child: InkWell(
                    splashColor: Colors.orange,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Practicals(),
                        ),
                      );
                     
                    },
                    child: const SizedBox(
                      width: 150,
                      height: 150,
                      
                      child: Center(
                        child: Text(
                          'Practicals',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF081035),
                          ),
                        ),
                      ),
                    ),
                  )
                ),

                Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                    )
                  ),
                  child: InkWell(
                    splashColor: Colors.orange,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TimeTable(),
                        ),
                      );
                      
                    },
                    child: const SizedBox(
                      width: 150,
                      height: 150,
                      
                      child: Center(
                        child: Text(
                          'Time Table',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF081035),
                          ),
                        ),
                      ),
                    ),
                  )
                )


              ],
            ),
          ],
        ),
            
          ],
        ),
        );
  }
}



