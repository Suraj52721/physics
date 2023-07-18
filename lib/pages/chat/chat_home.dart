import 'package:flutter/material.dart';
import 'package:physics/pages/chat/chat_list.dart';
import 'package:physics/pages/chat/group_page.dart';
import 'package:physics/pages/chat/search.dart';


class ChatHome extends StatefulWidget {
  const ChatHome({super.key});

  @override
  State<ChatHome> createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  int _selectedIndex = 0;
  List pages=[
    ChatList(),
    GroupPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(children: [
            Container(
              width: double.infinity,
              height: 50,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF081035),
              ),
              child: Row(
                children: [
                  Text('Chats',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Colors.white),),
                  Spacer(),
                  IconButton(
                    onPressed: (){
                      showSearch(context: context, delegate: Search());
                    },
                    icon: Icon(Icons.search,color: Colors.white,),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFF081035),
              ),
              child: NavigationBar(
                selectedIndex: _selectedIndex,
                onDestinationSelected: (int index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
                destinations: const <NavigationDestination>[
                  NavigationDestination(
                    icon: Icon(Icons.chat),
                    selectedIcon: Icon(Icons.chat),
                    label: 'Chat',
              
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.person),
                    selectedIcon: Icon(Icons.person),
                    label: 'Groups',
                  ),
                ],
              ),
               ),
            Expanded(
              child: pages[_selectedIndex],
            ),
          ],)
        ),
      ),
      );
  }
}