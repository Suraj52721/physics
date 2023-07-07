import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:physics/pages/signuppage.dart';
import 'package:physics/services/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:physics/pages/home.dart';
import 'package:physics/services/snackbar.dart';

class LoginPage extends StatefulWidget{
 LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
      @override
      Widget build(BuildContext context){
        void signInUser() async {
    FirebaseAuthMethods(FirebaseAuth.instance).signInWithEmailAndPassword(
      emailController.text.trim(),
      passwordController.text.trim(),
      context,);
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Home(title: 'Physics')));
      }
    });
  }
        return Scaffold(
          appBar: null,
          body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF081035),
          image: const DecorationImage(
            image: AssetImage('images/space_login.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
                  width: MediaQuery.of(context).size.width*0.8,
                  height: MediaQuery.of(context).size.height*0.6,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  color: Color.fromARGB(255, 19, 2, 58).withOpacity(0.35),
                  borderRadius: BorderRadius.circular(20),
                  ),
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1, left: MediaQuery.of(context).size.width*0.1, right: MediaQuery.of(context).size.width*0.1),
                  //width: MediaQuery.of(context).size.width*0.5,
                  //height: MediaQuery.of(context).size.height*0.7,
                  child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05, left: 30, right: 30),
              child: const Text('Login', 
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 30, color: Colors.white),),
            ),
            Container(
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.only(top: 20,left: 30, right: 30),
              child:TextField(
              controller: emailController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white),
                
              ),),
            ),
            Container(
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.only(top: 10,left: 30, right: 30),
              child:TextField(
              obscureText: true,
              controller: passwordController,
               style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white),
              ),),
            ),
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: (){
                if(emailController.text.trim().isEmpty || passwordController.text.trim().isEmpty){
                  showSnackBar(context, 'Please fill all the fields');
                }
                else if(passwordController.text.trim().length < 6){
                  showSnackBar(context, 'Password must be at least 6 characters');
                }
                else if(!emailController.text.trim().contains('@')){
                  showSnackBar(context, 'Please enter a valid email');
                }
                else{
                ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Wait Loging In....'),duration: Duration(seconds: 1),));
                signInUser();}},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF081035),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
              text: 'Don\'t have an account? ',
              style: TextStyle(color: Colors.white),
              children: [
                TextSpan(
                  text: 'Sign Up',
                  style: TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()..onTap = (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
                  },
                )
              ]
            )
            )
          ],
                  )
                  ),
        )
        )
    );
  }
}