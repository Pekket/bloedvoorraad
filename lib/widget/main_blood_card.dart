import 'package:flutter/material.dart';

import '../screen/blood_type_overview.dart';
import '../model/blood_supply_type.dart';

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
        onTap: _clickable ? () => _onNavigate(context) : null ,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    flex: 4,
                    fit: FlexFit.tight,
                    child: Text(
                      _bloodSupply.typeLabel,
                      style: TextStyle(color: Colors.white, fontSize: 72),
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    fit: FlexFit.tight,
                    child: Text(
                      _bloodSupply.statusLabel,
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  _clickable ? Flexible(
                    flex: 1,
                    fit: FlexFit.loose,

                    child: Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                      size: 32,
                    ),
                  ) :  SizedBox.shrink(),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                _bloodSupply.statusDescription,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
