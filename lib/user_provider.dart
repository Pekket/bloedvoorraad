import 'package:flutter/material.dart';

import '../model/blood_type.dart';
import '../service/local_storage_service.dart';
import '../service/notification_service.dart';

class UserProvider extends ChangeNotifier {
  Locale _locale = Locale('nl');
  BloodType? _bloodType;
  bool _notificationEnabled = true;

  Locale get locale => _locale;
  bool get notificationEnabled => _notificationEnabled;
  BloodType? get bloodType => _bloodType;

  Future init() async {
    await LocalStorage.getSavedLocale().then((locale) {
      this.updateLocale(locale);
    });

    await LocalStorage.getSavedNotificationsEnabled().then((enabled) {
      _notificationEnabled = enabled ?? true;
    });

    await LocalStorage.getSavedBloodType().then((bt) {
      updateBloodType(bt);
    }).onError((error, stackTrace) {
      updateBloodType(null);
    });
  }

  void updateLocale(Locale? locale) {
    if (locale != null) {
      this._locale = locale;
      notifyListeners();
    }
  }

  void updateNotificationEnabled() async {
    if (_notificationEnabled)
      this._notificationEnabled = false;
    else
      await NotificationService.requestPermission().then((notificationEnabled) => this._notificationEnabled = notificationEnabled);

    notifyListeners();

    LocalStorage.saveNotificationEnabled(_notificationEnabled);
    this._refreshTopic();
  }

  void updateBloodType(BloodType? bloodType) {
    LocalStorage.saveBloodType(bloodType);
    this._bloodType = bloodType;
    notifyListeners();

    this._refreshTopic();
  }

  void _refreshTopic() {
    NotificationService.unsubscribeFromTopic();

    if (this._notificationEnabled && this._bloodType != null) NotificationService.subscribeToTopic(this._bloodType!.serverName);
  }
}
