import 'package:flutter/material.dart';
import 'package:physics/pages/home/rectangularbox.dart';
import 'package:physics/pages/loginpage.dart';
import 'package:physics/pages/profile.dart';
import 'package:physics/pages/todo.dart';
import 'package:physics/pages/chat/chat_home.dart';
import 'package:firebase_auth/firebase_auth.dart';



class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
    int _currentindextab = 0;
   

  @override
  Widget build(BuildContext context) {
     final userName= FirebaseAuth.instance.currentUser!.displayName;
    final userEmail= FirebaseAuth.instance.currentUser!.email;
    final List< BottomNavigationBarItem> navbaritems = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
        backgroundColor: Color(0xFF081035),
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.chat),
        label: 'Chat',
        backgroundColor: Color(0xFF081035),
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.event),
        label: 'ToDos',
        backgroundColor: Color(0xFF081035),
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
        backgroundColor: Color(0xFF081035),
      ),
    ];
    final List pages = [
      const Rbox(),
      const ChatHome(),
      const ToDo(),
      Profile(),
    ];
    assert(pages.length == navbaritems.length);




    return Scaffold(
      appBar: null,
      drawer: Drawer(
        backgroundColor: const Color(0xFF081035),
        child: ListView(
          children:  <Widget>[
            
             UserAccountsDrawerHeader(
              accountName: Text('$userName',style: TextStyle(color: Colors.white,fontSize: 25)),
              accountEmail: Text('$userEmail',style: TextStyle(color: Colors.white,fontSize: 25)),
    ),
            ListTile(
              title: const Text('Home',style: TextStyle(color: Colors.white,fontSize: 25)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Home(title: 'Home')));
              },
            ),
            ListTile(
              title: const Text('Chat',style: TextStyle(color: Colors.white,fontSize: 25)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatHome()));
              },
            ),
            ListTile(
              title: const Text('ToDos',style: TextStyle(color: Colors.white,fontSize: 25)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ToDo()));
              },
            ),
            ListTile(
              title: const Text('Profile',style: TextStyle(color: Colors.white,fontSize: 25)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
              },
            ),
            ListTile(
              title: const Text('Logout',style: TextStyle(color: Colors.blue,fontSize: 25)),
              onTap: () {
                Navigator.pop(context);
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
         
      // appBar: AppBar(
      //   title: Text(widget.title),
      //   backgroundColor: const Color(0xFF081035),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: const Icon(Icons.logout),
      //       onPressed: () {
      //         FirebaseAuth.instance.signOut();
      //         Navigator.push(context, MaterialPageRoute(builder: (context) => const Rbox()));
      //       },
      //     ),
      //   ],
      // ),
      // body: const Center(child: Text('Home Page', style: TextStyle(fontSize: 25),),),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: const Color.fromARGB(255, 23, 5, 89),
      //   items: navbaritems,
      //   currentIndex: _currentindextab,
      //   onTap: (int index) {
      //     setState(() {
      //       _currentindextab = index;
      //     });
      //   },
      //   ),
      // body: pages[_currentindextab], 
      // );
      // appBar: AppBar(
      //   title: Text(widget.title),
      //   backgroundColor: const Color(0xFF081035),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: const Icon(Icons.logout),
      //       onPressed: ()
    ],),),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 23, 5, 89),
        items: navbaritems,
        currentIndex: _currentindextab,
        onTap: (int index) {
          setState(() {
            _currentindextab = index;
            
          });
        },
        ),
      body: pages[_currentindextab], 
      );
  }
}