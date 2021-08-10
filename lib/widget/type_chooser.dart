import 'package:flutter/material.dart';

import '../constants.dart' as Constants;

import '../model/blood_type.dart';

class BloodTypeChooser extends StatelessWidget {
  final BloodType? _bloodType;
  final Function _handleBloodType;

  BloodTypeChooser(this._bloodType, this._handleBloodType);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: EdgeInsets.all(32),
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      crossAxisCount: 4,
      children: BloodType.values.map((type) {
        return OutlinedButton(
          onPressed: () => _handleBloodType(type),
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 4.0)),
            backgroundColor: type == _bloodType
                ? MaterialStateProperty.all(Constants.PRIMARY_COLOR)
                : MaterialStateProperty.all(Colors.transparent),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
          child: Text(
            type.name,
            style: TextStyle(
                color: type == _bloodType ? Constants.WHITE_COLOR : Constants.PRIMARY_COLOR),
          ),
        );
      }).toList(),
    );
  }
}
