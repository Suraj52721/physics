import 'package:flutter/material.dart';
import 'package:physics/pages/home/rectangularbox.dart';
import 'package:physics/pages/profile.dart';
import 'package:physics/pages/todo.dart';
import 'package:physics/pages/chatgpt/home_page.dart';



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
    final List< BottomNavigationBarItem> navbaritems = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
        backgroundColor: Color(0xFF081035),
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.chat),
        label: 'Assistant',
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
      const HomePage(),
      const ToDo(),
      Profile(),
    ];
    assert(pages.length == navbaritems.length);




    return Scaffold(
      appBar: null,
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 23, 5, 89),
        child: ListView(
          children: const <Widget>[
             UserAccountsDrawerHeader(
              accountName: Text('User Name'),
              accountEmail: Text('user@email'),
    ),],),),
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