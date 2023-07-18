import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:physics/pages/chat/chat_page.dart';
import 'package:physics/pages/chat/services/shared_pref.dart';

class Search extends SearchDelegate {
  final firebaseref = FirebaseFirestore.instance.collection('users');
  
  
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        query = '';
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    SharedPref sharedPrefs = SharedPref();
    
    return FutureBuilder(
      future: firebaseref.where('email', isEqualTo: query).get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot data = snapshot.data!.docs[index];

              return InkWell(
                onTap: () {

                   sharedPrefs.addData(data['email']);
                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatPage(
                        receiverName: data['name'],
                        // receiverUid: data['uid'],
                        receiverEmail: data['email'],
                      ),
                    ),
                  );
                },
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.blue,
                  ),
                  title: Text(data['name']),
                  subtitle: Text(data['email']),
                  trailing: Text('Time'),
                ),
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    SharedPref sharedPrefs = SharedPref();
    
    return FutureBuilder(
      future: firebaseref.where('email', isEqualTo: query).get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot data = snapshot.data!.docs[index];

              return InkWell(
                onTap: () {

                   sharedPrefs.addData(data['email']);
                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatPage(
                        receiverName: data['name'],
                        // receiverUid: data['uid'],
                        receiverEmail: data['email'],
                      ),
                    ),
                  );
                },
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.blue,
                  ),
                  title: Text(data['name']),
                  subtitle: Text(data['email']),
                  trailing: Text('Time'),
                ),
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}