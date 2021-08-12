import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../constants.dart' as Constants;

class ShareButton extends StatelessWidget {
  void _shareMessage(BuildContext context) async => await Share.share(AppLocalizations.of(context)!.shareMessage + Constants.SHARE_URL);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _shareMessage(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppLocalizations.of(context)!.shareBtnLabel),
          SizedBox(
            width: 5,
          ),
          Icon(Icons.share),
        ],
      ),
    );
  }
}
