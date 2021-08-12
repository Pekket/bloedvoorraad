import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/blood_type.dart';
import '../model/family_member.dart';

const BLOOD_TYPE_PREFERNCE = "bloodType";
const LOCALE_PREFERENCE = "locale";
const NOTIFICATION_PREFERNCE = "notificationsEnabled";
const FAMILY_MEMBERS = "familyMembers";

class LocalStorage {
  static Future<BloodType?> getSavedBloodType() async {
    final prefs = await sharedPreferencesInstance;
    String? savedBloodType = prefs.getString(BLOOD_TYPE_PREFERNCE);
    return savedBloodType != null ? BloodType.values.firstWhere((e) => e.toString() == savedBloodType) : null;
  }

  static Future<Locale> getSavedLocale() async {
    final prefs = await sharedPreferencesInstance;
    String? localeString = prefs.getString(LOCALE_PREFERENCE);
    return Locale(localeString ?? 'nl');
  }

  static Future<bool?> getSavedNotificationsEnabled() async {
    final prefs = await sharedPreferencesInstance;
    return prefs.getBool(NOTIFICATION_PREFERNCE);
  }

  static Future<List<FamilyMember>> getFamilyMembers() async {
    final prefs = await sharedPreferencesInstance;
    List<String>? familyMemberList = prefs.getStringList(FAMILY_MEMBERS);
    return familyMemberList != null ? familyMemberList.map((e) => FamilyMember.fromJson(json.decode(e))).toList() : [];
  }

  static void saveBloodType(BloodType? bloodType) async {
    final prefs = await sharedPreferencesInstance;
    prefs.setString(BLOOD_TYPE_PREFERNCE, bloodType.toString());
  }

  static void saveNotificationEnabled(bool notificationsEnabled) async {
    final prefs = await sharedPreferencesInstance;
    prefs.setBool(NOTIFICATION_PREFERNCE, notificationsEnabled);
  }

  static void saveLocale(Locale locale) async {
    final prefs = await sharedPreferencesInstance;
    prefs.setString(LOCALE_PREFERENCE, locale.languageCode);
  }

  static void saveFamilyMembers(List<FamilyMember> familyMembers) async {
    final prefs = await sharedPreferencesInstance;
    prefs.setStringList(FAMILY_MEMBERS, familyMembers.map((e) => jsonEncode(e.toJson())).toList());
  }

  static Future<SharedPreferences> get sharedPreferencesInstance {
    return SharedPreferences.getInstance();
  }
}
