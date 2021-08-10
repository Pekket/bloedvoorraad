import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      ScaffoldMessenger.of(context).showSnackBar(_snackBar(context));
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
            BloodTypesGrid(_bloodSupply.canDonate, AppLocalizations.of(context)!.bloodSupplyCanDonate),
            BloodTypesGrid(_bloodSupply.canReceive, AppLocalizations.of(context)!.bloodSupplyCanReceive),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () => _launchAppointment(context),
                child: Text(AppLocalizations.of(context)!.appointmentBtnLabel),
              ),
            ),
            ShareButton()
          ],
        ),
      ),
    );
  }

  SnackBar _snackBar(BuildContext context) => SnackBar(
      backgroundColor: Colors.red,
      content: Text(
        AppLocalizations.of(context)!.appointmentBtnError,
        style: TextStyle(fontSize: 16),
      ),
    );
}
