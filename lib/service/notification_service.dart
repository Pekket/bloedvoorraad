import 'package:firebase_messaging/firebase_messaging.dart';

import '../model/blood_type.dart';

class NotificationService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  static Future<bool> requestPermission() async {
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    return settings.authorizationStatus == AuthorizationStatus.authorized;
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
