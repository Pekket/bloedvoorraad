import 'package:flutter/material.dart';

import 'blood_supply_status.dart';
import 'blood_type.dart';

class BloodSupply {
  late BloodType type;
  late BloodSupplyStatus status;

  BloodSupply.json(Map<String, dynamic> json) {
    type = BloodType.values.firstWhere((e) => e.serverName == json['type']);
    status =
        BloodSupplyStatus.values.firstWhere((e) => e.name == json['status']);
  }

  String get typeLabel =>type.name;
  List<BloodType> get canDonate => type.canDonate;
  List<BloodType> get canReceive => type.canReceive;

  String statusLabel(BuildContext context) => status.label(context);
  String statusDescription(BuildContext context) => status.description(context);

  Color get statusColor {
    switch (status) {
      case BloodSupplyStatus.kritisch:
        return Colors.red;
      case BloodSupplyStatus.laag:
        return Colors.orange;
      default:
        return Colors.greenAccent;
    }
  }
}
