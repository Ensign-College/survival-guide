import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    final settings = await _firebaseMessaging.requestPermission(
      announcement: true,
      carPlay: true,
      criticalAlert: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      final fCMToken = await _firebaseMessaging.getToken();
      if (kDebugMode) {
        //Use this if you want to add your device for testings on Firebase.
        print('Token for testing: $fCMToken');
      }
    }
  }
}
