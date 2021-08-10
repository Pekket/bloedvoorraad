import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../constants.dart' as Constants;

import '../model/blood_type.dart';
import '../screen/family_overview.dart';
import '../screen/settings.dart';
import '../screen/user_profile.dart';
import '../user_provider.dart';

class AppDrawer extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
           DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (context.read<UserProvider>().bloodType as BloodType).name,
                  style: TextStyle( fontSize: 72),
                ),
                Spacer(),

                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    primary: Constants.BLACK_COLOR,
                  ),
                  onPressed: () => Navigator.pushNamed(context, UserProfile.id),
                  child: Row(
                    children: [
                        Text(AppLocalizations.of(context)!.drawerChangeBloodType),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                )
              ],
            )
          ),
          ListTile(
            leading: Icon(Icons.family_restroom),
            title: Text(AppLocalizations.of(context)!.drawerFamily),
            onTap: () => Navigator.popAndPushNamed(context, FamilyOverview.id),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(AppLocalizations.of(context)!.drawerSettings),
            onTap: () => Navigator.popAndPushNamed(context, AppSettings.id),
          ),
        ],
      ),
    );
  }
}
