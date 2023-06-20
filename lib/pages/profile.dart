import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:physics/pages/loginpage.dart';
import 'package:physics/services/firebase_auth.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  void logOutUser() async {
    await FirebaseAuthMethods(FirebaseAuth.instance).signOut(context);
  }
  

  @override
  Widget build(BuildContext context) {
    navigatorN(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
    };
    final userName= FirebaseAuth.instance.currentUser!.email!.split('@')[0];
    return Scaffold(
      appBar: null,
      body:Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF081035),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: Icon(
                Icons.person,
                size: 100,
                color: Colors.white,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text('Hello, $userName',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.1,
            ),
            ElevatedButton(
              onPressed: () {  
              if (FirebaseAuth.instance.currentUser == null){
                navigatorN();
              }else{
                logOutUser();
                navigatorN();
              }
              },
              child: Text('Log Out'),)
        
          ]
        ),
      )
    );
  }
}