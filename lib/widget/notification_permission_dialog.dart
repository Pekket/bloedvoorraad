import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:app_settings/app_settings.dart';

class PermissionDialog extends StatelessWidget {

  void _openSettings(BuildContext context) {
    Navigator.pop(context);
    AppSettings.openNotificationSettings();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: new Text(AppLocalizations.of(context)!.settingsDialogPopup),
      actions: <Widget>[
        TextButton(
          child: Text(AppLocalizations.of(context)!.cancel,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: Text(AppLocalizations.of(context)!.openSettings),
          onPressed: () => _openSettings(context),
        ),
      ],
    );
  }
}
