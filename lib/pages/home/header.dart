import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: const BoxDecoration(
        color: Color(0xFF081035),
      ),
      child: Stack(
        children: [Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: const Text(
                'Department of Physics',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
        ),
      
      Positioned(
        top: 7,
        right: 20,
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications,
            color: Colors.white,
          ),
        ),
      ),
      Positioned(
        top: 7,
        left: 20,
        child: GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: SvgPicture.asset("assets/images/nucleus.svg", 
          width: 40, 
          height: 40, 
          ),
        ),),
      ],
    ));
  }
}