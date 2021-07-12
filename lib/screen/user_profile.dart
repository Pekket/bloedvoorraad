import 'package:flutter/material.dart';

import '../constants.dart' as Constants;
import '../model/blood_type.dart';
import '../screen/blood_overview.dart';
import '../service/local_storage_service.dart';
import '../widget/type_chooser.dart';

class UserProfile extends StatefulWidget {
  static String id = "user_profile";

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool _notificationsEnabled = false;
  BloodType? _bloodType;

  @override
  void initState() {
    super.initState();

    LocalStorage.getSavedBloodType().then((bt) {
      setState(() {
        _bloodType = bt;
      });
    });

    LocalStorage.getSavedNotificationsEnabled().then((enabled) {
      setState(() {
        _notificationsEnabled = enabled ?? false;
      });
    });
  }

  void _handleCheckbox() =>
      setState(() => _notificationsEnabled = !_notificationsEnabled);

  void _handleBloodType(BloodType bloodType) =>
      setState(() => _bloodType = bloodType);

  void _saveProfile() async {
    LocalStorage.savePreferences(_bloodType, _notificationsEnabled);

    Navigator.of(context).pushNamedAndRemoveUntil(
        BloodTypesOverview.id, (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(Constants.PROFILE_BACKGROUND),
      appBar: AppBar(
        title: Text('Profiel'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Container(
              height: size.height * 0.3,
              padding: EdgeInsets.only(bottom: 32),
              child: Image.asset(
                Constants.PROFILE_IMAGE,
              ),
            ),
            Text(
              Constants.PROFILE_CHOOSE_BLOODTYPE,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Expanded(
              child: BloodTypeChooser(_bloodType, _handleBloodType),
            ),
            CheckboxListTile(
              title: Text(Constants.PROFILE_ENABLE_NOTIFICATIONS),
              onChanged: (_) => _handleCheckbox(),
              value: _notificationsEnabled,
            ),
            ElevatedButton(
              onPressed: _bloodType != null ? _saveProfile : null,
              child: Text(
                Constants.SAVE,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
