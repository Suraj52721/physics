import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:physics/pages/loginpage.dart';
import 'package:physics/services/firebase_auth.dart';


class Profile extends StatefulWidget {
   Profile({super.key});
  
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
    final userName= FirebaseAuth.instance.currentUser!.displayName;
    final userEmail= FirebaseAuth.instance.currentUser!.email;
    //final userPhoto= FirebaseAuth.instance.currentUser!.photoURL;
    return Scaffold(
      appBar: null,
      body:Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF081035),
          
        ),
        child: SingleChildScrollView(
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
                height: 10,
              ),
              
              Text(
                'Your Email: $userEmail',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width*0.8,
                height: 100,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 246, 245, 248).withOpacity(0.35),
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Thank you for using our app! \n We hope you are enjoying it\n We wish you a good day!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
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
                child: Text('Log Out'),),
                const SizedBox(
                height: 10,
              ),
                Text('Click Here to Log Out',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.1,
              ),
              
               
          
            ]
          ),
        ),
      )
    );
  }
}