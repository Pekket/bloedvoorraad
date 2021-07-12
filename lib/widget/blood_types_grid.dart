import 'package:flutter/material.dart';
import 'package:rodekruis/model/blood_type.dart';

class BloodTypesGrid extends StatelessWidget {
  final String _label;
  final List<BloodType> _bloodTypes;

  const BloodTypesGrid(this._bloodTypes, this._label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              _label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          GridView.count(
            primary: false,
            crossAxisSpacing: 4,
            crossAxisCount: 8,
            padding: EdgeInsets.all(2),
            shrinkWrap: true,
            children: _bloodTypes.map((BloodType type) {
              return Card(
                elevation: 2,
                margin: EdgeInsets.zero,
                child: Center(
                  child: Text(
                    type.name,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
