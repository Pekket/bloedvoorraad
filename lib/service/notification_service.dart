import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../model/blood_type.dart';
import '../widget/notification_permission_dialog.dart';

class NotificationService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  static Future<bool> requestPermission(BuildContext? context) async {
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    bool isAuthorized = settings.authorizationStatus == AuthorizationStatus.authorized;

    if(Platform.isIOS && !isAuthorized && context != null)
      showDialog(context: context, builder: (BuildContext context) => PermissionDialog());

    return isAuthorized;
  }

  static void unsubscribeFromTopic() {
    //TODO There must be a better way 🤔
    print("Unsubscribing to topics");
    BloodType.values.forEach((type) {
      _messaging.unsubscribeFromTopic(type.serverName);
    });
  }

  static void subscribeToTopic(String topic) {
    print("Subscribing to topic $topic");
    _messaging.subscribeToTopic(topic);
  }
}
