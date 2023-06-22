import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  final _getval = TextEditingController();
  final _tasks= <String>[];
  @override
  initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _tasks.addAll(prefs.getStringList('tasks') ?? []);
    });}

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('tasks', _tasks);
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xFF081035),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40,),
          const Text(
            'Your  ToDo\'s  Here',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 50,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              
              controller: _getval,
              decoration:  const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  
                ),
                labelText: 'Enter your task',
              ),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _tasks.add(_getval.text);
                _saveData();
              });
            },
            child: const Text('Add'),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return Card(
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Task'),
                            content: Text('Your Task: ${_tasks[index]}'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: ListTile(
                    title: Text('Task ${index+1} : ${_tasks[index]}'),
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          _tasks.removeAt(index);
                          _saveData();
                        });

                      },
                      icon: const Icon(Icons.delete, color: Color(0xFF081035),),
                    ),
                  ),
                  )
                );
              },
            ),
          ),


        ],
      ),
    )
    
    );
  }
}