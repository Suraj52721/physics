import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String receiverName;
  final String receiverEmail;
  // final String receiverUid;
  const ChatPage({required this.receiverName,required this.receiverEmail/*,required this.receiverUid*/});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverName),
        backgroundColor: const Color(0xFF081035),
        
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: Container()),
            Container(
              width: double.infinity,
              height: 50,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: const Color(0xFF081035),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Type a message',
                        hintStyle: TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.send,color: Colors.white,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}