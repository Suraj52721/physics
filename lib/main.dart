import 'package:flutter/material.dart';
import 'package:physics/pages/loginpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:physics/pages/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:physics/pages/home/storage_services/notification_service.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //To use this app in web uncomment this
    /*options: const FirebaseOptions(
      appId: '1:218254275995:android:f19e6200719aed89365d3e',
      messagingSenderId: '1053576780490',
      projectId: 'physics-78e4c',
      apiKey: 'AIzaSyDEdBoau5QDRf83zV6kMvDxuIvdIyyMCgQ',
      databaseURL: 'https://physics-78e4c-default-rtdb.firebaseio.com/',
      storageBucket: 'gs://physics-78e4c.appspot.com',
    ),*/
  );

  await NotificationService().initialise();   //to use this app in web comment this line
  await FirebaseFirestore.instance;
  await FirebaseStorage.instance;

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


