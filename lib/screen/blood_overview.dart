import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../constants.dart' as Constants;

import '../screen/user_profile.dart';
import '../service/blood_supply_service.dart';
import '../widget/blood_card.dart';
import '../widget/drawer.dart';
import '../widget/main_blood_card.dart';
import '../widget/loader.dart';
import '../user_provider.dart';

class BloodTypesOverview extends StatefulWidget {
  static String id = "bloodtypes_overview";

  @override
  _BloodTypesOverviewState createState() => _BloodTypesOverviewState();
}

class _BloodTypesOverviewState extends State<BloodTypesOverview> {
  void _handleProfileNavigate() => WidgetsBinding.instance!.addPostFrameCallback((_) {
        Navigator.pushNamed(context, UserProfile.id);
      });

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _bloodType = context.read<UserProvider>().bloodType;

    if (_bloodType == null) _handleProfileNavigate();

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
      ),
      body: FutureBuilder(
          future: BloodSupplyService.fetchData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData && _bloodType != null) {
              return ListView(
                padding: EdgeInsets.all(32.0),
                children: [
                  MainBloodCard(snapshot.data.firstWhere((el) => el.type == _bloodType), true),
                  SizedBox(height: 20),
                  ...snapshot.data.where((el) => el.type != _bloodType).map((el) => BloodCard(el)).toList(),
                ],
              );
            }
            if (snapshot.hasError) {
              ScaffoldMessenger.of(context).showSnackBar(_snackBar);
            }
            return Loader(_size.height * 0.3);
          }),
    );
  }

  SnackBar get _snackBar => SnackBar(
        backgroundColor: Constants.PRIMARY_COLOR,
        content: Text(
          AppLocalizations.of(context)!.bloodSupplyFetchError,
          style: TextStyle(fontSize: 16, color: Constants.WHITE_COLOR),
        ),
      );
}
