import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart' as Constants;

class InfoBottomSheet extends StatelessWidget {

  _launchGithub(BuildContext context) async {
    if (await canLaunch(Constants.CODE_GITHUB_URL)) {
      await launch(Constants.CODE_GITHUB_URL);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
      children: [
        Center(
          child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.red,
              )),
        ),
        _textSection(Constants.PRIVACY_TITLE, Constants.PRIVACY_DESCRIPTION),
        _textSection(Constants.DATA_TITLE, Constants.DATA_DESCRIPTION),
        _textSection(Constants.ORG_TITLE, Constants.ORG_DESCRIPTION),
        _textSection(Constants.CODE_TITLE, Constants.CODE_DESCRIPTION),
        IconButton(
            onPressed: () => _launchGithub(context),
            icon: Image.network(Constants.CODE_GITHUB_ICON))
      ],
    );
  }

  Widget _textSection(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2.0),
          Text(description),
        ],
      ),
    );
  }
}
