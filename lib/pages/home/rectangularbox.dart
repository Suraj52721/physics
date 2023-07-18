import 'package:flutter/material.dart';
import 'package:physics/pages/home/card.dart';
import 'package:physics/pages/home/header.dart';
import 'package:physics/pages/home/timetable.dart';
import 'package:physics/pages/home/practicals.dart';
import 'package:physics/pages/home/books.dart';
import 'package:animate_do/animate_do.dart';
import 'package:physics/services/quotes.dart';

class Rbox extends StatefulWidget {
  const Rbox({super.key});
  quotes() async {
    var randQuote = await Quotes().getQuote();
    return randQuote;
   }

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
          image: DecorationImage(
            image: AssetImage('assets/images/iron_home.png'),
            fit: BoxFit.cover,
          ),
          ),
        child:  SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 40),
              const Header(),
              Column(
                children: [
                  const SizedBox(height: 20),
                  Text('Quote of the day',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ),),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width*0.8,
                    padding: const EdgeInsets.all(10),
                    decoration:  BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Color.fromARGB(255, 83, 8, 129).withOpacity(0.35),
                      border: Border.all(color: Colors.black,width: 1),
                      borderRadius: BorderRadius.circular(10),

                    ),
                    child: FutureBuilder(
                    future: widget.quotes(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),);
                      } else if (snapshot.hasError) {
                        return Text('An error occurred',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),);
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                                  ),
                  ),]
              ),
              SizedBox(
              height: 50,
              child: Container(
                margin: const EdgeInsets.only(left: 20, bottom: 10),
                //padding: const EdgeInsets.only(top: 80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    
                    ZoomIn(
                      child: Text(
                        'Select an option below to get started',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
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
                FadeInLeft(child: const Cardbox(text: 'Syllabus')),
                FadeInUp(
                  child: Container(
                      decoration: BoxDecoration(
                      color: Color.fromARGB(0, 39, 4, 105).withOpacity(0.35),
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                      ),
                      shape: BoxShape.rectangle,
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
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ),
                )
        
        
                ],
              ),
        
              FadeInRight(
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                      color: Color.fromARGB(0, 39, 4, 105).withOpacity(0.35),
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                      ),
                      shape: BoxShape.rectangle,
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
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ),
              
                    FadeInUp(
                      child: Container(
                        decoration: BoxDecoration(
                      color: Color.fromARGB(0, 39, 4, 105).withOpacity(0.35),
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                      ),
                      shape: BoxShape.rectangle,
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
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ),
                    )
              
              
                  ],
                ),
              ),
            ],
          ),
              
            ],
          ),
        ),
        );
  }
}



