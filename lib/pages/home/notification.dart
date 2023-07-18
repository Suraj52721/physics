import 'package:flutter/material.dart';


class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});
  

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}


class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: const Color(0xFF081035),
      ),
      body: Container(
        alignment: Alignment.center,
        child: const Text('No New Notification', style: TextStyle(fontSize: 25),),
      ),
    );
  }
}