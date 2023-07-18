import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:physics/services/snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  Future<void> signInWithEmailAndPassword(
       String email, String password,BuildContext context) async {
    try {
       await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      showSnackBar(context, 'Logged in successfully');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  Future<void> createUserWithEmailAndPassword(
      String name,String email, String password,BuildContext context) async {
    try {
        await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
        await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
    await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).set({
      'name': name,
      'email': email,
      'password': password,
    });
      showSnackBar(context, 'Account created successfully');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      showSnackBar(context, 'Logged out successfully');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }





}