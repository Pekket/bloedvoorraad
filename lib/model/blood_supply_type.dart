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

  //TODO why this?
  String get typeLabel {
    return type.name;
  }

  String get statusLabel {
    return status.label;
  }

  List<BloodType> get canDonate {
    return type.canDonate;
  }

  List<BloodType> get canReceive {
    return type.canReceive;
  }

  String get statusDescription {
    return status.description;
  }

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
