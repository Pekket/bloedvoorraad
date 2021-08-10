import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../constants.dart' as Constants;

import '../model/blood_type.dart';
import '../screen/blood_overview.dart';
import '../user_provider.dart';
import '../widget/type_chooser.dart';

class UserProfile extends StatefulWidget {
  static String id = "user_profile";

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  BloodType? _tmpBloodType;

  @override
  void initState() {
    super.initState();

    _tmpBloodType = context.read<UserProvider>().bloodType;
  }

  void _handleBloodType(BloodType bloodType) =>
      setState(() => _tmpBloodType = bloodType);

  void _saveProfile() async {
    Provider.of<UserProvider>(context, listen: false).updateBloodType(_tmpBloodType!);

    Navigator.of(context).pushNamedAndRemoveUntil(
        BloodTypesOverview.id, (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(Constants.PROFILE_BACKGROUND),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.profileTitle),
        leading: Container(),
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
              AppLocalizations.of(context)!.profileChooseBloodType,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Expanded(
              child: BloodTypeChooser(_tmpBloodType, _handleBloodType),
            ),
            ElevatedButton(
              onPressed: _tmpBloodType != null ? _saveProfile : null,
              child: Text(
                AppLocalizations.of(context)!.save,
              ),
            ),
            Text(AppLocalizations.of(context)!.profilePrivacy),
          ],
        ),
      ),
    );
  }
}
