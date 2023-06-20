import 'package:flutter/material.dart';
import 'package:physics/pages/loginpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:physics/pages/home.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  

  runApp(const Physics());
}

class Physics extends StatefulWidget {
  const Physics({super.key});

  @override
  State<Physics> createState() => _PhysicsState();
}

class _PhysicsState extends State<Physics> {
  checkLogin(){
    if (FirebaseAuth.instance.currentUser == null){
      return LoginPage();
    }else{
      return Home(title: 'Home');}
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Physics',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: checkLogin(),
    );
  }
}


