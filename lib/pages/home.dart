import 'package:flutter/material.dart';
import 'package:physics/pages/home/rectangularbox.dart';
import 'package:physics/pages/loginpage.dart';
import 'package:physics/pages/todo.dart';
import 'package:physics/pages/assignments.dart';


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
    final List< BottomNavigationBarItem> _navbaritems = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
        backgroundColor: Color(0xFF081035),
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.book),
        label: 'Assignments',
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
    final List<Widget> _pages = [
      Rbox(),
      Assignments(),
      ToDo(),
      LoginPage(),
    ];
    assert(_pages.length == _navbaritems.length);




    return Scaffold(
      appBar: null,
      drawer: new Drawer(
        backgroundColor: const Color.fromARGB(255, 23, 5, 89),
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: const Text('User Name'),
              accountEmail: const Text('user@email'),
    ),],),),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 23, 5, 89),
        items: _navbaritems,
        currentIndex: _currentindextab,
        onTap: (int index) {
          setState(() {
            _currentindextab = index;
          });
        },
        ),
      body: _pages[_currentindextab], 
      );
  }
}