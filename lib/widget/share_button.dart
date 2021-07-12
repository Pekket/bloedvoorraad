import 'package:flutter/material.dart';
import 'package:share/share.dart';

import '../constants.dart' as Constants;

class ShareButton extends StatelessWidget {

  void _shareMessage() async => await Share.share(Constants.SHARE_MESSAGE);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _shareMessage,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(Constants.SHARE_BTN_LABEL),
          SizedBox(
            width: 5,
          ),
          Icon(Icons.share),
        ],
      ),
    );
  }
}
