import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:physics/pages/loginpage.dart';
import 'package:physics/services/firebase_auth.dart';
import 'package:flutter/gestures.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});


  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cnfrmpasswordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();


  void signUpUser() async {
    await FirebaseAuthMethods(FirebaseAuth.instance).createUserWithEmailAndPassword(
      nameController.text.trim(),
      emailController.text.trim(),
      passwordController.text.trim(),
      context);
      if (await FirebaseAuth.instance.currentUser != null) {
        FirebaseAuth.instance.signOut();
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
        color: const Color(0xFF081035),
        image: const DecorationImage(
          image: AssetImage('images/space_signup.jpeg'),
          fit: BoxFit.cover,
        ),),
        
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width*0.8,
            height: MediaQuery.of(context).size.height*0.6,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 11, 2, 33).withOpacity(0.35),
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1,
            left: MediaQuery.of(context).size.width*0.1, 
            right: MediaQuery.of(context).size.width*0.1),
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
                  child: const Text('Sign Up', 
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 30, color: Colors.white),),
                ),
                Container(
                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.only(top: 20,left: 30, right: 30),
                  child:TextField(
                  controller: nameController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.white),
                  ),),
                ),
                Container(
                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.only(top: 10,left: 30, right: 30),
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
                Container(
                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.only(top: 10,left: 30, right: 30),
                  child:TextField(
                  obscureText: true,
                  controller: cnfrmpasswordController,
                   style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    labelText: 'Confirm Password',
                    labelStyle: TextStyle(color: Colors.white),
                  ),),
                ),

                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () async{
                      if (await FirebaseAuth.instance.currentUser != null) {
                      FirebaseAuth.instance.signOut();
                      signUpUser();}
                      else if (nameController.text.isEmpty || emailController.text.isEmpty || passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please fill all the fields')));
                      }
                      else if (passwordController.text != cnfrmpasswordController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Passwords do not match')));
                      }
                      else if (passwordController.text.length < 6) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Password must be at least 6 characters')));
                      }
                      else if (!emailController.text.contains('@')) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please enter a valid email')));
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Wait Signing Up....'),duration: Duration(seconds: 1),));
                          signUpUser();}
                    },
                    child: const Text('Sign Up'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF081035),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                child: RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(color: Colors.white),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pop(context);
                          },
                      ),
                    ],
                  ),
                ),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}