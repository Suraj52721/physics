import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class StorageService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<String> uploadFile(String path, File file,String name) async {
    final ref = _firebaseStorage.ref('$path/${name}');
    final uploadTask = ref.putFile(file);
    final snapshot = await uploadTask.whenComplete(() => null);
    final downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  //get list of files
  Future<List<String>> getFiles(String path) async {
    final ref = _firebaseStorage.ref(path);
    final result = await ref.listAll();
    final urls = <String>[];
    for (final ref in result.items) {
      final url = await ref.getDownloadURL();
      urls.add(url);
    }
    return urls;
  }
  //get file names
  Future<List<String>> getNames(String path) async {
    final ref = _firebaseStorage.ref(path);
    final result = await ref.listAll();
    final names = <String>[];
    for (final ref in result.items) {
      final name = ref.name;
      names.add(name);
    }
    return names;
  }
 


  //download file from firebase storage to local storage
  Future<void> downloadFile(String url,context) async {
    final ref = _firebaseStorage.refFromURL(url);
    final bytes = await ref.getData();
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/download1.pdf');
    await file.writeAsBytes(bytes!);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('File Downloaded'),
      ),
    );
   
  }

  //open the downloaded file
  

  
  
}