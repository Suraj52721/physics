import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future initialise() async {
    await _fcm.requestPermission();
    final token = await _fcm.getToken();
    print('FirebaseMessaging token: $token');
    
  }
}