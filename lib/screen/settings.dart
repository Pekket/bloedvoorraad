import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../user_provider.dart';

class AppSettings extends StatelessWidget {
  static String id = "app_settings";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.settingsTitle)),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _notificationsSetting(context),
          SizedBox(height: 16),
          _languageSetting(context),
        ],
      ),
    );
  }

  Widget _notificationsSetting(BuildContext context) => SwitchListTile(
        title: Text(
          AppLocalizations.of(context)!.settingsNotificationsEnable,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(AppLocalizations.of(context)!.settingsNotificationsSub),
        onChanged: (_) => Provider.of<UserProvider>(context, listen: false).updateNotificationEnabled(),
        value: Provider.of<UserProvider>(context).notificationEnabled,
      );

  Widget _languageSetting(BuildContext context) => Column(
        children: [
          ListTile(
            title: Text(
              AppLocalizations.of(context)!.settingsLanguageTitle,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          RadioListTile<Locale>(
            dense: true,
            title: const Text('Nederlands'),
            value: Locale('nl'),
            groupValue: Provider.of<UserProvider>(context).locale,
            controlAffinity: ListTileControlAffinity.trailing,
            onChanged: Provider.of<UserProvider>(context).updateLocale,
          ),
          RadioListTile<Locale>(
            dense: true,
            title: const Text('Français'),
            value: Locale('fr'),
            groupValue: Provider.of<UserProvider>(context).locale,
            controlAffinity: ListTileControlAffinity.trailing,
            onChanged: Provider.of<UserProvider>(context).updateLocale,
          ),
          RadioListTile<Locale>(
            dense: true,
            title: const Text('English'),
            value: Locale('en'),
            groupValue: Provider.of<UserProvider>(context).locale,
            controlAffinity: ListTileControlAffinity.trailing,
            onChanged: Provider.of<UserProvider>(context).updateLocale,
          )
        ],
      );
}
