import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
      @override
      Widget build(BuildContext context){
        return Scaffold(
          appBar: null,
          body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xFF081035),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
          width: MediaQuery.of(context).size.width*0.8,
          height: MediaQuery.of(context).size.height*0.6,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
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
                style: TextStyle(fontSize: 30, color: Colors.black),),
              ),
              Container(
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.only(top: 20,left: 30, right: 30),
                child:TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                  labelText: 'Email',
                ),),
              ),
              Container(
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.only(top: 10,left: 30, right: 30),
                child:TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                  labelText: 'Password',
                ),),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.only(top: 150, left: 30, right: 30),
                child: ElevatedButton(
                  onPressed: (){
                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF081035),
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  child: const Text('Submit'),
                ),
              ),
            ],
          )
          ),
          ],
        )
        )
    );
  }
}