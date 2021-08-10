import 'package:flutter/material.dart';

import '../constants.dart' as Constants;

import '../model/blood_supply_type.dart';
import '../screen/blood_type_overview.dart';

class BloodCard extends StatelessWidget {
  final BloodSupply _bloodSupply;

  const BloodCard(this._bloodSupply);

  void _onNavigate(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BloodTypeOverview(_bloodSupply),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: _bloodSupply.statusColor,
      child: InkWell(
        onTap: () => _onNavigate(context),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 32, right: 16, bottom: 32, left: 32),
          child: Row(
            children: [
              Text(
                _bloodSupply.typeLabel,
                style: TextStyle(color: Constants.WHITE_COLOR, fontSize: 32),
              ),
              Spacer(),
              Text(
                _bloodSupply.statusLabel(context),
                style: TextStyle(color: Constants.WHITE_COLOR, fontSize: 16),
              ),
              Icon(
                Icons.navigate_next,
                color: Constants.WHITE_COLOR,
                size: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
