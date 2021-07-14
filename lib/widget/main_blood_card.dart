import 'package:flutter/material.dart';

import '../model/blood_supply_type.dart';
import '../screen/blood_type_overview.dart';

class MainBloodCard extends StatelessWidget {
  final BloodSupply _bloodSupply;
  final bool _clickable;

  const MainBloodCard(this._bloodSupply, this._clickable);

  void _onNavigate(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BloodTypeOverview(_bloodSupply),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 8,
      color: _bloodSupply.statusColor,
      child: InkWell(
        onTap: _clickable ? () => _onNavigate(context) : null,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    _bloodSupply.typeLabel,
                    style: TextStyle(color: Colors.white, fontSize: 48),
                  ),
                  SizedBox(width: 24),
                  Expanded(
                    child: Text(
                      _bloodSupply.statusLabel,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _bloodSupply.statusDescription,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  _clickable
                      ? Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                          size: 32,
                        )
                      : SizedBox.shrink()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
