import 'package:rodekruis/model/blood_type.dart';
import 'package:shared_preferences/shared_preferences.dart';

const BLOOD_TYPE_PREFERNCE = "bloodType";
const NOTIFICATION_PREFERNCE = "notificationsEnabled";

class LocalStorage {

  static Future<BloodType?> getSavedBloodType() async {
    final prefs = await sharedPreferencesInstance;
    String? savedBloodType = prefs.getString(BLOOD_TYPE_PREFERNCE);
    return savedBloodType != null ? BloodType.values.firstWhere((e) => e.toString() == savedBloodType) : null;
  }
  static Future<bool?> getSavedNotificationsEnabled() async {
    final prefs = await sharedPreferencesInstance;
    return prefs.getBool(NOTIFICATION_PREFERNCE);
  }

  static void savePreferences(
      BloodType? bloodType, bool notificationsEnabled) async {
    final prefs = await sharedPreferencesInstance;
    prefs.setString(BLOOD_TYPE_PREFERNCE, bloodType.toString());
    prefs.setBool(NOTIFICATION_PREFERNCE, notificationsEnabled);
  }

  static Future<SharedPreferences> get sharedPreferencesInstance {
    return SharedPreferences.getInstance();
  }
}
