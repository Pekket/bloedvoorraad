import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart' as Constants;
import '../model/blood_supply_type.dart';
import '../model/blood_type.dart';
import '../screen/user_profile.dart';
import '../service/blood_supply_service.dart';
import '../service/local_storage_service.dart';
import '../widget/blood_card.dart';
import '../widget/main_blood_card.dart';

class BloodTypesOverview extends StatefulWidget {
  static String id = "bloodtypes_overview";

  @override
  _BloodTypesOverviewState createState() => _BloodTypesOverviewState();
}

class _BloodTypesOverviewState extends State<BloodTypesOverview> {
  bool _loading = true;
  BloodType? _bloodType;
  List<BloodSupply> _bloodSupplies = [];

  @override
  void initState() {
    super.initState();
    _getUserProfile();
  }

  void _getUserProfile() async {
    LocalStorage.getSavedBloodType().then((bt) {
      if (bt == null)
        Navigator.pushNamed(context, UserProfile.id);
      else
        _fetchData(bt);
    });
  }

  Future _fetchData(BloodType? bloodType) =>
      BloodSupplyService.fetchData().then((data) => {
            setState(() {
              _bloodType = bloodType;
              _loading = false;
              _bloodSupplies = data;
            })
          })
  .catchError((error) {ScaffoldMessenger.of(context).showSnackBar(_snackBar);});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Bloedvoorraad'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, UserProfile.id),
            icon: Icon(CupertinoIcons.person),
          )
        ],
      ),
      body: !_loading
          ? RefreshIndicator(
              onRefresh: () => _fetchData(_bloodType),
              child: ListView(
                padding: EdgeInsets.all(32.0),
                children: [
                  MainBloodCard(
                      _bloodSupplies.firstWhere((el) => el.type == _bloodType),
                      true),
                  SizedBox(height: 20),
                  ..._bloodSupplies
                      .where((el) => el.type != _bloodType)
                      .map((el) => BloodCard(el))
                      .toList()
                ],
              ),
            )
          : Container(
              height: size.height * 0.3,
              padding: EdgeInsets.all(80.0),
              child: Center(
                child: Image.asset(
                  Constants.LOADING_IMAGE,
                ),
              ),
            ),
    );
  }

  SnackBar get _snackBar => SnackBar(
    backgroundColor: Colors.red,
    content: Text(
      Constants.BLOODSUPPLY_FETCH_ERROR,
      style: TextStyle(fontSize: 16, color: Colors.white),
    ),
  );
}
