import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:physics/pages/loginpage.dart';
import 'package:physics/services/firebase_auth.dart';
import 'package:physics/services/quotes.dart';

class Profile extends StatefulWidget {
   Profile({super.key});
   quotes() async {
    var randQuote = await Quotes().getQuote();
    return randQuote;
   }
  
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
                height: MediaQuery.of(context).size.height*0.1,
              ),
              Column(
                children: [
                  Text('Quote of the day',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),),
                  Container(
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