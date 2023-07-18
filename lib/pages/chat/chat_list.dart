import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:physics/pages/chat/chat_page.dart';
import 'package:physics/pages/chat/services/shared_pref.dart';

class ChatList extends StatefulWidget {
   ChatList({super.key});
   

  @override
  State<ChatList> createState() => _ChatListState();
 
}

class _ChatListState extends State<ChatList> {
  String search = '';
  final firebaseref = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    SharedPref sharedPref = SharedPref();
    Future<List<String>> userList = sharedPref.getUserList();
    return FutureBuilder(
      future: userList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          
          String _email= firebaseref.where('email', isEqualTo: snapshot.data![0]).get().toString();
          String _name= firebaseref.where('name').get().toString();

          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              final data = snapshot.data![index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatPage(
                        receiverName: _name,
                        // receiverUid: data['uid'],
                        receiverEmail: _email,
                      ),
                    ),
                  );
                },
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.blue,
                  ),
                  title: Text(data),
                  subtitle: Text('Last Message'),
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