import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart' as Constants;

import '../model/blood_supply_type.dart';
import '../widget/blood_types_grid.dart';
import '../widget/share_button.dart';
import '../widget/main_blood_card.dart';

class BloodTypeOverview extends StatelessWidget {
  static String id = "bloodtype_overview";

  final BloodSupply _bloodSupply;

  const BloodTypeOverview(this._bloodSupply);

  _launchAppointment(BuildContext context) async {
    if (await canLaunch(Constants.APPOINTMENT_URL)) {
       await launch(Constants.APPOINTMENT_URL);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(_snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            MainBloodCard(_bloodSupply, false),
            BloodTypesGrid(_bloodSupply.canDonate, Constants.BLOODSUPPLY_CAN_DONATE),
            BloodTypesGrid(_bloodSupply.canReceive, Constants.BLOODSUPPLY_CAN_RECEIVE),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () => _launchAppointment(context),
                child: Text(Constants.APPOINTMENT_BTN_LABEL),
              ),
            ),
            ShareButton()
          ],
        ),
      ),
    );
  }

  SnackBar get _snackBar => SnackBar(
      backgroundColor: Colors.red,
      content: Text(
        Constants.APPOINTMENT_ERROR_MESSAGE,
        style: TextStyle(fontSize: 16),
      ),
    );
}
